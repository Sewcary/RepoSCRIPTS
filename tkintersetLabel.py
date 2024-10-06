from tkinter import   * 


def label() :
    tip.set("tip_amount_entry")

tw = Tk() 
tw.geometry("850x450")

tip = StringVar()

tb =Button(tw, text = 'FERMER' ,width = 90,font = 40 ,command =label ) 
tb.grid   (row= 0 , column = 0 , padx = 15  )

te =Entry(tw, width = 12 ,textvariable = tip , font  = 40 ) 
te.grid (row=2 ,column = 0 )


tw.mainloop() 


