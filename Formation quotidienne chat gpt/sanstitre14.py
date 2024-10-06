import tkinter as tk
from tkinter import messagebox
from datetime import datetime

import os

class Application(tk.Tk):
    
    def __init__(self, gestionnaire):
        super().__init__()
        self.gestionnaire = gestionnaire

        self.title("Gestion des transactions")
        self.attributes('-fullscreen', True)
        self.bind("<Escape>", self.quit_fullscreen)


        # Doublez la taille de la fenêtre
        self.geometry("1400x1200")  # Vous pouvez ajuster ces valeurs en fonction de la taille souhaitée
 
        self.listbox = tk.Listbox(self, width=150, height=40, font=("Arial", 11), fg="blue")  # Modifiez la valeur de height en fonction de la taille souhaitée
        self.listbox.pack(pady=10)
        self.afficher_transactions()
        """
        #   premier frame premiere ligne

        """
        self.frame1 = tk.Frame(self)     
        self.frame1.pack(pady=10)
        
        self.labelSolde = tk.Label(self.frame1, text="Solde actuel :", font=("Arial", 18), fg="blue")
        self.labelSolde.pack(side=tk.LEFT, padx=5)

        self.entrySolde = tk.Entry(self.frame1, width=10, font=("Arial", 18), fg="blue")
        self.entrySolde.pack(side=tk.LEFT, padx=25)

        self.entry = tk.Entry(self.frame1, width=50, font=("Arial", 18), fg="blue")
        self.entry.pack(side=tk.LEFT)

        self.ajouter_btn = tk.Button(self.frame1,  text="Ajouter transaction",font=("Arial", 12), fg="blue", command=self.ajouter_transaction)
        self.ajouter_btn.pack(side=tk.LEFT)

        self.supprimer_btn = tk.Button(self.frame1, text="Supprimer transaction", font=("Arial", 12), fg="blue",command=self.supprimer_transaction)
        self.supprimer_btn.pack(side=tk.LEFT)
        
        self.modifier_btn = tk.Button(self.frame1, text="Modifier transaction", font=("Arial", 12), fg="blue" ,command=self.modifier_transaction_selectionnee)
        self.modifier_btn.pack(side=tk.LEFT)
        
        self.montant = tk.Label(self.frame1, width=50, text="500", font=("Arial", 14), fg="blue")
        self.montant.pack(side=tk.LEFT)
                
        self.mise_a_jour_montant()
        
        """
        #   deuxeime  frame 2eme ligne

        """
        
        self.entry_frame = tk.Frame(self)
        self.entry_frame.pack()

        # Ajoutez les zones de texte et le label
        self.labelDate = tk.Label(self.entry_frame, width=10, text="Date", font=("Arial", 18), fg="blue")
        self.labelDate.pack(side=tk.LEFT, padx=0)
        
        self.entryDate = tk.Entry(self.entry_frame, width=10, font=("Arial", 18), fg="blue")
        self.entryDate.pack(side=tk.LEFT, padx=5)

        self.labelType = tk.Label(self.entry_frame, text="Type", width=10, font=("Arial", 18), fg="blue")
        self.labelType.pack(side=tk.LEFT, padx=5)
        
        self.entryType = tk.Entry(self.entry_frame, width=10)
        self.entryType.pack(side=tk.LEFT, padx=5)
        
        self.labelSociete = tk.Label(self.entry_frame, text="Societe", width=10, font=("Arial", 18), fg="blue")
        self.labelSociete.pack(side=tk.LEFT, padx=5)
        
        self.entrySociete = tk.Entry(self.entry_frame, width=10)
        self.entrySociete.pack(side=tk.LEFT, padx=5)
        
        self.labelQuoi = tk.Label(self.entry_frame, text="Quoi", width=10, font=("Arial", 18), fg="blue")
        self.labelQuoi.pack(side=tk.LEFT, padx=5)
        
        self.entryQuoi = tk.Entry(self.entry_frame, width=10)
        self.entryQuoi.pack(side=tk.LEFT, padx=5)
        
        self.labelQui = tk.Label(self.entry_frame, text="Qui", width=10, font=("Arial", 18), fg="blue")
        self.labelQui.pack(side=tk.LEFT, padx=5)
        
        self.entryQui = tk.Entry(self.entry_frame, width=10)
        self.entryQui.pack(side=tk.LEFT, padx=5)
        
        self.labelBanque = tk.Label(self.entry_frame, text="Banque", width=10, font=("Arial", 18), fg="blue")
        self.labelBanque.pack(side=tk.LEFT, padx=5);
        
        self.entryBanque = tk.Entry(self.entry_frame, width=10)
        self.entryBanque.pack(side=tk.LEFT, padx=5)
        
        self.filtrer_btn = tk.Button(self.entry_frame, text="Filtrer", command=self.filtrer_et_afficher_total, width=20,font=("Arial", 18), fg="blue")
        self.filtrer_btn.pack(side=tk.LEFT, padx=5)
        
        self.labelFiltre = tk.Label(self.entry_frame, text="Total", width=10, font=("Arial", 18), fg="blue")
        self.labelFiltre.pack(side=tk.LEFT, padx=5)
        
        
        
        
        
        
        
        self. entry_frame2 = tk.Frame(self)
        self. entry_frame2.pack()

        self.labelNickel = tk.Label(self. entry_frame2, width=10, text="Nickel", font=("Arial", 12), fg="blue")
        self.labelNickel.pack(side=tk.LEFT, padx=0)
        
        self.entryNickel = tk.Entry(self. entry_frame2, width=10, font=("Arial", 12), fg="blue")
        self.entryNickel.pack(side=tk.LEFT, padx=5)

        self.labelBNP = tk.Label(self. entry_frame2, text="BNP", width=10, font=("Arial", 12), fg="blue")
        self.labelBNP.pack(side=tk.LEFT, padx=5)
        
        self.entryBNP = tk.Entry(self. entry_frame2, width=10)
        self.entryBNP.pack(side=tk.LEFT, padx=5)
        
        self.labelBoursorama = tk.Label(self. entry_frame2, text="Boursorama", width=10, font=("Arial", 12), fg="blue")
        self.labelBoursorama.pack(side=tk.LEFT, padx=5)
        
        self.entryBoursorama = tk.Entry(self. entry_frame2, width=10)
        self.entryBoursorama.pack(side=tk.LEFT, padx=5)
        
        self.labelMonabanq = tk.Label(self. entry_frame2, text="Monabanq", width=10, font=("Arial", 12), fg="blue")
        self.labelMonabanq.pack(side=tk.LEFT, padx=5)
        
        self.entryMonabanq = tk.Entry(self. entry_frame2, width=10)
        self.entryMonabanq.pack(side=tk.LEFT, padx=5)
        
        self.labelEspeces = tk.Label(self. entry_frame2, text="Especes", width=10, font=("Arial", 12), fg="blue")
        self.labelEspeces.pack(side=tk.LEFT, padx=5)
        
        self.entryEspeces = tk.Entry(self. entry_frame2, width=10)
        self.entryEspeces.pack(side=tk.LEFT, padx=5)
        
        self.labelDettes = tk.Label(self. entry_frame2, text="Dettes", width=10, font=("Arial", 12), fg="blue")
        self.labelDettes.pack(side=tk.LEFT, padx=5);
        
        self.entryDettes = tk.Entry(self. entry_frame2, width=10)
        self.entryDettes.pack(side=tk.LEFT, padx=5)
        
        
        
        
        
        
        
        
        
        
    # def afficher_transactions(self):
    #     self.listbox.delete(0, tk.END)
    #     for transaction in self.gestionnaire.transactions:
    #         self.listbox.insert(tk.END, f"{transaction['Id']} | {transaction['Date']} | {transaction['Montant']} | {transaction['Type']} | {transaction['Societe']} | {transaction['Quoi']} | {transaction['Qui']} | {transaction['Banque']}")
   
    def afficher_transactions(self):
        self.listbox.delete(0, tk.END)
        for transaction in self.gestionnaire.transactions:
            ligne_formattee = "{:<4} | {:<8} | {:<10} | {:<4} | {:<6} | {:<6} | {:<4} | {:<6}".format(
                transaction['Id'],
                transaction['Date'],
                transaction['Montant'],
                transaction['Type'],
                transaction['Societe'],
                transaction['Quoi'],
                transaction['Qui'],
                transaction['Banque'],
            )
            self.listbox.insert(tk.END, ligne_formattee)
            
    
    def quit_fullscreen(self, event=None):
        self.attributes('-fullscreen', False)
        
    
    def afficher_transactions(self, type_trans: str = None, mois: str = None, societe: str = None, quoi: str = None, qui: str = None):
        self.listbox.delete(0, tk.END)
        for transaction in self.gestionnaire.transactions:
            if type_trans is not None and transaction['Type'] != type_trans:
                continue

            if mois is not None:
                annee_mois_transaction = transaction['Date'][:6]  # Extraire l'année et le mois de la date
                if annee_mois_transaction != mois:
                    continue
                
            if societe is not None and transaction['Societe'] != societe:
                continue
            
            if quoi is not None and transaction['Quoi'] != quoi:
                continue
            
            if qui is not None and transaction['Qui'] != qui:
                continue

            ligne_formattee = "{:<4} | {:<8} | {:<10} | {:<4} | {:<6} | {:<6} | {:<4} | {:<6}".format(
                transaction['Id'],
                transaction['Date'],
                transaction['Montant'],
                transaction['Type'],
                transaction['Societe'],
                transaction['Quoi'],
                transaction['Qui'],
                transaction['Banque'],
            )
            self.listbox.insert(tk.END, ligne_formattee)
            
    def mise_a_jour_montant(self):
        total = self.gestionnaire.calculer_total()
        self.montant.config(text=f"Total : {total}")

        
    def ajouter_transaction(self):
        transaction_str = self.entry.get()
        if transaction_str:
            self.gestionnaire.ajouter_transaction(transaction_str)
            self.afficher_transactions()
            self.mise_a_jour_montant()
            self.entry.delete(0, tk.END)
        else:
            messagebox.showwarning("Attention", "Veuillez entrer une transaction valide.")
            
    
    def modifier_transaction_selectionnee(self):
        selection = self.listbox.curselection()
        if selection:
            id_a_modifier = self.gestionnaire.transactions[selection[0]]['Id']
            transaction_str = self.entry.get()
            if transaction_str:
                self.gestionnaire.modifier_transaction(id_a_modifier, transaction_str)
                self.afficher_transactions()
                self.mise_a_jour_montant()
                self.entry.delete(0, tk.END)
            else:
                messagebox.showwarning("Attention", "Veuillez entrer une transaction valide.")
        else:
            messagebox.showwarning("Attention", "Veuillez sélectionner une transaction à modifier.")   
 
    
    def supprimer_transaction(self):
        selection = self.listbox.curselection()
        if selection:
            id_a_supprimer = self.gestionnaire.transactions[selection[0]]['Id']
            self.gestionnaire.supprimer_transaction(id_a_supprimer)
            self.mise_a_jour_montant()
            self.afficher_transactions()
        else:
            messagebox.showwarning("Attention", "Veuillez sélectionner une transaction à supprimer.")
    
    
    def filtrer_et_afficher_total(self):
        type_trans = self.entryType.get() or None
        mois = self.entryDate.get() or None
        societe = self.entrySociete.get() or None
        quoi = self.entryQuoi.get() or None
        qui = self.entryQui.get() or None
        
        total = self.gestionnaire.calculer_total(type_trans, mois, societe, quoi, qui)
        self.labelFiltre.config(text=f"Total : {total:.2f}")
        self.afficher_transactions(type_trans, mois, societe, quoi, qui)
 
     
