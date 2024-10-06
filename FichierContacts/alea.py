# -*- coding: utf-8 -*-
"""
Created on Tue Oct  1 11:34:08 2024

@author: ZT5549
"""

data  = [
         ("Debit","20240913",250.5,"Alimentation"),
         ("Debit","20240922",20.5,"abo"),
         ("Debit","20240902",25.5,"wu"),
         ("Debit","20240922",500.5,"sw"),
         ("Debit","20240922",50.5,"auto"),
         ("Debit","20240911",200.5,"remb"),
         ("Debit","20240913",20.5,"loisirs"),
         ("Debit","20240914",2.5,"pap"),
         ("Debit","20240901",14.5,"bled"),
         ("Debit","20240902",528.5,"livres"),
         ("Debit","20240911",2587.5,"musique"),
         ("Debit","20240923",2525700.5,"x"),
         ("Debit","20240912",257.5,"xhamster"),
         ("Debit","20240921",25.5,"rentacyberfirned"),
         ("Debit","20240905",25.5,"paypal"),
         ("Debit","20240915",87.5,"don"),
         ("Debit","20240906",96.5,"dette"),
         ("Debit","20240930",566.5,"remb"),
         ("Debit","20240915",69969.5,"perte"),
         ] 

columns= ["Operation","date","Montant","Categorie"]

df = spark.createDataFrame(data,schema = columns)