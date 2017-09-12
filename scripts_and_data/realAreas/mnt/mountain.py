#!/usr/bin/env python3
import matplotlib.pyplot as plt
import numpy
from numpy import exp, log10 as log



def chabrier03individual(m):
	k = 0.158 * exp(-(-log(0.08))**2/(2 * 0.69**2))
	return numpy.where(m <= 1,
		0.158*(1./m) * exp(-(log(m)-log(0.08))**2/(2 * 0.69**2)),
		k*m**-2.3)

def chabrier03system_bu(m):
	k = 0.086 * exp(-(-log(0.22))**2/(2 * 0.57**2))
	return numpy.where(m <= 1,
		0.086*(1./m) * exp(-(log(m)-log(0.22))**2/(2 * 0.57**2)),
		k*m**-2.3)

def chabrier03system(m):
	k = 0.08
	return numpy.where(m <= 100,
		(0.086/m) * exp( -(log(m)+0.657577319)**2/0.6498 ),
		k*m**-2.3)


plt.figure(figsize=(4,4))
m = numpy.logspace(-2, 2, 400)

for label, imf in zip('Chabrier03individual Chabrier03system'.split(), [chabrier03individual, chabrier03system]):
	plt.plot(m, imf(m)/imf(1), label=label)

plt.gca().set_yscale('log')
plt.gca().set_xscale('log')
plt.xlim(1e-2, 12000)
plt.ylim(1e-3, 1e3)
plt.legend(loc='best', prop=dict(size=8))
plt.xlabel('Mass [Solar mass]')
plt.ylabel(r'Mass Function $\xi(m)\Delta m$')
#plt.savefig('imf.pdf', bbox_inches='tight')
#plt.savefig('imf.svg', bbox_inches='tight')
#plt.savefig('imf.png', bbox_inches='tight')
plt.show()
