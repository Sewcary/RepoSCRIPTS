from tkinter import *
# WINODW  
window = Tk() 
window.title("Feet to meter conversion App")
window.configure(background = "light green")
window.geometry("320x220")
window.resizable(width=False , height=False)


#label

mt_value = StringVar() # tkinter data type  
mt_entry = Entry(window,textvariable = mt_value,width =14 )
mt_entry.grid(column=1,row=1,pady=30)
# mt_value.set ("%.4f"  % 100)


window.mainloop() 

