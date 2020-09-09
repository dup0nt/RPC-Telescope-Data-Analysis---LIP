# -*- coding: utf-8 -*-
"""
Created on Thu Aug 20 10:23:45 2020

@author: gouve
"""

import math
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import gaussian_kde
import matplotlib.ticker as ticker
import matplotlib.pyplot as plt
from matplotlib import colors


with open("allthetas.txt") as f:
    theta = []
    for x in f:
        y = x.split(',')
for i in y:
            
    theta.append(abs(float(i)))
#print(theta)

with open("allphis.txt") as f:
    phi = []
    for x in f:
        y = x.split(',')
for i in y:
    phi.append(float(i)+3.14)
#print(phi)


elevation = []
for i in theta:
    elevation.append(abs((math.sin(i))))
r = []
for i in range(len(elevation)):
    r.append(float(1))
"""
X = []
for i in theta:
    X.append(math.sin(i))
    
Y = []
for i in phi:
    Y.append(math.cos(i))
    
  """  

x = []
y = []
z=[]
for num1, num2 in zip(phi, theta):

        x.append(math.cos(num1)*math.sin(num2))
        y.append(math.sin(num1)*math.sin(num2))
        z.append(math.cos(num2))
        

        
plt.hist2d(x,y, bins=[np.arange(-1,1,0.015),np.arange(-1,1,0.05)])
rcParams["figure.figsize"] = [8, 8]
plt.show()  
        