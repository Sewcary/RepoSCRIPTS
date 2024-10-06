# -*- coding: utf-8 -*-
"""
Created on Mon May 13 17:11:21 2024

@author: ZT5549
"""

import requests 

response = requests.get("https://api.github.com")

print(response.status_code)