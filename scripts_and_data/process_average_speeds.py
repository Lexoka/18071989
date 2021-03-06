#!/usr/bin/env python
import sys

# This script does little more than just reading the average cursor speeds, splitting them up according to target speed speed,
# and then making neat little csv files. That's pretty much it.
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
		concat = sp + [line[1]]
		if sp[3] == "0.73":
			listlow.append(concat)
		elif sp[3] == "1.46":
			listmed.append(concat)
		elif sp[3] == "2.19":
			listhigh.append(concat)
		else:
			liststatic.append(concat)
	return(liststatic, listlow, listmed, listhigh)

def SaveList(list, tag):
	with open("average_speeds_032_" + tag + ".csv", "w") as outfile:
		if tag == "static":
			outfile.write("#Subject	Block	Average_cursor_speed\n")
		else:
			outfile.write("#Subject	Angle	Frequency	Speed	Average_cursor_speed\n")
		for line in list:
			if tag == "static":
				outfile.write(line[0] + "\t" + line[3] + "\t" + str(line[4]) + "\n")
			else:
				outfile.write(line[0] + "\t" + line[1] + "\t" + line[2] + "\t" + line[3] + "\t" + str(line[4]) + "\n")

def main():
	contents = GetFile()
	contents = RemoveCrap(contents)
	liststatic, listlow, listmed, listhigh = ListSplit(contents)
	SaveList(liststatic, "static")
	SaveList(listlow, "low")
	SaveList(listmed, "med")
	SaveList(listhigh, "high")

if __name__ == "__main__":
	main()
