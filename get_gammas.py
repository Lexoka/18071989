#!/usr/bin/env python
import numpy as np
import sys
import pandas as pd

def FillDF(tidyDf, dirtyDf):
	for index, row in dirtyDf.iterrows():
		#print(row)
		a = row[0]
		f = row[1]
		m = row[2]
		tidyDf.loc[a,f] = m
	#print(tidyDf)
	tidyDf.to_csv("tidy_linapprox.csv",sep="\t")


def main():
	if len(sys.argv) >= 2:
		filename = sys.argv[1]
		dirtyDf = pd.read_csv(filename, sep="\t")
		#df = pd.read_csv(filename, engine="python", sep="\t*") # Need to specify python engine and t* otherwise...
						# well otherwise it just doesn't detect columns properly and I have no idea why, and I get NaNs and shit all over
		#print(df.head(40))
		col_labels = list(set(dirtyDf.Frequency))
		row_labels = list(set(dirtyDf.Angle))
		col_labels.sort()
		row_labels.sort()

		#print(row_labels)
		#print(col_labels)

		tidyDf = pd.DataFrame(index=row_labels, columns=col_labels)
		print(tidyDf.columns)
		#print(dirtyDf)
		#print(dirtyDf.iloc[4,2])
		#print(tidyDf)

		FillDF(tidyDf, dirtyDf)

	else:
		print("Usage: please provide the path to the linear approx file you wish to reshape, e.g.:")
		print(sys.argv[0] + " linear_approx.csv")



if __name__ == "__main__":
	main()
