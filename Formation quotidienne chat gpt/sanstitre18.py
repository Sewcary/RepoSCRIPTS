# -*- coding: utf-8 -*-
"""
Created on Thu Apr 20 18:52:25 2023

@author: ZT5549
"""


import tkinter as tk
import random

class FlashcardsApp:
    def __init__(self, master):
        self.master = master
        self.master.title("Flashcards App")

        self.questions_answers = {
            "Quelle est la capitale de la France?": "Paris",
            "Quelle est la capitale du Japon?": "Tokyo",
            "Quelle est la capitale de l'Italie?": "Rome",
            "Quelle est la capitale de l'Allemagne?": "Berlin"
        }

        self.question = tk.StringVar()
        self.show_random_question()

        self.question_label = tk.Label(self.master, textvariable=self.question, wraplength=300)
        self.question_label.pack(pady=20)

        self.answer_entry = tk.Entry(self.master)
        self.answer_entry.pack(pady=10)

        self.submit_button = tk.Button(self.master, text="Soumettre", command=self.check_answer)
        self.submit_button.pack(pady=10)

        self.result_label = tk.Label(self.master, text="")
        self.result_label.pack(pady=10)

    def show_random_question(self):
        self.current_question = random.choice(list(self.questions_answers.keys()))
        self.question.set(self.current_question)

    def check_answer(self):
        user_answer = self.answer_entry.get().strip()
        correct_answer = self.questions_answers[self.current_question]

        if user_answer.lower() == correct_answer.lower():
            self.result_label.config(text="Bonne réponse!")
        else:
            self.result_label.config(text=f"Mauvaise réponse! La bonne réponse est: {correct_answer}")

        self.show_random_question()
        self.answer_entry.delete(0, tk.END)

if __name__ == "__main__":
    root = tk.Tk()
    app = FlashcardsApp(root)
    root.mainloop()