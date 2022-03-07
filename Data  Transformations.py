import pandas as pd

energy = pd.read_excel('C:/Users/olver/Desktop/energy.xlsx')

energy.T

energy1 = energy.set_index('Year').T
