import cantera as ct
import numpy as np

# Simulation parameters
phi = 1.5
p = ct.one_atm  # pressure [Pa]
Tin = 300  # unburned gas temperature [K]
x =0.0
alpha = x/(1-x)
stoi_O2 = 2+(alpha)/2
stoi_N2 = 3.76*stoi_O2
reactants = 'CH4:'+str(phi)+', H2:'+str(phi*alpha)+', O2:'+str(stoi_O2)+', N2:'+str(stoi_N2)  # premixed gas composition
width = 0.08  # m
loglevel = 1  # amount of diagnostic output (0 to 8)

# IdealGasMix object used to compute mixture properties, set to the state of the
# upstream fuel-air mixture

gas = ct.Solution('gri30.xml')
gas.TPX = Tin, p, reactants

gas()

# Set up flame object
f = ct.FreeFlame(gas, width=width)
#f.set_refine_criteria(ratio=3, slope=0.06, curve=0.12)
f.set_refine_criteria(ratio=2, slope=0.0125, curve=0.02)
f.show_solution()
# Solve with multi-component transport properties
f.transport_model = 'Multi'
f.solve(loglevel=loglevel, auto=True)
t=f.heat_release_rate
#f.show_solution()
print('multicomponent flamespeed = {0:7f} m/s'.format(f.u[0]))
#print(t)
#f.save('CH4_adiabatic_0.0H2_'+str(phi)+'.xml','multi', 'solution with multicomponent transport')
np.savetxt('CH4_HRR_1.5.txt',t)
#print(t.shape)
# write the velocity, temperature, density, and mole fractions to a CSV file
f.write_csv('CH4_adiabatic1.5_Tu300_0.0H2_'+str(phi)+'.csv', species='Y',quiet=False)

#t.save ('CH4_HRR'+str(phi)+'.csv')
        
#t.write_csv('CH4_adiabatic_0.0H2_HRR_'+str(phi)+'.csv', species='Q', quiet=False)
