%% Devon Quaternik
% ELEN 644
% HW 2

%% Problem 4
% Part a
im = imread('4.1.05.tiff');

figure;
subplot(1,3,1),histogram(im(:,:,1),64)
axis([0 255 0 16000]);
title('R histogram');
subplot(1,3,2),histogram(im(:,:,2),64)
axis([0 255 0 16000]);
title('G histogram');
subplot(1,3,3),histogram(im(:,:,3),64)
axis([0 255 0 16000]);
title('B histogram');
suptitle('Histograms of house.tiff');

% Part b
hside = im(68:88,153:173,:);
hroof = im(196:216,74:94,:);
hshad = im(177:197,222:242,:);
sky1 = im(180:200,14:34,:);
sky2 = im(11:31,170:190,:);

mn_hside(1) = mean2(hside(:,:,1));
std_hside(1) = std2(hside(:,:,1));
mn_hside(2) = mean2(hside(:,:,2));
std_hside(2) = std2(hside(:,:,2));
mn_hside(3) = mean2(hside(:,:,3))
std_hside(3) = std2(hside(:,:,3))

mn_hroof(1) = mean2(hroof(:,:,1));
std_hroof(1) = std2(hroof(:,:,1));
mn_hroof(2) = mean2(hroof(:,:,2));
std_hroof(2) = std2(hroof(:,:,2));
mn_hroof(3) = mean2(hroof(:,:,3))
std_hroof(3) = std2(hroof(:,:,3))

mn_hshad(1) = mean2(hshad(:,:,1));
std_hshad(1) = std2(hshad(:,:,1));
mn_hshad(2) = mean2(hshad(:,:,2));
std_hshad(2) = std2(hshad(:,:,2));
mn_hshad(3) = mean2(hshad(:,:,3))
std_hshad(3) = std2(hshad(:,:,3))

mn_sky1(1) = mean2(sky1(:,:,1));
std_sky1(1) = std2(sky1(:,:,1));
mn_sky1(2) = mean2(sky1(:,:,2));
std_sky1(2) = std2(sky1(:,:,2));
mn_sky1(3) = mean2(sky1(:,:,3))
std_sky1(3) = std2(sky1(:,:,3))

mn_sky2(1) = mean2(sky2(:,:,1));
std_sky2(1) = std2(sky2(:,:,1));
mn_sky2(2) = mean2(sky2(:,:,2));
std_sky2(2) = std2(sky2(:,:,2));
mn_sky2(3) = mean2(sky2(:,:,3))
std_sky2(3) = std2(sky2(:,:,3))

% R value for house would be 150ish and below, G would be 120 and below, B
% would be 125 and below. Most of the differentiation would come from the R
% value as the G and B are similar between the side of the roof and the
% house. Choosing these as the max should separate the house and the sky.  

% For the sky, R would be 155, B would be 200, and G would be 220. For the
% sky, choosing the threhsold such that these numbers are minimum would be
% best to ensure separation from the house. 

% Part c
[m,n,c] = size(im);
side_im = zeros(m,n,c);
sky_im = zeros(m,n,c);
fin_im = zeros(m,n,c);

for i = 1:m
    for j = 1:n
        if im(i,j,1) <= 190 && im(i,j,2) <= 120 && im(i,j,3) <= 125
            side_im(i,j,1) = 1;
        elseif im(i,j,1) >= 150 && im(i,j,2) >= 190 && im(i,j,3) >= 210
            sky_im(i,j,3) = 1;
        end
        
        if side_im(i,j,1) == 1 && sky_im(i,j,3) == 0
            fin_im(i,j,1) = 255;
            fin_im(i,j,2) = 0;
            fin_im(i,j,3) = 0;
        elseif side_im(i,j,1) == 0 && sky_im(i,j,3) == 1
            fin_im(i,j,1) = 0;
            fin_im(i,j,2) = 0;
            fin_im(i,j,3) = 255;
        end
        
        if im(i,j,:) >= 200
            fin_im(i,j,:) = 255;
        end
        
    end
end

figure;
subplot(2,2,1),imshow(im)
title('Original Image');
subplot(2,2,2),imshow(side_im)
title('Side Only Image');
subplot(2,2,3),imshow(sky_im)
title('Sky Only Image');
subplot(2,2,4),imshow(fin_im)
title('Final Image');

% The threshold values ([R G B]) for the sky are [150 190 210] Greater than
% that is considered sky. Side image is [190 120 125], below that is
% considered to be building. Areas where both sky and side are lit up are
% decided as 0 black points. White is done by setting all thresholds to
% greater than 200. This will override spots that were previously
% considered blue. These are not perfect systems, as some white gets
% through as black, blue and red, but you can tell where most areas should
% be. 































