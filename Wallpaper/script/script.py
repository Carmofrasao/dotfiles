import pyautogui
import os
from PIL import Image, ImageFilter

basewidth = 1400

im0 = pyautogui.screenshot()
im1 = im0.filter(ImageFilter.GaussianBlur(15))
im2 = Image.open(r"/home/anderson/Wallpaper/Elisabeth.png")
wpercent = (basewidth/float(im2.size[0]))
hsize = int((float(im2.size[1])*float(wpercent)))
im2 = im2.resize((basewidth,hsize), Image.LANCZOS)
im1.paste(im2, (0,0), mask = im2)
im1.save('/tmp/scls.png')
os.popen('i3lock -i /tmp/scls.png')
