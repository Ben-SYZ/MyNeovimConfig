import time
import os
import sys
import pyperclip

os.system("adb devices")

os.system("scrot -z -s -e 'mv $f ~/Pictures/screenshots/OCR/ocr.png'")

os.system('mv ~/Pictures/screenshots/OCR/ocr.png ~/Documents/mntphone/mnt/Pictures/Screenshots/')
# alive
os.system("adb shell input tap 550 550")
# selec 1
os.system("adb shell input tap 100 100")
# select screenshot
os.system("adb shell input tap 550 550")
# select 1st photo
os.system("adb shell input tap 100 400")
# click the √
os.system("adb shell input tap 1000 100")
# sleep

time.sleep(3)
#copy
os.system("adb shell input tap 550 1800")
#
os.system("adb shell am startservice ca.zgrs.clipper/.ClipboardService")
#os.system("adb shell am broadcast -a clipper.set -e text ''")
content = os.popen("adb shell am broadcast -a clipper.get").read()
#print("==============")
dataPos = content.find("data=\"")
data=content[dataPos+6:-2]


#print(data)
pyperclip.copy(data)
#text = pyperclip.paste()


os.system("adb shell input tap 100 100")
