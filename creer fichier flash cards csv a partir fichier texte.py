import csv

# Remplacez 'input.txt' par le nom de votre fichier texte
input_file = 'input.txt'
# Remplacez 'output.csv' par le nom du fichier CSV que vous souhaitez créer
output_file = 'output.csv'

# Lecture du fichier texte et extraction des questions et réponses
with open(input_file, 'r', encoding='utf-8') as file:
    lines = file.readlines()
    questions = lines[0::2]
    answers = lines[1::2]

# Création du fichier CSV
with open(output_file, 'w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['question', 'reponse']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames, delimiter=',', quotechar='"', quoting=csv.QUOTE_ALL)
    
    writer.writeheader()
    for i in range(len(questions)):
        writer.writerow({'question': questions[i].strip(), 'reponse': answers[i].strip()})

print("Le fichier CSV a été créé avec succès.")
