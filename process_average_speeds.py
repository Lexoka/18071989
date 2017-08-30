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
		line[0] = line[0][:-13] # get rid of _smoothed.csv at the end
		line[1] = float(line[1])
	return(contents)

def ListSplit(contents):
	listlow = []
	listmed = []
	listhigh = []
	liststatic = []
	for line in contents:
		sp = line[0].split("_")
		if len(sp) > 3:
			if sp[3] == "0.73":
				listlow.append(line)
			elif sp[3] == "1.46":
				listmed.append(line)
			else:
				listhigh.append(line)
		else:
			liststatic.append(line)
	return(liststatic, listlow, listmed, listhigh)

def SaveList(list, tag):
	with open("average_speeds_032_" + tag + ".csv", "w") as outfile:
		for line in list:
			outfile.write(line[0] + "\t" + str(line[1]) + "\n")

def main():
	contents = GetFile()
	contents = RemoveCrap(contents)
	#PrintList(contents)
	liststatic, listlow, listmed, listhigh = ListSplit(contents)
	#PrintList(listmed)
	SaveList(liststatic, "static")
	SaveList(listlow, "low")
	SaveList(listmed, "med")
	SaveList(listhigh, "high")

if __name__ == "__main__":
	main()
