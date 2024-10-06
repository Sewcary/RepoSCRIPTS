# -*- coding: utf-8 -*-
"""
Created on Mon Dec  7 11:46:55 2020

@author: ZT5549
"""
def convert(): 
    value = float(ft_entry.get())
    meter = value * 0.3048
    mt_value.set ("%.4f"  % meter )

def clear(): 
    ft_value.set("")
    mt_value.set("")
    

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
ft_entry.grid(column = 1,row = 0)
ft_entry.delete (0,'end')

mt_lbl= Label(window, text ="Meter",bg="brown",fg= "white",width = 14)
mt_lbl.grid(column = 0,row = 1,padx=15,pady=15)

mt_value = DoubleVar() # tkinter data type  
mt_entry = Entry(window,textvariable = mt_value,width =14 )
mt_entry.grid(column=1,row=1,pady=30)
mt_entry.delete (0,'end')

convert_btn = Button(window,text = 'Convert' ,width= 14,bg = 'blue',fg='white', command = convert)
convert_btn.grid(column= 0, row=3 ,padx = 15 )

clear_btn = Button(window,text = 'Convert' ,width= 14,bg = 'black',fg='white', command = clear)
clear_btn.grid(column= 1, row=3 ,padx = 15 )



window.mainloop() 

