import cantera as ct

import numpy as np

import math

#from scipy.integrate import solve_ivp

#matplotlib notebook

import matplotlib.pyplot as plt
print(f"Cantera Version: {ct.__version__}")

#######################################################################
# Input Parameters
#######################################################################

T_0 = 460  # inlet temperature [K]
pressure = 850000  # constant pressure [Pa]
composition_0 = 'CH3NHNH2:1, N2O4:1.637'
length = 89e-3  # *approximate* PFR length [m]
#u_0 = 4.835156  # inflow velocity [m/s]
chamber_dia = 0.080 #mm
area = (22/7)*(chamber_dia*chamber_dia)/4  # cross-sectional area [m**2]
print('cross-sectional area: ', area)

# input file containing the reaction mechanism
reaction_mechanism = 'mech23_nasa7.yaml'

# Resolution: The PFR will be simulated by 'n_steps' time steps or by a chain
# of 'n_steps' stirred reactors.
n_steps = 500
#####################################################################

# import the gas model and set the initial conditions
gas1 = ct.Solution(reaction_mechanism)
gas1.TPY = T_0, pressure, composition_0
mass_flow_rate = 0.553 #input value

u_0 = mass_flow_rate/((gas1.density)*area)
print('initial velocity: ', u_0)
# create a new reactor
r1 = ct.IdealGasConstPressureReactor(gas1)
#r1 = ct.IdealGasReactor(gas1)
# create a reactor network for performing time integration
sim1 = ct.ReactorNet([r1])

dx = length/n_steps
dt = np.zeros(n_steps) #time steps

dt[0] = dx/u_0
print(dt[0])

z = np.zeros(n_steps) #axial locations
v = np.zeros(n_steps) #velocity
T = np.zeros(n_steps) #temperature
x = np.zeros(n_steps) #axial location
kappa = np.zeros(n_steps) #thermal conductivity
cylinder_Mach = np.zeros(n_steps)


sim1.advance(dt[0])
v[0] = u_0
z[0] = 0
#v[1] = mass_flow_rate/((r1.density)*area)
print(r1.thermo.T)
T[0] = r1.thermo.T
print(r1.thermo.density)
kappa[0] = r1.thermo.thermal_conductivity
HRR = np.zeros(n_steps)
HRR[0] = r1.thermo.heat_release_rate


gamma = np.zeros(n_steps)
gamma[0] = (r1.thermo.cp_mass)/(r1.thermo.cv_mass)
cylinder_Mach[0] = v[0]/(math.sqrt(gamma[0]*(8314.4626/(r1.thermo.mean_molecular_weight))*(r1.thermo.T)))
print('injector mach no. : ', cylinder_Mach[0])
#print('gamma is:', gamma[0])

#print(r1.thermo.Y)

print(gas1.report())

for n in range(n_steps-1):
    v[n+1] = mass_flow_rate/((r1.density)*area)
    dt[n+1] =  dt[n] + (dx/v[n+1])
    sim1.reinitialize()
    sim1.advance(dt[n+1])
    T[n+1] = r1.thermo.T
    kappa[n+1] = r1.thermo.thermal_conductivity
    HRR[n+1] = r1.thermo.heat_release_rate
    gamma[n+1] = (r1.thermo.cp_mass)/(r1.thermo.cv_mass)
    cylinder_Mach[n+1] = v[n+1]/(math.sqrt(gamma[n+1]*(8314.4626/(r1.thermo.mean_molecular_weight))*(r1.thermo.T)))
     
    
nozzle_inlet_Pressure = pressure - 0.5*(v[n_steps-1]*v[n_steps-1]*(r1.thermo.density))
print('nozzle inlet pressure: ', nozzle_inlet_Pressure, 'Pa' )
  

x[0] = 0    
for n in range(n_steps-1):
    x[n+1] = x[n] + dx
    
#print('final velocity:', v[n_steps-1])
mdot = (r1.thermo.density)*area*(v[n_steps-1])
print('mass flow rate: ', mdot)

plt.figure()
plt.plot(dt, T)
plt.ylabel('$T$ [K]')
plt.xlabel('$t$ [s]')
plt.show()
#print(v)

plt.figure()
plt.plot(x, T)
plt.ylabel('$T$ [K]')
plt.xlabel('$x$ [m]')
plt.show()


plt.figure()
plt.plot(x, v)
plt.ylabel('velocity of gas [m/s]')
plt.xlabel('$x$ [m]')
plt.show()

plt.figure()
plt.plot(x, cylinder_Mach)
plt.ylabel('mach no.')
plt.xlabel('$x$ [m]')
plt.show()

#plt.figure()
#plt.plot(x, HRR)
#plt.ylabel('heat release rate [W]')
#plt.xlabel('$x$ [m]')
#plt.show()



#plt.figure()
#plt.plot(x, kappa)
#plt.ylabel('$thermal_conductivity$ [W/mK]')
#plt.xlabel('$x$ [m]')
#plt.show()