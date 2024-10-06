# -*- coding: utf-8 -*-
"""
Created on Mon Feb  1 18:12:32 2021

@author: ZT5549
"""


# coding: utf-8

import socket

socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
socket.bind(('', 15555))

while True:
        socket.listen(5)
        client, address = socket.accept()
        print ("{} connected").format( address )

        response = client.recv(255)
        if response != "":
                print( response)

print ("Close")
client.close()
socket.close()