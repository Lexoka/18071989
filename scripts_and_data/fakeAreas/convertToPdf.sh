#!/usr/bin/env bash

for FILE in *.eps
do
	#convert $FILE "$(basename $FILE .eps).pdf"
	epstopdf $FILE
done

for FILE in *.svg
do
	#convert $FILE "$(basename $FILE .svg).pdf"
	inkscape $FILE --export-pdf="$(basename $FILE .svg).pdf" # Much better!
	# It seems that convert can handle any format but sucks with all of them.
done
