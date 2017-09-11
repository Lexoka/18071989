#!/usr/bin/env python
import numpy as np
import sys
import pandas as pd




def main():
	if len(sys.argv) >= 2:
		filename = sys.argv[1]
		df = pd.read_csv(filename, sep="\t")
		print("Original:")
		print(df.head())
	else:
		print("Usage: please provide the path to the linear approx file you wish to reshape, e.g.:")
		print(sys.argv[0] + " linApproxSorted.csv")


if __name__ == "__main__":
	main()
