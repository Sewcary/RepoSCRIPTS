# -*- coding: utf-8 -*-
"""
Created on Thu Oct 22 14:21:55 2020

@author: ZT5549
"""

import pyttsx3 

speaker = pyttsx3.init()

speaker.say('Bonjour') 
speaker.runAndWait()
