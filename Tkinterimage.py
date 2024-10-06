# -*- coding: utf-8 -*-
"""
Created on Fri Dec  4 18:47:08 2020

@author: ZT5549
"""

try:
    # Python2
    import Tkinter as tk
except ImportError:
    # Python3
    import tkinter as tk

root = tk.Tk()
root.title('background image')

# pick a .gif image file you have in the working directory
fname = "C:\\Users\\ZT5549\\Xz2B.gif"
bg_image = tk.PhotoImage(file=fname)
# get the width and height of the image
w ,h= bg_image.width() ,bg_image.height()


# size the window so the image will fill it
root.geometry("%dx%d+50+30" % (w,h))

cv = tk.Canvas(width=w, height=h)
cv.pack(side='top', fill='both', expand='yes')

cv.create_image(0, 0, image=bg_image, anchor='nw')

# add canvas text at coordinates x=15, y=20
# anchor='nw' implies upper left corner coordinates

# now add some button widgets
btn1 = tk.Button(cv, text="Click")
btn1.pack(side='left', padx=10, pady=5, anchor='sw')

btn2 = tk.Button(cv, text="Quit", command=root.destroy)
btn2.pack(side='left', padx=10, pady=5, anchor='sw')

root.mainloop()
