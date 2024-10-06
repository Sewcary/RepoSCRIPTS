# -*- coding: utf-8 -*-
"""
Created on Thu Dec 10 19:26:17 2020

@author: ZT5549
"""

from tkinter import * 

window = Tk()
window.configure(bg = 'light blue')
window.geometry ('450x220') 

text = StringVar() 

btn1 = Button(window,text= 'COMMAND',width = 14,)
btn1.grid(column = 0 , row= 0 )

label = Label(window , width = 14) 
label.grid (column =  0 , row = 1  )


window.mainloop() 
