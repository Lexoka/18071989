#!/usr/bin/env python
import numpy as np
import sys
import pandas as pd
import scipy
import scipy.optimize
import scipy.stats
import matplotlib.pyplot as plt

MANUAL = True

def BrokenPower(x, M, bend, sigma):
	if MANUAL:
		M = 10
		#bend = 150
		sigma = 2.0
	res = M * (	1 + (x/bend)**sigma	)**(-1.0/sigma)
	return(res)


def EasyTest(x,a,b):
	return(a*x+b)

def FitFunc(df):
	#popt, pcov = scipy.optimize.curve_fit(EasyTest, df.ARF, df.m)
	popt, pcov = scipy.optimize.curve_fit(BrokenPower, df.ARF, df.m)
	print(popt)
	print("pearsonr:")
	print(scipy.stats.pearsonr(df.m, BrokenPower(df.ARF, *popt)))

	plt.plot(df.ARF, df.m, 'b+', label='data')
	plt.plot(df.ARF, BrokenPower(df.ARF, *popt), "r-", label="BrokenPower")
	plt.show()


def main():
	if len(sys.argv) >= 2:
		filename = sys.argv[1]
		df = pd.read_csv(filename, sep="\t")
		print("Original linApproxSorted:")
		print(df.head())
		FitFunc(df)

	else:
		print("Usage: please provide the path to at least one file, e.g.:")
		print(sys.argv[0] + " linApproxSorted.csv")


if __name__ == "__main__":
	main()
