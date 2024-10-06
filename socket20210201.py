# -*- coding: utf-8 -*-
"""
Created on Mon Feb  1 18:14:04 2021

@author: ZT5549
"""


# coding: utf-8

import socket

hote = "localhost"
port = 15555

socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
socket.connect((hote, port))
print ("Connection on {}").format(port)

socket.send("Hey my name is Olivier!")

print( "Close")
socket.close()