class GestionTransactions:
    
    def __init__(self, fichier_transactions: str):
        self.fichier_transactions = fichier_transactions
        self.transactions = self.lire_transactions()


    def lire_transactions(self) -> list:
        with open(self.fichier_transactions, "r") as file:
            lignes = file.readlines()

        transactions = []
        for ligne in lignes[1:]:
            Id, date, montant, type_trans, societe, quoi, qui, banque = ligne.strip().split(" ")
            transaction = {
                "Id": Id,
                "Banque": banque,
                "Date": date,
                "Montant": float(montant),
                "Type": type_trans,
                "Societe": societe,
                "Quoi": quoi,
                "Qui": qui,
            }
            transactions.append(transaction)

        return transactions


    def ajouter_transaction(self, transaction_str: str) -> None:
        unique_id = self.nouvel_id()
        
        elements = transaction_str.split(' ')
        
        # Vérifier si la première entrée est une date
        if len(elements[0]) != 8 or not elements[0].isdigit():
            # Si ce n'est pas une date, ajoutez la date du jour
            date_du_jour = datetime.now().strftime("%Y%m%d")
            transaction_str = f"{date_du_jour} {transaction_str}"
        
        # Vérifiez si seulement le montant et éventuellement un signe sont entrés
        if transaction_str.replace(" ", "").replace("-", "").replace("+", "").isdigit():
            # Compléter les colonnes manquantes avec 'XXXX'
            transaction_str += " " + " ".join(["XXXX"] * 5)
    
        with open(self.fichier_transactions, "a") as file:
            file.write(f"\n{unique_id} {transaction_str}")
    
        self.transactions = self.lire_transactions()
        
        
    def nouvel_id(self) -> int:
        max_id = 0
        for transaction in self.transactions:
            Id = int(transaction['Id'])
            max_id = max(max_id, Id)

        return max_id + 1


    def supprimer_transaction(self, id_a_supprimer: str) -> None:
        fichier_temp = "transactions_temp.txt"

        with open(self.fichier_transactions, "r") as file:
            lignes = file.readlines()

        with open(fichier_temp, "w") as file:
            for i, ligne in enumerate(lignes):
                Id, _, _, _, _, _, _, _ = ligne.strip().split(" ")
                if Id != id_a_supprimer:
                    # Supprimer le saut de ligne de la dernière ligne
                    if i == len(lignes) - 1:
                        file.write(ligne.rstrip())
                    else:
                        file.write(ligne)

        os.remove(self.fichier_transactions)
        os.rename(fichier_temp, self.fichier_transactions)

        self.transactions = self.lire_transactions()


    def afficher(self):
        for transaction in self.transactions:
            print(
                f"Id: {transaction['Id']} | Date: {transaction['Date']} | Montant: {transaction['Montant']} | Type: {transaction['Type']} | Societe: {transaction['Societe']} | Quoi: {transaction['Quoi']} | Qui: {transaction['Qui']} | Bnq: {transaction['Banque']}"
            )
            
    # def calculer_total(self) -> float:
    #     total = 0
    #     for transaction in self.transactions:
    #         total += transaction['Montant']
    #     return total
    
    def calculer_total(self, type_trans: str = None, mois: str = None, societe: str = None, quoi: str = None, qui: str = None) -> float:
        total = 0
        for transaction in self.transactions:
            if type_trans is not None and transaction['Type'] != type_trans:
                continue

            if mois is not None:
                annee_mois_transaction = transaction['Date'][:6]  # Extraire l'année et le mois de la date
                if annee_mois_transaction != mois:
                    continue
                
            if societe is not None and transaction['Societe'] != societe:
                continue
            
            if quoi is not None and transaction['Quoi'] != quoi:
                continue
            
            if qui is not None and transaction['Qui'] != qui:
                continue
            
            total += transaction['Montant']
        
        return total
    
    
    def modifier_transaction(self, id_transaction: str, transaction_str: str) -> None:
        # Lire toutes les lignes du fichier texte
        with open(self.fichier_transactions, "r") as file:
            lignes = file.readlines()

        # Modifier la transaction avec l'ID correspondant
        for i, ligne in enumerate(lignes):
            Id, _, _, _, _, _, _, _ = ligne.strip().split(" ")
            if Id == id_transaction:
                date_du_jour = datetime.now().strftime("%Y%m%d")
                nouvelle_ligne = f"{id_transaction} {date_du_jour} {transaction_str}\n"
                lignes[i] = nouvelle_ligne
                break

        # Réécrire le fichier texte avec les modifications
        with open(self.fichier_transactions, "w") as file:
            file.writelines(lignes)

        # Mettre à jour la liste des transactions
        self.transactions = self.lire_transactions()   
        
        
if __name__ == "__main__":
    gestionnaire = GestionTransactions("transactions.txt")
    app = Application(gestionnaire)
    app.mainloop()