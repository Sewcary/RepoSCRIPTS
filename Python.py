#boucle for  de 0 a 9 
for i in range(10): 
	print(i)

# boucle for dans un tableau 
for i in [1,2,3]:
	print(i) 

# boucle for de 0  a 10  pas de 2 
for i in range (0,10,2):
	print(i)

# Boucle while 
i=0
while i <10 
	print(i) 
	i+=1
	
# CREER UNE LISTE  
liste = ['Jean','PAtrick','Paul']   
print (liste) 
# different de {} => dictionnaire 

# AJOUTER UNE LISTE À UNE AUTRE 
l = [1,2,5,4,8,4,2] 
ll = [1,5,2,21,8,9,4 ] 
ll.extend(l) 
print(ll) 

# AJOUTER UNE LISTE COMMME UN ELEMENT DE LA LISTE   
list1 = [1,5,2,3,85]
list2 = [1,5,4,7,8,4,5,7,1,5,87] 
list1.append(list2)
print(list1)
# >>> [1, 5, 2, 3, 85, [1, 5, 4, 7, 8, 4, 5, 7, 1, 5, 87]]

#Inserer un element dans une liste a  l'index  i 
friends = ['Paul','PAtrick','Jean'] 
friends.insert(0,'Eric')

# Supprimer un element en fonction de sa valeur  
friends.remove('Fara')  

#Trouver l'index d'un element dans la liste  
print (friend.index('Fara')

#compter le nombre d'elements dans la liste  
print (friend.count('Fara') 
 
### Pour supprimmer les doublons dans une liste #set() 
l = [1,2,5,,5,8,7,4,1,1] 
print (set(l))

#créer un tableau avec numpy 
import numpy as np
B = np.array([1,2,3]) 

# creer un tableau a deux dimesions remplis de zeros 
B = np.zeros((2,3)) # (2,3) est un tuple qui represente le shape du tableau 
#B = np.zeros(2,3)  ne fonctionne pas 

# creer un tableau a deux dimension remplis de 1 
C = np.ones ((5,8)) 

#  permettre de connaitre le shape : dimensions du tableau 
print (np.dim) 

# permet de connaitre la taille d'un tableau 
print(np.size) 

# creer un tableau a trois dimension  de nombres aleatoires issus de la distribution normale centrée en 0 # pas de shape 
import numpy as np 
A = np.ndarray((3,2))
A = np.ndarray([3,2]) # meme chose 
print(A)

# conter le nombre d'iterations  de chaque lettre dans une chaine 
from collections import Counter 
first  = 'pr,fler,kf' 
print (Counter(first)) 
##counter retourne un dictionnaire avec pour chaque lettre le nombre d'occurences dans la chaine 












