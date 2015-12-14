import subprocess
import signal
import time
import pdb
import pyoo

def load_data(filename):
    items = {}
    in_file = open(filename, "rt")
    in_line = in_file.readline()
    header = in_line[:-1]
    headers = header.split("\t")

    while True:
        in_line = in_file.readline()
        if not in_line:
            break
        in_line = in_line[:-1]
        data = in_line.split("\t")
        item = {}
        for i in range(0, len(headers)):
            item[headers[i]] = data[i]

        items[int(item['WM'])] = item
    in_file.close()
    return (headers, items)

headers, items = load_data('week47.txt')
#print(items)

cmd = 'soffice --accept="socket,host=localhost,port=2002;urp;" --norestore --nologo --nodefault' # --headless
soffice = subprocess.Popen(cmd, shell=True)
#print(soffice.pid)

while True:
    try:
        desktop = pyoo.Desktop('localhost', 2002)
        break
    except:
        print("Waiting ...")
        time.sleep (250.0 / 1000.0)

#print(desktop)
doc = desktop.open_spreadsheet("Week 47 Pricing Guide.xlsx")
for sheet, worksheet in {'Al Premium Specific Items': 'ALP Worksheet', 'Shared Items - Require Review': 'Shared Worksheet'}.items():
    print(sheet + '-->' + worksheet)
    doc.sheets.copy(sheet, worksheet, len(doc.sheets))

    sheet = doc.sheets[worksheet]

    rowHeader = 3
    colItemNum = 11
    colExtra = 17

    i = 0
    for header in headers:
        sheet[rowHeader, colExtra + i].value = header
        i = i + 1

    iRow = rowHeader + 2    #normally this is +1, this spreadsheet has an extra blank row
    while True:
        itemNum = sheet[iRow, colItemNum].value
        if not isinstance(itemNum, float):
            break
        itemNum = int(itemNum)
        print(itemNum)

        if items.__contains__(itemNum):
            item = items[itemNum]
            i = 0
            for header in headers:
                sheet[iRow, colExtra + i].value = item[header]
                i = i + 1
        iRow = iRow + 1

doc.save('worksheet 47.xlsx', pyoo.FILTER_EXCEL_2007)
#pdb.set_trace()
doc.close()
subprocess.call("kill `ps|grep soffice.bin| awk '{print $1}'`", shell=True)

#p doc.sheets[0][340,14].background_color
