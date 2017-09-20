#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/9/21 0:03
# @Author  : Mamba
# @Site    : 
# @File    : exercise.py


import matplotlib.pyplot as plt
import numpy as np
from sklearn.datasets import make_friedman1
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import cross_val_score

X_train, y_train = make_friedman1(n_samples=300, random_state=0, noise=1.0)

RF = RandomForestRegressor(random_state=0,
                           min_samples_split = 5,
                           oob_score=True,
                           max_features = 0.333)

# 1. OOB error:
error = []
ntree = np.arange(60, 1000, 20)
for i in ntree.tolist():
    if i%100==0:
        print('Number of tree: ', i, '\n')
    RF.set_params(n_estimators=i)
    RF.fit(X_train, y_train)
    oob_error = 1 - RF.oob_score_
    error.append(oob_error)

plt.plot(ntree, np.array(error))
plt.xlim(50, 1000)
plt.savefig('./plot/Ex2.png')
plt.close()

# 2. Leave-One-Out method
RF = RandomForestRegressor(random_state=0,
                           min_samples_split = 5,
                           oob_score=True,
                           n_estimators = 200,
                           max_features = 0.333)
scores = cross_val_score(RF, X_train, y_train, cv=300)
