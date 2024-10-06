# -*- coding: utf-8 -*-
"""
Created on Mon Dec  7 17:21:17 2020

@author: ZT5549
"""
class Personne: 
    def __init__(self):
        self.nom = "Dupont"
        self.prenom ='Eric'
        self.age = 33 
        self.lieu_residence ="Paris"

Bernard = Personne()

print(Bernard.nom)
print(Bernard.prenom)

Bernard.prenom = 'Jean' 

print(Bernard.prenom)


class A : 
    """Classe A pour illustrer notre exemple dheritage """
     pass      #on laisse la definition vide ce n'est qu'un exemple

classB(A)
    """Classe B qui herite de A . Elle reprend les meme methodes et attributs """
    pass
from tkinter import Tk,Entry,Button,Label

window = Tk()
window.configure (bg = 'light green')
window.geometry("520x420")
window.title("Converter")

ft_lbl= Label(window, text ="Feet",bg="purple",fg= "white",width = 14)
ft_lbl.grid(column=0,row=0,padx=15,pady=15)

 

window.mainloop()

