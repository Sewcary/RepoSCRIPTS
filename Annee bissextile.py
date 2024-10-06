# -*- coding: utf-8 -*-
"""
Created on Wed Oct 28 21:30:27 2020

@author: ZT5549
"""
anneeSTR = input ("Annee? ")
annee = int(anneeSTR) 
if (annee % 4 == 0 ): 
    if (annee % 100 == 0  ) : 
            if (annee % 400 == 0  ) :
                print("Annee bissextile")
            else :
                print("Annee Non bissextile")
    else:
            print("Annee  bissextile")
