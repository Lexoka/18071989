#!/usr/bin/env bash

for FILE in *.eps
do
	#convert $FILE "$(basename $FILE .eps).pdf"
	epstopdf $FILE
done
