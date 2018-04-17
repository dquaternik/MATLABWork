Devon Quaternik
ELEN 640 
Project Part 1 Read Me

This zip file contains my report as well as the matlab code necessary to 
    run everything. The test images given are also included for simplicity 
    in running 'runprjpart1.m'

'DQ_ProjectPart1_ELEN640_F16.docx' is the main report.

'threshold.m' will create an image thresholded to input value

'threshtest.m' will create 2 figures with 4 images each for 8 total images. 
	It will threshold the original image, a smoothed image, morphologically 
    filtered images, smoothed then morphologically filtered images, and 
    morphologically filter then smoothed images.

'edge4.m' will create a figure that has 4 images. Each image is a 
    representation of the edges using a different filter. The 4 filters 
    are Canny, Sobel, LoG, and Prewitt.

'edgetest.m' will create 8 figures, similar in pattern to that of 
    threshtest, only with the extra parameter of type of edge filter used.

'runprjpart1.m' runs all 6 test images through 'edgetest.m' and 'threshtest.m'. 
    Since 2 different thresholds are used (middle value of range [0 255] 
    and median of image), you end up getting 6*13 total figures from Matlab.
	This script may take a long time to run. 

'prjpart1fpics.m' will generate the final pictures given in the report 
    file, 'DQ_ProjectPart1_ELEN640_F16.docx' and contains all parameters 
    used to obtain best image.

