# -*- coding: utf-8 -*-
"""
Created on Fri May 17 15:49:35 2024

@author: ZT5549
"""

import multiprocessing

def square(number):
    return number * number

if __name__ == "__main__":
    numbers = [i for i in range(1000000)]
    with multiprocessing.Pool(processes=60) as pool:
        result = pool.map(square, numbers)
    print(result)
