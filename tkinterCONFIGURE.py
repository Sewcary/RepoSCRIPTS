# -*- coding: utf-8 -*-
"""
Created on Tue Dec  8 16:49:34 2020


@author: ZT5549
"""
from tkinter import * 

tw=Tk()
# tw.configure (bg= 'light blue')
L= 420 
l = L/1.618 
text = StringVar()
tw.geometry(("%dx%d+300+300") % (L, l))
tl= Label(tw, text =l ,bg="light grey",fg= "white",width = 14, font = 40 ,textvariable = text )
# tl= Label(tw,width = 200 , text = "Get Weather" , font = 40 )
tl.grid (column = 0 , row = 0 ,padx= 20 ,pady = 20  )
print(l)
tw.mainloop() 
