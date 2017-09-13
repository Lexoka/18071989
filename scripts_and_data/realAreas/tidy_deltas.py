#!/usr/bin/env python
import numpy as np
import sys
import pandas as pd

# Basically just builds a proper two-dimensional table from the three columns
def FillDF(tidyDf, dirtyDf):
	for index, row in dirtyDf.iterrows():
		#print(row)
		a = row[0]
		f = row[1]
		m = row[2]
		tidyDf.loc[a,f] = m
	print("\n\ntidyDf:")
	print(tidyDf.head())
	tidyDf.to_csv("tidy_linapprox.csv",sep="\t", index=False)

def SortDF(dirtyDf):
	dirtyDf["ARF"] = dirtyDf.Angle * np.sqrt(dirtyDf.Frequency)
	dirtyDf["AF"] = dirtyDf.Angle * dirtyDf.Frequency
	dirtyDf = dirtyDf.sort_values(["ARF"])
	print("\n\nSorted:")
	print(dirtyDf.head())

	# Rearranging columns to fit gnuplot script, maybe the other way around would be better
	cols = dirtyDf.columns.tolist()
	cols = cols[:2] + [cols[6]] + [cols[5]] + cols[2:5]

	dirtyDf = dirtyDf[cols]
	print(dirtyDf.head())

	dirtyDf.to_csv("quadApproxSorted.csv", sep="\t", index=False)

def main():
	if len(sys.argv) >= 2:
		filename = sys.argv[1]
		dirtyDf = pd.read_csv(filename, sep="\t")
		print("Original:")
		print(dirtyDf.head())
		print(dirtyDf.tail())
		col_labels = list(set(dirtyDf.Frequency))
		row_labels = list(set(dirtyDf.Angle))
		col_labels.sort()
		row_labels.sort()
		#tidyDf = pd.DataFrame(index=row_labels, columns=col_labels)
		#FillDF(tidyDf, dirtyDf)

		SortDF(dirtyDf)

		#print(dirtyDf.head())

	else:
		print("Usage: please provide the path to the linear approx file you wish to reshape, e.g.:")
		print(sys.argv[0] + " quadApprox.csv")


if __name__ == "__main__":
	main()
