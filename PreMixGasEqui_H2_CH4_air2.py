import cantera as ct
import numpy as np

# Simulation parameters
phi=1
p = ct.one_atm  # pressure [Pa]
Tin = 300  # unburned gas temperature [K]
x = 0.0
alpha = x/(1-x)
stoi_O2 = 2+(alpha)/2
stoi_N2 = 3.76*stoi_O2
reactants = 'CH4:'+str(phi)+', H2:'+str(phi*alpha)+', O2:'+str(stoi_O2)+', N2:'+str(stoi_N2)  # premixed gas composition
width = 0.08  # m
loglevel = 1  # amount of diagnostic output (0 to 8)

# IdealGasMix object used to compute mixture properties, set to the state of the
# upstream fuel-air mixture

gas = ct.Solution('gri30.yaml')
gas.TPX = Tin, p, reactants

gas ()

gas.equilibrate('HP')

gas()


f = ct.FreeFlame(gas, width=width)

t=f.heat_release_rate

print(t)

#f.set_refine_criteria(ratio=3, slope=0.06, curve=0.12)

#f.show_solution()

# Solve with multi-component transport properties
##f.transport_model = 'Multi'
##f.solve(loglevel=loglevel, auto=True)
#f.show_solution()

# write the velocity, temperature, density, and mole fractions to a CSV file
#f.write_csv('CH4_adiabatic_0.2H2.csv', species='Y',quiet=False)
