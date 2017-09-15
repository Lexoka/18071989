#!/usr/bin/env python3
import numpy as np
import sys
import pandas as pd
import scipy
import scipy.optimize
import scipy.stats
import matplotlib.pyplot as plt

MANUAL = False
SEMI_MANUAL = True

# OK, so this can work without fixing beta, sort of. The issue is that we have way more data points for intermediate values of
# A.sqrt(F) than for very high ones, which means that scipy sort of tends to ignore those.
# But they matter, they matter a lot, as they more accurately define the slope of the second power law,
# especially since they're nicely consistent and well aligned.

# If if fix beta, then it's really not fitting much anymore. This sort of confirms my manual fit but adds little of value.
# I think I'll keep my fit and its nicely simple parameters with few digits after the decimal point.

#def DoublePower(x, ga, gb, beta, N, bend):
def DoublePower(x, M, ga):
	if MANUAL:
		ga = 0.97
		gb = 1.0
		beta = -2.78
		N = 0.05
		bend = 120

	if SEMI_MANUAL:
		N = 0.05
		bend = 120
		gb = 1.0
		beta = -2.78
	gRes = N*M * x**ga * ( 1 + (x/bend)**(abs(beta)*gb) )**(np.sign(beta)/gb)
	return(gRes)


def FitFunc(df):
	#popt, pcov = scipy.optimize.curve_fit(EasyTest, df.ARF, df.m)
	#popt, pcov = scipy.optimize.curve_fit(DoublePower, df.ARF, df.ax, ga, gb, beta, N, bend)
	popt, pcov = scipy.optimize.curve_fit(DoublePower, df.ARF, df.ax)
	print(popt)
	print("pearsonr:")
	print(scipy.stats.pearsonr(df.ax, DoublePower(df.ARF, *popt)))

	#plt.plot(df.ARF, df.ax, 'b+', label='data')
	#plt.plot(df.ARF, DoublePower(df.ARF, *popt), "r-", label="DoublePower")

	plt.loglog(df.ARF, df.ax, 'b+', label='data')
	plt.loglog(df.ARF, DoublePower(df.ARF, *popt), "r-", label="DoublePower")
	plt.show()


def main():
	if len(sys.argv) >= 2:
		filename = sys.argv[1]
		df = pd.read_csv(filename, sep="\t")
		print("Original quadApproxSorted:")
		print(df.head())
		FitFunc(df)

	else:
		print("Usage: please provide the path to at least one file, e.g.:")
		print(sys.argv[0] + " quadApproxSorted.csv")


if __name__ == "__main__":
	main()
