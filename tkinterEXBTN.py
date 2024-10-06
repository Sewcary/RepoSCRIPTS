# -*- coding: utf-8 -*-
"""
Created on Tue Dec  8 16:43:25 2020

@author: ZT5549
"""
from tkinter import * 

r =Tk()
r.geometry("452x254")
b =Button(r,text = 'Button', width=12)
text = StringVar()
b.grid(row= 0 ,column = 0 , padx=15 ,pady = 15 )
e = Entry(r,width = 15)
e.grid(row = 0 ,column = 2 ,padx=15, pady = 15 )
r.mainloop()


