# -*- coding: utf-8 -*-
"""
Created on Mon Dec  7 13:11:54 2020

@author: ZT5549
"""


from tkinter import Tk,Label, Entry 

window = Tk() 
window.configure(bg= 'light green')
window.title('Converter')
window.geometry('320x440')

label = Label(window, width =  14 ,bg = 'purple' ,fg = 'white',text ='Feet'  )
label.grid (row = 0 , column = 0,padx= 15 ,pady = 15 )

window.mainloop()

# how the console works 
# save file as namefile.piy to prevent the console from coming up when executed 