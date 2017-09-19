#!/usr/bin/env python
import numpy as np
import sys
import pandas as pd

def GetBinStd(df):
	pass

def SortDF(df):
	df["ARF"] = df.Angle * np.sqrt(df.Frequency)
	df["AF"] = df.Angle * df.Frequency
	df = df.sort_values(["ARF"])
	print("\n\nSorted:")
	print(df.head())
#	df.to_csv("linApproxSorted.csv", sep="\t", index=False)

def main():
	if len(sys.argv) >= 2:
		filename = sys.argv[1]
		df = pd.read_csv(filename, sep="\t")
		print("Original:")
		print(df.head())
		col_labels = list(set(df.Frequency))
		row_labels = list(set(df.Angle))
		col_labels.sort()
		row_labels.sort()
		SortDF(df)
	else:
		print("Usage: please provide the path to the linear approx file you wish to reshape, e.g.:")
		print(sys.argv[0] + " linApprox.csv")


if __name__ == "__main__":
	main()
