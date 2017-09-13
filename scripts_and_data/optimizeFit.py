#!/usr/bin/env python
import numpy as np
import sys
import pandas as pd
import scipy
import scipy.optimize
import scipy.stats
import matplotlib.pyplot as plt

def RayleighPdf(x, a, b, d, sigma):
	#sigma = 3
	#b = 1
	#a = 2.65
	#d = 0.15
	k = 2
	res = a*((x-b)/sigma**k)*np.exp( (-(x-b)*(x-b))/(2*sigma**k) ) + d
	return(res)


def FixedRayleighPdf(x, a, b, c, d, sigma):
	#sigma = 3
	"""
	a *= 0.1
	b *= 0.1
	c *= 0.001
	d *= 0.1
	"""
	#a = 0.3
	#b = 0.1
	#c = 0.002
	#d = 0.3
	#sigma = 0.6
	k = 2
	res = a*((c*x-b)/sigma**k)*np.exp( (-(c*x-b)*(c*x-b))/(2*sigma**k) ) + d
	return(res)

def ManualRayleigh(x, a,b,d, sigma):
	"""
	a = 0.0141728564
	b = 0.0067526069
	d = 0.0031374369
	sigma = 0.01231879762
	"""
	k = 2
	res = a*((x*0.01-b)/sigma**k)*np.exp( (-(x*0.01-b)*(x*0.01-b))/(2*sigma**k) ) + d
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
	plt.plot(df.AreaDivV, RayleighPdf(df.AreaDivV, *popt), "r-", label="RayleighPdf")
	plt.show()

def ManualFuncAf(afDf):
	popt, pcov = scipy.optimize.curve_fit(ManualRayleigh, afDf.ARF, afDf.TimeDivSpeed)
	print(popt)

	print("pearsonr:")
	print(scipy.stats.pearsonr(afDf.TimeDivSpeed, ManualRayleigh(afDf.ARF, *popt)))

	plt.plot(afDf.ARF, afDf.TimeDivSpeed, "b+", label="data")
	plt.plot(afDf.ARF, ManualRayleigh(afDf.ARF, *popt), "r-", label="RayleighPdf")
	plt.show()

def FitFuncAf(afDf):
	afDf["UseAsX"] = afDf.ARF * 0.01
	popt, pcov = scipy.optimize.curve_fit(RayleighPdf, afDf.UseAsX, afDf.TimeDivSpeed)
	print(popt)

	print("pearsonr:")
	print(scipy.stats.pearsonr(afDf.TimeDivSpeed, RayleighPdf(afDf.UseAsX, *popt)))

	plt.plot(afDf.UseAsX, afDf.TimeDivSpeed, "b+", label="data")
	plt.plot(afDf.UseAsX, RayleighPdf(afDf.UseAsX, *popt), "r-", label="RayleighPdf")
	plt.show()



def main():
	if len(sys.argv) >= 2:
		filename = sys.argv[1]
		df = pd.read_csv(filename, sep="\t")
		print("Original areaTimeFit:")
		print(df.head())
	#	FitFunc(df)

		if len(sys.argv) >= 3:
			print("")
			afFilename = sys.argv[2]
			afDf = pd.read_csv(afFilename, sep="\t")
			print("Original afTimeFit:")
			print(afDf.head())
			#FitFuncAf(afDf)
			ManualFuncAf(afDf)
		#print(df.TimeDivV)
	else:
		print("Usage: please provide the path to at least one file, e.g.:")
		print(sys.argv[0] + " areaTimeFit.csv")
		print("Or...")
		print(sys.argv[0] + " areaTimeFit.csv afTimeFit.csv")


if __name__ == "__main__":
	main()
