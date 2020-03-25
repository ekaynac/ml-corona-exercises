# -*- coding: utf-8 -*-
"""
Created on Tue Mar 24 00:06:26 2020

@author: enes_
"""


import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

data = pd.read_csv("time_series_covid_19_confirmed.csv")

del data["Province/State"]
del data["Lat"]
del data["Long"]

data = data.groupby(by = "Country/Region").sum()

