# -*- coding: utf-8 -*-
"""
Created on Mon May 13 16:29:28 2024

@author: ZT5549
"""
import os

with open ("test.txt","w") as f: 
    f.write("Bonjour , monde")
os.remove("test.txt")