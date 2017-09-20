#!/usr/bin/env python
import numpy as np
import sys
import pandas as pd

DISPLAY_FOR_HEAD = 40

R_START	= 0.1
R_END	= 4.0
R_NUM	= 80

I_RANGE = np.linspace(R_START, R_END, R_NUM) # 0.1, 0.2, 0.3, ..., 2.0
J_RANGE = np.linspace(R_START, R_END, R_NUM) # 0.1, 0.2, 0.3, ..., 2.0

def GetVersionStd(df):
	nbVals = len(df.m)
	binSize = int(nbVals/20.0) + 1 # To make sure we don't leave any bits behind
	stdList = []
	binVals = []
	nbEncountered = 0
	for mVal in df.m:
		binVals.append(mVal)
		nbEncountered += 1
		if nbEncountered == binSize:
			binStd = np.std(binVals)
			stdList.append(binStd)
			binVals = []
			nbEncountered = 0
	if len(binVals) > 0:
		binStd = np.std(binVals)
		stdList.append(binStd)
	return(stdList)



def SortDF(df, i):
	label = df.columns.values[i]
	df = df.sort_values([label])
	return(df)

def ProcessAllColumns(df):
	res = []
	cnt = 0
	for i in I_RANGE:
		for j in J_RANGE:
			print("Processing condition " + str(cnt) + " out of " + str(R_NUM**2))
			label = "A^" + str(i) + "F^" + str(j)
			df[label] = (df.Angle**i) * (df.Frequency**j)
			df = df.sort_values([label])
			stdList = GetVersionStd(df)
			res.append( ( i, j, np.mean(stdList) ) )
			cnt += 1
	return(res)
	#print(df.columns.values)

def SaveRes(res):
	fname = "spread_v_af.csv"
	with open(fname, "w") as outfile:
		outfile.write("A_exp	F_exp	Mean_std\n")
		for cond in res:
			aexp, fexp, mstd = cond
			if fexp == R_START:
				outfile.write("\n")
			saexp = "{0:.4g}".format(aexp)
			sfexp = "{0:.4g}".format(fexp)
			outfile.write(saexp + "\t" + sfexp + "\t" + str(mstd) + "\n")
	print("Results saved as " + fname + ".")


def main():
	if len(sys.argv) >= 2:
		filename = sys.argv[1]
		df = pd.read_csv(filename, sep="\t")
		print("Original:")
		print(df.head())
		res = ProcessAllColumns(df)

		print("With all columns:")
		print(df.head())
		#print(df.head(DISPLAY_FOR_HEAD))

		#print("Sorted by first AF col:")
		#df = SortDF(df, 4)
		#print(df.head(DISPLAY_FOR_HEAD))
		#print(df.iloc[:,0])
	#	stdList = GetVersionStd(df)
	#	print(stdList, np.mean(stdList))
		SaveRes(res)
	else:
		print("Usage: please provide the path to the linear approx file you wish to reshape, e.g.:")
		print(sys.argv[0] + " linApprox.csv")


if __name__ == "__main__":
	main()
