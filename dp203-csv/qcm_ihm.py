import tkinter as tk
from tkinter import messagebox
import pandas as pd

def save_to_csv():
    global questions_df
    # Assurez-vous de préciser le chemin correct du fichier si nécessaire
    questions_df.to_csv("dp203_complete_assessment.csv", index=False)


# Charger les questions depuis le fichier CSV et filtrer
def load_questions_from_csv(file_path):
    # Charger le fichier CSV
    df = pd.read_csv(file_path)
    # Filtrer les lignes où la dernière colonne contient '1'
    # Assurez-vous que la condition correspond à votre format de données
    filtered_df = df [df.iloc[:, -1] == 0]
    return filtered_df

# Fonction pour vérifier la réponse
def check_answer():
    global correct_count, incorrect_count, questions_df
    selected_options = [var.get() for var in checkbox_vars if var.get() != ""]
    correct_options = questions_df.iloc[current_question_index]["Correct Answer"].split(" - ")
    justification = questions_df.iloc[current_question_index]["Justification"]
    
    if set(selected_options) == set(correct_options):
        correct_count += 1
        # Mettre à jour la dernière colonne à 0 si la réponse est correcte
        questions_df.iloc[current_question_index, -1] = 0
        messagebox.showinfo("Résultat", f"Correct!\n\nJustification: {justification}")
    else:
        incorrect_count += 1
        messagebox.showinfo("Résultat", f"Incorrect. Les bonnes réponses sont: {', '.join(correct_options)}\n\nJustification: {justification}")
    
    update_score()
    next_question()
    save_to_csv()  # Sauvegarder le DataFrame modifié après chaque réponse

# Fonction pour afficher la prochaine question
def next_question():
    global current_question_index, checkbox_vars, checkboxes
    for cb in checkboxes:
        cb.destroy()
    checkbox_vars = []
    checkboxes = []
    
    current_question_index += 1
    if current_question_index < len(questions_df):
        question_label.config(text=questions_df.iloc[current_question_index]["Question"])
        options = questions_df.iloc[current_question_index]["Options"].split(" - ")
        for option in options:
            var = tk.StringVar(value="")
            checkbox = tk.Checkbutton(root, text=option, variable=var, onvalue=option, offvalue="", font=option_font)
            checkbox.pack(anchor='w', padx=20, pady=2)
            checkbox_vars.append(var)
            checkboxes.append(checkbox)
            checkbox.config(bg=base_color, fg='black', selectcolor=accent_color)
    else:
        messagebox.showinfo("Terminé", "Vous avez terminé toutes les questions.")
        root.quit()

# Fonction pour mélanger les questions
def shuffle_questions():
    global questions_df
    questions_df = questions_df.sample(frac=1).reset_index(drop=True)

# Fonction pour mettre à jour le score en temps réel
def update_score():
    score_label.config(text=f"Bonnes réponses: {correct_count}  |  Mauvaises réponses: {incorrect_count}")

# Charger les questions à partir du fichier CSV
questions_df = load_questions_from_csv("dp203_complete_assessment.csv")
shuffle_questions()

correct_count = 0
incorrect_count = 0
current_question_index = 1

root = tk.Tk()
root.title("QCM - Azure Databricks")

base_color = '#ddf2f8'
accent_color = '#00a2e8'
root.configure(bg=base_color)

checkbox_vars = []
checkboxes = []

score_label = tk.Label(root, text=f"Bonnes réponses: {correct_count}  |  Mauvaises réponses: {incorrect_count}", font=("Arial", 12), bg=base_color, fg=accent_color)
score_label.pack(pady=10)

question_label = tk.Label(root, text=questions_df.iloc[current_question_index]["Question"], font=("Arial", 16), wraplength=500, bg=base_color, fg='black')
question_label.pack(pady=(20, 10))

options = questions_df.iloc[current_question_index]["Options"].split(" - ")
option_font = ("Arial", 14)
for option in options:
    var = tk.StringVar(value="")
    checkbox = tk.Checkbutton(root, text=option, variable=var, onvalue=option, offvalue="", font=option_font, bg=base_color, fg='black', selectcolor=accent_color)
    checkbox.pack(anchor='w', padx=20, pady=2)
    checkbox_vars.append(var)
    checkboxes.append(checkbox)

submit_button = tk.Button(root, text="VALIDER", command=check_answer, font=("Arial", 14, "bold"), bg=accent_color, fg="white")
submit_button.pack(pady=20)

next_button = tk.Button(root, text="Suivant", command=next_question, font=("Arial", 14, "bold"), bg='lightblue', fg="white")
next_button.pack(pady=20)

review_var = tk.IntVar(value=questions_df.at[current_question_index, 'revoir'])
# Création des Radiobuttons pour chaque état de révision
tk.Radiobutton(root, text="Pas Vu (0)", variable=review_var, value=0).pack(anchor='w')
tk.Radiobutton(root, text="Vu (1)", variable=review_var, value=1).pack(anchor='w')
tk.Radiobutton(root, text="Revoir (-1)", variable=review_var, value=-1).pack(anchor='w')