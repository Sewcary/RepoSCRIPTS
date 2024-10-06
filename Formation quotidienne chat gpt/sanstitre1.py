# Initialiser les compteurs
total_bits = 0
nombre_de_un = 0

# Ouvrir le fichier en mode lecture
with open('C:\\Users\ZT5549\Desktop\\numeros.txt', 'r') as fichier:
    # Lire chaque ligne du fichier
    for ligne in fichier:
        # Supprimer les espaces en début et fin de ligne
        ligne = ligne.strip()

        # Vérifier si la ligne est vide
        #if not ligne:
        #    continue

        # Séparer le numéro et le bit (1 ou 0)
       # print(ligne)
        numero, bit = ligne.split()
        bit = int(bit)

        # Vérification si le bit est 1 ou 0
      #  if bit not in (0, 1):             print(f"La ligne '{ligne}' ne contient pas 1 ou 0 après le numéro.")             continue

        # Incrémenter le compteur total
        total_bits += 1

        # Incrémenter le compteur de un si le bit est 1
        if bit == 1:
            nombre_de_un += 1

# Calculer le pourcentage de 1
if total_bits > 0:
    pourcentage_de_un = (nombre_de_un / total_bits) * 100
    print(f"Le pourcentage de 1 est de {pourcentage_de_un}%")
else:
    print("Aucun bit trouvé dans le fichier.")
