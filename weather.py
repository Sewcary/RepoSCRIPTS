# -*- coding: utf-8 -*-
"""
Created on Fri Dec  4 17:09:11 2020

@author: ZT5549
 802928e39d4b3c729b7d5fba26f1df6d
"""
import tkinter as tk
import requests 
def test_function (entry):
   
    print('this is the entry :' ,entry)
    
def get_weather(city):
    weather_key = '802928e39d4b3c729b7d5fba26f1df6d'
    url = '' 

HEIGHT = 700
WIDTH = 800 



root = tk.Tk()
fname = "C:\\Users\\ZT5549\\Xz2B.gif"
bg_image = tk.PhotoImage(file=fname)
canvas = tk.Canvas(root,height =600,width = 700)
canvas.pack()
canvas.create_image(0, 0, image=bg_image, anchor='nw')
# background_image= tk.PhotoImage(file="C:\\Users\\ZT5549\\Xz2B.gif")
# background_label = tk.Label (root,image=background_image)
# background_label.place (relwidth=1, relheight = 1 )


frame = tk.Frame(root,bg= '#80c1ff',bd = 5 ) 
frame.place ( relx = 0.5 , rely = 0.1 ,relwidth = 0.75 ,relheight=0.1, anchor = 'n' ) 

entry = tk.Entry (frame , font = 40)
entry.place (relwidth=0.65 , relheight=1)

button =  tk.Button(frame,text = "Get Weather"  ,font = 40,command= lambda: test_function(entry.get( )))
button.place (relx=0.7 , relwidth =0.3 , relheight =1 )

lower_frame = tk.Frame(root,bg= '#80c1ff' ,bd= 10 ) 
lower_frame.place ( relx = 0.5 , rely = 0.25 ,relwidth = 0.75 ,relheight=0.6, anchor = 'n' ) 

label = tk.Entry (lower_frame , font = 40)
label.place (relwidth=1 , relheight=1)

#label = tk.Label (lower_frame  )
#label.place(relwidth=1,relheight = 1 )
#button.pack(side= 'left' ,fill ='x' ,expand = True)


#label = tk.Label(frame , text = 'This is a label' ,bg = 'Yellow') 
# label.place (relx =0.3 ,rely = 0 ,relwidth = 0.45 , relheight = 0.25)
# label.pack(side = 'right') 

#entry.pack(side = 'left' ) 
root.mainloop()