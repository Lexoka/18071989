#!/usr/bin/env python
import numpy as np
import sys
import pandas as pd

# Basically just builds a proper two-dimensional table from the three columns
def FillDF(tidyDf, dirtyDf):
	for index, row in dirtyDf.iterrows():
		#print(row)
		f = row[0]
		a = row[1]
		area = row[3]
		tidyDf.loc[a,f] = area
	tidyDf.to_csv("tidy_areasFromF.csv",sep="\t")


def main():
	if len(sys.argv) >= 2:
		filename = sys.argv[1]
		dirtyDf = pd.read_csv(filename, sep="\t")
		col_labels = list(set(dirtyDf.Frequency))
		row_labels = list(set(dirtyDf.Angle))
		col_labels.sort()
		row_labels.sort()
		tidyDf = pd.DataFrame(index=row_labels, columns=col_labels)
		#print(dirtyDf.head())
		FillDF(tidyDf, dirtyDf)
	else:
		print("Usage: please provide the path to the linear approx file you wish to reshape, e.g.:")
		print(sys.argv[0] + " areasFromAF.csv")


if __name__ == "__main__":
	main()
