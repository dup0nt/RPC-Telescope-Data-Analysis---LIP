# -*- coding: utf-8 -*-
"""
Created on Wed Aug 19 14:50:12 2020

@author: gouve
"""
import math
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import gaussian_kde
import matplotlib.ticker as ticker
import matplotlib.pyplot as plt



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
#print(elevation)

nr = 10     
ntheta = 100
r_edges = np.linspace(0, 2, nr + 1)
theta_edges = np.linspace(0, 2*np.pi, ntheta + 1)
H, _, _ = np.histogram2d(elevation, phi, [r_edges, theta_edges])


ax = plt.subplot(111, polar=True)
Theta, R = np.meshgrid(theta_edges, r_edges)
ax.pcolormesh(Theta, R, H)

plt.show()

from pylab import rcParams
rcParams['figure.figsize'] = 110, 10


"""
N = 10000
r = .5 + np.random.normal(size=N, scale=.3)
theta = np.pi / 2 + np.random.normal(size=N, scale=.1)

# Histogramming
nr = 50
ntheta = 200
r_edges = np.linspace(0, 1, nr + 1)
theta_edges = np.linspace(0, 2*np.pi, ntheta + 1)
H, _, _ = np.histogram2d(r, theta, [r_edges, theta_edges])

# Plot
ax = plt.subplot(111, polar=True)
Theta, R = np.meshgrid(theta_edges, r_edges)
ax.pcolormesh(Theta, R, H)

plt.show()

from pylab import rcParams
rcParams['figure.figsize'] = 100, 10

"""
