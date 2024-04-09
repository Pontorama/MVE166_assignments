# indexes, same for crop production and diesel production
I_crops = 1:3
I_diesel = 1:3
I = 1:6
# constraints
A = 1600 # Available area in hectars
S = 5000 # Water supply in Ml

# Crop yields, water demand and oil content
crops = ["Soybeans", "Sunflower seeds", "Cotton seeds"]
y = [2.6, 1.4, 0.9] # Yields in  tonnes/Ha
w = [5, 4.2, 1] # Water demand in Ml/Ha
o = [0.178, 0.216, 0.433] # Oil content in l/kg
c_crops = [1000*y[i]*o[i] for i in I_crops]
price_methanol = 1.5

# Oil extraction
diesel_product = ["B5", "B30", "B100"]
D = 280000 # Diesel demand in litres
P = 150000 # Petrol diesel available in litres
price_petrol_diesel = 1 # Euros per litre
percenteges = [0.05, 0.3, 1] # Percentage of bio-oil in diesel blend
tax = [0.2, 0.05, 0] # Tax for each blend
price = [1.43, 1.29, 1.16] # Selling price for each blend
c_diesel = [(1-tax[i])*price[i] for i in I_diesel]