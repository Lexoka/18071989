#!/usr/bin/env python
import sys

def GetFile():
	with open("average_speeds_032.txt", "r") as infile:
		contents = infile.readlines()
	cleanContents = []
	for line in contents:
		cLine = line.split()
		cleanContents.append(cLine)
	return(cleanContents)

def PrintList(ml):
	for line in ml:
		print(line)

def RemoveCrap(contents):
	for line in contents:
		line[0] = line[0][20:] # get rid of folder and unnecessary subject_ part
		line[1] = float(line[1])
	return(contents)

def main():
	contents = GetFile()
	contents = RemoveCrap(contents)
	PrintList(contents)
	#print(contents[0][0][20:])

if __name__ == "__main__":
	main()
