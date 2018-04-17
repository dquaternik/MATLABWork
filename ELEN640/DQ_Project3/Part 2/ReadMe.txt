Devon Quaternik
ELEN 640 
Project Part 2 Read Me

This zip contains my report as well as the matlab code necessary to
	run everything. The test images are given for simplicity in
	running any of the run scripts. 

'DQ_ProjectPart2_ELEN640_F16.docx' is the main report.

'createodd.m' will check if an image's columns and rows are even
	and if so will cut the first row/column of pixels out.

'hough.m' will run the circular Hough transform, as well as display
	the image and the found circles. 

'houghc.m' is exactly the same, but due to a slight syntax issue
	has to be separate for color images. 

'contcircfind.m' will find the image pyramids necessary to generate
	a difference image, then use that to find the cirlces.

'circmatch.m' will use matched filtering to find the normalized 
	cross correlation, then will find the circles.

'prjpart2runscriptgray.m' will run all cases for the gray image set.

'prjpart2runscriptC1.m' will run all cases for the first color image 
	set.

'prjpart2runscriptC2.m' will run only the Hough transform on the edge
	detected image. This is due to poor performace in other cases,
	as judged from image set 1. 

'prjpart2images.m' will generate the images found in the report file.

The three folders contain each image set. 