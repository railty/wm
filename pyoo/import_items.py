import subprocess
import signal
import time
import pdb
import json
import pyoo

cmd = 'soffice --accept="socket,host=localhost,port=2002;urp;" --norestore --nologo --nodefault --headless'
soffice = subprocess.Popen(cmd, shell=True)

while True:
    try:
        desktop = pyoo.Desktop('localhost', 2002)
        break
    except:
        print("Waiting ...")
        time.sleep (250.0 / 1000.0)

doc = desktop.open_spreadsheet("905818a_449301407_22CB05BCX5A89X46A2XA93EX230A8E8E34E5.xlsx")
sheet = doc.sheets[0]

rowHeader = 16
colStart = 0
colEnd = 14

headers = []
for iCol in range(colStart, colEnd):
    headers.append(sheet[rowHeader, iCol].value)

print(headers)
iRow = rowHeader + 1
items = []

while True:
    itemValue = sheet[iRow, 0].value
    if not isinstance(itemValue, float):
        break

    item = {}
    for iCol in range(colStart, colEnd):
        v = sheet[iRow, iCol].value
        v = int(v) if headers[iCol] == 'Item Nbr' or headers[iCol] == 'Acct Dept Nbr' else v
        item[headers[iCol]] = v
    items.append(item)
    print(item['Item Nbr'])
    iRow = iRow + 1

#pdb.set_trace()
doc.close()
subprocess.call("kill `ps|grep soffice.bin| awk '{print $1}'`", shell=True)

with open('items.json', 'w') as outfile:
    json.dump(items, outfile, sort_keys=True, indent=4)
