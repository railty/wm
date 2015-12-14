import subprocess
import signal
import time
import pdb
import pyoo

cmd = 'soffice --accept="socket,host=localhost,port=2002;urp;" --norestore --nologo --nodefault' # --headless

soffice = subprocess.Popen(cmd, shell=True)
print(soffice.pid)

while True:
    try:
        desktop = pyoo.Desktop('localhost', 2002)
        break
    except:
        print("Waiting ...")
        time.sleep (250.0 / 1000.0)

print(desktop)
doc = desktop.open_spreadsheet("Week 47 Pricing Guide.xlsx")
print(doc.sheets)

pdb.set_trace()

#sheet = doc.sheets[0]
#sheet = doc.sheets['Al Premium Specific Items']
#if doc.sheets[0][3,11].value == 'WM#'
#p doc.sheets[0][5,11].value
#type(doc.sheets[0][5,11].value) = float
#int(doc.sheets[0][5,11].value)
#p type(doc.sheets[0][344,11].value)

# p isinstance(doc.sheets[0][343,11].value, float)
#True
#(Pdb) p isinstance(doc.sheets[0][344,11].value, float)
#False
#(Pdb) p isinstance(doc.sheets[0][344,11].value, str)
#p doc.sheets[0][340,14].background_color
#16776960
#doc.sheets.copy('My Sheet', 'Copied Sheet', 2)
#doc.sheets.copy('Al Premium Specific Items', 'ALP Worksheet', 4)
#len(doc.sheets)
#doc.save('example.xlsx', pyoo.FILTER_EXCEL_2007)



doc.close()
subprocess.call("kill `ps|grep soffice.bin| awk '{print $1}'`", shell=True)
