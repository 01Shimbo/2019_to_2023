"""
File: boxes.py
Author: Shane Duke

Purpose: calculate number of boxes needed
"""

import math


totalItems = int(input("Enter the number of items: "))
maxItems = int(input("Enter the number of items per box: "))
boxesNeeded = math.ceil(totalItems / maxItems)
print()
print(f'For {totalItems} items, packing {maxItems} items in each box, you will need {boxesNeeded} boxes.')
