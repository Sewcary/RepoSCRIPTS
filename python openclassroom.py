# -*- coding: utf-8 -*-
"""
Created on Tue Apr  4 18:17:15 2023

@author: ZT5549
"""


def flottant (nbr):
    return (str(nbr))[0:str(nbr).index('.')+4].replace('.',',')

print (flottant (3.99999999999998))

# -*- coding: utf-8 -*-
"""
Created on Tue Apr  4 19:33:31 2023

@author: ZT5549
"""


def f_i (*parametres) : 
    print("J'ai reçu :{}. ".format(parametres))
    
f_i()
f_i(33)
f_i('a','e','f')
var=3.5
f_i(var,[4])
l = [1,55,88,998,4,5,7,87,5,7,5,5,7,8,6,8,5,8,7]

f_i(*l)

l = [0,1,2,3,4,5,6,7,8,9,10,11,2,11,45,14,15,12,6,4,5,2,1,4,5,8,9,6,3,1,4,5,2]

ll  = [nb*nb for nb in l if nb%3 ==0 ]

for i in ll : 
    print (i) 
    
# -*- coding: utf-8 -*-
"""
Created on Tue Apr  4 18:10:08 2023

@author: ZT5549
"""
mot = "Quel est ton nom?"
liste_split = mot.split()
print(liste_split)

".".join(liste_split) 
nv_chaine = "   ".join(liste_split) 
print(nv_chaine)
