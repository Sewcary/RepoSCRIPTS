import os
from datetime import datetime
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

        # Ajouter la date du jour
        date_du_jour = datetime.now().strftime("%Y%m%d")
        transaction_str = f"{date_du_jour} {transaction_str}"

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
            for ligne in lignes:
                Id, _, _, _, _, _, _, _ = ligne.strip().split(" ")
                if Id != id_a_supprimer:
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

# Exemple d'utilisation
gestionnaire = GestionTransactions("transactions.txt")
# gestionnaire.ajouter_transaction("7 PE PRIME ABO M NICK")
# gestionnaire.ajouter_transaction("20230515 7 PE PRIME ABO M NICK")
gestionnaire.afficher()
print (gestionnaire.calculer_total())
# a = input("Continuer")
print(gestionnaire.calculer_total(societe="SW", mois="202305",qui="ML"))
print(gestionnaire.calculer_total(type_trans="PE", mois="202305"))
# gestionnaire.supprimer_transaction('29')
# gestionnaire = GestionTransactions("transactions.txt")
# gestionnaire.afficher()

