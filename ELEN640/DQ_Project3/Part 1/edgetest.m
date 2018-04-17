function edgetest(im)
%   edgetest(im)
%   Uses 4 different methods to find edges for 8 cases. Creates 8 figures.
%   Methods are Canny, Sobel, LoG, and Prewitt
%   Cases are 1) Normal Image
%   2) Smoothing then edge   3) Opening then edge
%   4) Closing then edge     5) Smoothing, opening then edge
%   6) Smoothing, closing then edge 7) Opening, smoothing, then edge
%   8) Closing, smoothing then edge

% Initialization
smfil       =   fspecial('average');
se = strel('disk',3,0);


smoothim    =   filter2(smfil,im);
openim      =   imopen(im,se);
closeim     =   imclose(im,se);
smopim      =   imopen(smoothim,se);
smclim      =   imclose(smoothim,se);
opsmim      =   filter2(smfil,openim);
clsmim      =   filter2(smfil,closeim);

% Case 1

edge4(im);
suptitle('Original Image');

% Case 2

edge4(smoothim);
suptitle('Smoothed Image');

% Case 3 

edge4(openim);
suptitle('Opened Image');

% Case 4

edge4(closeim);
suptitle('Closed Image');

% Case 5

edge4(smopim);
suptitle('Smoothed then Opened Image');

% Case 6

edge4(smclim);
suptitle('Smoothed then Closed Image');

% Case 7

edge4(opsmim);
suptitle('Opened then Smoothed Image');

% Case 8

edge4(clsmim);
suptitle('Closed then Smoothed Image');