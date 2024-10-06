# -*- coding: utf-8 -*-
"""
Created on Thu May 18 20:10:15 2023

@author: ZT5549
"""


        self. entry_frame2 = tk.Frame(self)
        self. entry_frame2.pack()

        self.labelNickel = tk.Label(self. entry_frame2, width=10, text="Nickel", font=("Arial", 18), fg="blue")
        self.labelNickel.pack(side=tk.LEFT, padx=0)
        
        self.entryNickel = tk.Entry(self. entry_frame2, width=10, font=("Arial", 18), fg="blue")
        self.entryNickel.pack(side=tk.LEFT, padx=5)

        self.labelBNP = tk.Label(self. entry_frame2, text="BNP", width=10, font=("Arial", 18), fg="blue")
        self.labelBNP.pack(side=tk.LEFT, padx=5)
        
        self.entryBNP = tk.Entry(self. entry_frame2, width=10)
        self.entryBNP.pack(side=tk.LEFT, padx=5)
        
        self.labelBoursorama = tk.Label(self. entry_frame2, text="Boursorama", width=10, font=("Arial", 18), fg="blue")
        self.labelBoursorama.pack(side=tk.LEFT, padx=5)
        
        self.entryBoursorama = tk.Entry(self. entry_frame2, width=10)
        self.entryBoursorama.pack(side=tk.LEFT, padx=5)
        
        self.labelMonabanq = tk.Label(self. entry_frame2, text="Monabanq", width=10, font=("Arial", 18), fg="blue")
        self.labelMonabanq.pack(side=tk.LEFT, padx=5)
        
        self.entryMonabanq = tk.Entry(self. entry_frame2, width=10)
        self.entryMonabanq.pack(side=tk.LEFT, padx=5)
        
        self.labelEspeces = tk.Label(self. entry_frame2, text="Especes", width=10, font=("Arial", 18), fg="blue")
        self.labelEspeces.pack(side=tk.LEFT, padx=5)
        
        self.entryEspeces = tk.Entry(self. entry_frame2, width=10)
        self.entryEspeces.pack(side=tk.LEFT, padx=5)
        
        self.labelDettes = tk.Label(self. entry_frame2, text="Dettes", width=10, font=("Arial", 18), fg="blue")
        self.labelDettes.pack(side=tk.LEFT, padx=5);
        
        self.entryDettes = tk.Entry(self. entry_frame2, width=10)
        self.entryDettes.pack(side=tk.LEFT, padx=5)