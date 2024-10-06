# -*- coding: utf-8 -*-
"""
Created on Sun Nov 12 12:48:28 2023

@author: ZT5549
"""

import datetime

# Obtenir la date d'aujourd'hui
date_aujourdhui = datetime.date.today()

# Calculer la date d'hier en soustrayant un jour
date_hier = (datetime.date.today() - datetime.timedelta(days=1)).strftime("%d-%b-%Y") 

# Formater la date d'hier selon le format souhaité : "JJ-MMM-AAAA"


print(date_hier)