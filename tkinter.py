# -*- coding: utf-8 -*-
"""
Created on Tue Apr 25 20:12:45 2023

@author: ZT5549
"""

import tkinter as tk

class SimpleApp(tk.Tk):
    def __init__(self):
        super().__init__()

        self.title("Exemple simple Tkinter")
        self.geometry("300x200")

        # Création des widgets
        self.label1 = tk.Label(self, text="Label 1")
        self.label2 = tk.Label(self, text="Label 2")
        self.label3 = tk.Label(self, text="Label 3")

        self.entry1 = tk.Entry(self)
        self.entry2 = tk.Entry(self)
        self.entry3 = tk.Entry(self)

        self.button = tk.Button(self, text="Cliquez ici")

        # Positionnement des widgets en utilisant `grid`
        self.label1.grid(row=0, column=0, padx=5, pady=5)
        self.label2.grid(row=1, column=0, padx=5, pady=5)
        self.label3.grid(row=2, column=0, padx=5, pady=5)

        self.entry1.grid(row=0, column=1, padx=5, pady=5)
        self.entry2.grid(row=1, column=1, padx=5, pady=5)
        self.entry3.grid(row=2, column=1, padx=5, pady=5)

        self.button.grid(row=3, column=1, padx=5, pady=5)

if __name__ == "__main__":
    app = SimpleApp()
    app.mainloop()
