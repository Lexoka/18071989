#!/usr/bin/env bash

for FILE in *.pdf
do
	convert -density 200 $FILE -quality 90 $(basename $FILE .pdf).png
	mv $FILE pdf_storage/
done
