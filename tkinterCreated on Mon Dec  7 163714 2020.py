# -*- coding: utf-8 -*-
"""
Created on Mon Dec  7 16:37:14 2020

@author: ZT5549
"""

from tkinter import * 
class Slider:
    def __init__(self,root):
        self.root = root
        self.root.title("Slider")
        self.root.geometry("1350x700+200+50")

root = Tk()
obj=Slider(root)
f=Frame (root ) 
f.pack ( fill=BOTH)
b= Button(f,width=14 ,text = 'Button')
b.pack()
# b.grid(row=0 ,column = 0 ) 
root.mainloop()

