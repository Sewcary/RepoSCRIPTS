# -*- coding: utf-8 -*-
"""
Created on Mon Dec  7 13:28:57 2020

@author: ZT5549
"""
from tkinter import Tk,Radiobutton, Button ,Label, StringVar ,IntVar,Entry ,DoubleVar

#create a class and app container  : window 

class TipCalculator(): 
    def __init__(self):# built in function assig values to object properties when call init is calles  self ref to the current instace of the classs 
        # creat et configure the application window 
        window = Tk()
        window.title("Tip calculator")
        window.configure(bg= 'sky blue') 
        window.geometry ("375x520")
        window.resizable(width= False, height= False )
        
        # set the type of variables 
        self.meal_cost = DoubleVar()
        self.tip_percent = IntVar()
        self.tip = StringVar()
        self.total_cost = StringVar()
        
        #Labels 
        tip_percents  = Label (window, text = 'Tip percentage',bg = 'purple',fg = 'white')
        tip_percents.grid(column = 0 , row = 0 ,  padx = 15) 
        
        bill_amount  = Label (window, text = 'bill amount',bg = 'black',fg = 'white')
        bill_amount.grid(column = 1 , row = 0 ,  padx = 15)
        
        bill_amount_entry  = Entry (window, textvariable =self.meal_cost , width = 14 )
        bill_amount_entry.grid(column= 2 , row= 0 )
        
        # radion Bu=ton standaard widget to implemnt one of many selection used in groups  with a single varibale 
        
        five_percent_tip = Radiobutton(window,text = "05%" ,variable = self.tip_percent ,value = 5  )
        five_percent_tip.grid(column=0 ,row= 1)
        ten_percent_tip = Radiobutton(window,text = "10%" ,variable = self.tip_percent ,value = 10  )
        ten_percent_tip.grid(column=0 ,row= 2)
        fifteen_percent_tip = Radiobutton(window,text = "15%" ,variable = self.tip_percent ,value =15  )
        fifteen_percent_tip.grid(column=0 ,row= 3)
        twenty_percent_tip = Radiobutton(window,text = "20%" ,variable = self.tip_percent ,value = 20  )
        twenty_percent_tip.grid(column=0 ,row= 4)
        twentyfive_percent_tip = Radiobutton(window,text = "25%" ,variable = self.tip_percent ,value = 25  )
        twentyfive_percent_tip.grid(column=0 ,row= 5)
        thirty_percent_tip = Radiobutton(window,text = "30%" ,variable = self.tip_percent ,value = 30  )
        thirty_percent_tip.grid(column=0 ,row= 6)
# lables entrys  
        
        tip_amount_lbl =Label(window, text = 'Tip Amount', bg = 'brown' , fg = 'white')
        tip_amount_lbl.grid(column= 1 ,row = 3 ,padx= 15 )
        
        tip_amount_entry =Entry(window, textvariable = self.tip, width = 14 )
        tip_amount_entry.grid(column= 2 ,row = 3 )


        bill_total_lbl =Label(window, text = 'Bill total', bg = 'blue' , fg = 'white')
        bill_total_lbl.grid(column= 1 ,row = 5 ,padx= 15 )

        bill_total_entry =Entry(window, textvariable = self.total_cost, width = 14 )
        bill_total_entry.grid(column= 2 ,row = 5 )
        
        calculate_btn = Button (window, text = "caluclate",bg = 'green',fg ='white', command = self.calculate)
        calculate_btn.grid (column = 1 ,row = 7 ,padx = 15 )
                
        clear_btn = Button (window, text = "clear",bg = 'black',fg ='white', command = self.zero)
        clear_btn.grid (column = 2 ,row = 7  )
        
        window.mainloop()
        
    def calculate(self): 
        pre_tip = self.meal_cost.get()
        percentage = self.tip_percent.get() / 100 
        tip_amount_entry = pre_tip * percentage
        self.tip.set(tip_amount_entry)
        
        final_bill = pre_tip + tip_amount_entry
        self.total_cost.set(final_bill)
        
    def zero(self): 
        self.meal_cost.set("")
        self.total_cost.set("")
        self.tip.set("")

TipCalculator()        


