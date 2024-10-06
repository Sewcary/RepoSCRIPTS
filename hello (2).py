# -*- coding: utf-8 -*-
"""
Created on Mon Dec  7 11:46:55 2020

@author: ZT5549
"""

from tkinter import  Tk,Button,Label,DoubleVar,Entry
# WINODW  
window = Tk() 
window.title("Feet to meter conversion App")
window.configure(background = "light green")
window.geometry("320x220")
window.resizable(width=False , height=False)


#label

ft_lbl= Label(window, text ="Feet",bg="purple",fg= "white",width = 14)
ft_lbl.grid(column=0,row=0,padx=15,pady=15)

ft_value = DoubleVar() # tkinter data type  
ft_entry = Entry(window,textvariable = ft_value,width =14 )
ft_entry.grid(column=1,row=0)
ft_entry.delete (0,'end')

ft_lbl= Label(window, text ="Feet",bg="purple",fg= "white",width = 14)
ft_lbl.grid(column=0,row=0,padx=15,pady=15)

ft_value = DoubleVar() # tkinter data type  
ft_entry = Entry(window,textvariable = ft_value,width =14 )
ft_entry.grid(column=1,row=0)
ft_entry.delete (0,'end')





window.mainloop() 

