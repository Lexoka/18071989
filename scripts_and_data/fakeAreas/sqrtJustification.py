#!/usr/bin/env python
import numpy as np
import sys
import pandas as pd

DISPLAY_FOR_HEAD = 40

EXP_START = 0.01
#EXP_START = 0.2
MAX_I = 4.0
MAX_J = 2.0

NB_I = int(MAX_I/EXP_START) + 1
NB_J = int(MAX_J/EXP_START) + 1

I_RANGE = np.empty(NB_I)
J_RANGE = np.empty(NB_J)

#print(I_RANGE)


def InitRanges():
	global I_RANGE
	global J_RANGE

	expVal = 0
	for i in range(NB_I):
		I_RANGE[i] = expVal
		expVal += EXP_START

	expVal = 0
	for i in range(NB_J):
		J_RANGE[i] = expVal
		expVal += EXP_START


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
	cnt = 1
	for i in I_RANGE:
		for j in J_RANGE:
			print("Processing condition " + str(cnt) + " out of " + str(NB_I*NB_J))
			label = "A^" + str(i) + "F^" + str(j)
			df[label] = (df.Angle**i) * (df.Frequency**j)
			df = df.sort_values([label])
			stdList = GetVersionStd(df)
			res.append( ( i, j, np.mean(stdList) ) )
			cnt += 1
			df = df.drop(label, axis=1)	# Now this is super important because otherwise, the dataframe becomes enormous and sorting it takes forever.
									# Plus it consumes unneccessarily huge amounts of RAM.
	return(res)
	#print(df.columns.values)

def SaveRes(res):
	fname = "spread_v_af.csv"
	with open(fname, "w") as outfile:
		outfile.write("A_exp	F_exp	Mean_std\n")
		for cond in res:
			aexp, fexp, mstd = cond
			if fexp == 0:
				outfile.write("\n")
			saexp = "{0:.4g}".format(aexp)
			sfexp = "{0:.4g}".format(fexp)
			outfile.write(saexp + "\t" + sfexp + "\t" + str(mstd) + "\n")
	print("Results saved as " + fname + ".")


def main():
	if len(sys.argv) >= 2:
		filename = sys.argv[1]
		df = pd.read_csv(filename, sep="\t")

		InitRanges()
		print(I_RANGE)
		print(J_RANGE)

		print(NB_I, NB_J, NB_I*NB_J)

		print("Original:")
		print(df.head())
		res = ProcessAllColumns(df)

		print("With all columns:")
		print(df.head())

		SaveRes(res)
	else:
		print("Usage: please provide the path to the file you need, e.g.:")
		print(sys.argv[0] + " linApprox.csv")


if __name__ == "__main__":
	main()
