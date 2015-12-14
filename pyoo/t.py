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
doc.close()
subprocess.call("kill `ps|grep soffice.bin| awk '{print $1}'`", shell=True)
