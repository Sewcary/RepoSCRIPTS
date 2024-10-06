# -*- coding: utf-8 -*-
"""
Created on Thu Oct 22 14:31:40 2020

@author: ZT5549
"""
import PyPDF2

import pyttsx3 
book = open ('niang.pdf','rb')

pdfReader  = PyPDF2.PdfFileReader(book) 

pages = pdfReader.numPages 

print (pages)


speaker = pyttsx3.init()
page =pdfReader.getPage(0)
text = page.extractText()
speaker.say(text) 
speaker.runAndWait()

