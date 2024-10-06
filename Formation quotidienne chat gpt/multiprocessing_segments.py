# -*- coding: utf-8 -*-
"""
Created on Fri May 17 15:42:38 2024

@author: ZT5549
"""

import multiprocessing

# Fonction pour traiter un segment de données
def process_segment(segment):
    # Analyse le segment (ici, nous simulons juste un traitement)
    return sum(segment)

# Simuler la division du fichier en segments
data = list(range(1, 1000001))  # Fichier de 1 million de lignes (1 à 1,000,000)
num_segments = 60
segment_size = len(data) // num_segments
segments = [data[i * segment_size:(i + 1) * segment_size] for i in range(num_segments)]
print(segments)
# Utiliser multiprocessing pour traiter les segments en parallèle
# with multiprocessing.Pool(processes=num_segments) as pool:
    # results = pool.map(process_segment, segments)

# Combiner les résultats des segments
# final_result = sum(results)
# print(f"Final Result: {final_result}")
# 