#!/usr/bin/env python
import numpy as np
import sys
import pandas as pd
import scipy
import scipy.optimize
import scipy.stats
import matplotlib.pyplot as plt

def RayleighPdf(x, a, b, sigma, d):
	#sigma = 3
	#b = 1
	#a = 2.65
	#d = 0.15
	k = 2
	res = a*((x-b)/sigma**k)*np.exp( (-(x-b)*(x-b))/(2*sigma**k) ) + d
	return(res)

def EasyTest(x, a, b):
	return(a*x + b)

def FitFunc(df):
	#popt, pcov = scipy.optimize.curve_fit(EasyTest, df.ARF, df.m)
	popt, pcov = scipy.optimize.curve_fit(RayleighPdf, df.AreaDivV, df.TimeDivV)
	print(popt)

	print("pearsonr:")
	print(scipy.stats.pearsonr(df.TimeDivV, RayleighPdf(df.AreaDivV, *popt)))

	plt.plot(df.AreaDivV, df.TimeDivV, 'b+', label='data')
	plt.plot(df.AreaDivV, RayleighPdf(df.AreaDivV, *popt), "r-", label="LinFit")
	plt.show()




def main():
	if len(sys.argv) >= 2:
		filename = sys.argv[1]
		df = pd.read_csv(filename, sep="\t")
		print("Original:")
		print(df.head())
		FitFunc(df)
		#print(df.TimeDivV)
	else:
		print("Usage: please provide the path to the linear approx file you wish to reshape, e.g.:")
		print(sys.argv[0] + " areaTimeFit.csv")


if __name__ == "__main__":
	main()
