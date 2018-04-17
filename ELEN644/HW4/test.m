clear;
close all;

%% Problem 2

% Initialize images
im(:,:,1) = imread('cameraman.tif');
im(:,:,2) = imread('rice.png');  
im(:,:,3) = imread('5.1.09.tiff');
[n, m, nim] = size(im);

% Nubmer of levels to use
lev = 3;

% Initialize filters
h1 = 1; % Effectively the same as not filtering. Average over 1 point.
h2 = .25*[1 2 1];
h3 = (1/16)*[1 4 6 4 1];
h4 = fspecial('gaussian',7,1.0);
h5 = firpm(8,[0.0, 0.4, 0.6, 1.0],[1.0, 1.0, 0.0, 0.0]);
nf = 5;

dow1(:,:,:,1) = dscale2(im(:,:,1),h1,lev);
figure;
imshow(dow1(:,:,1),[]);

% dow1(:,:,:,2) = dscale2(im(:,:,1),h2,lev);
% dow1(:,:,:,3) = dscale2(im(:,:,1),h3,lev);
% dow1(:,:,:,4) = dscale2(im(:,:,1),h4,lev);
% dow1(:,:,:,5) = dscale2(im(:,:,1),h5,lev);
% 
% dow2(:,:,:,1) = dscale2(im(:,:,2),h1,lev);
% dow2(:,:,:,2) = dscale2(im(:,:,2),h2,lev);
% dow2(:,:,:,3) = dscale2(im(:,:,2),h3,lev);
% dow2(:,:,:,4) = dscale2(im(:,:,2),h4,lev);
% dow2(:,:,:,5) = dscale2(im(:,:,2),h5,lev);
% 
% dow3(:,:,:,1) = dscale2(im(:,:,3),h1,lev);
% dow3(:,:,:,2) = dscale2(im(:,:,3),h2,lev);
% dow3(:,:,:,3) = dscale2(im(:,:,3),h3,lev);
% dow3(:,:,:,4) = dscale2(im(:,:,3),h4,lev);
% dow3(:,:,:,5) = dscale2(im(:,:,3),h5,lev);
% 
% [m, n, p, q] = size(dow1);
% 
% for j = 0:nf-1
%     for i = 1:lev
%         str = sprintf('Filter # %d',j+1);
%         figure(3*j+1);
%         subplot(1,lev,i),imshow(dow1(:,:,i,j+1),[]);
%         suptitle(str); 
%         figure(3*j+2);
%         subplot(1,lev,i),imshow(dow2(:,:,i,j+1),[]);
%         suptitle(str); 
%         figure(3*j+3);
%         subplot(1,lev,i),imshow(dow3(:,:,i,j+1),[]);
%         suptitle(str); 
%     end
% end
%         
% %% Problem 2
% 
% up1 = uscale(im(:,:,1),h2,lev);
% 
% figure;
% imshow(up1,[]);
% 
% 
% %% Problem 3
% 
% edge1(:,:,1) = edge(im(:,:,1),'Sobel');
% edge1(:,:,2) = edge(im(:,:,1),'LoG');
% edge1(:,:,3) = edge(im(:,:,1),'Canny');
% edge2(:,:,1) = edge(im(:,:,2),'Sobel');
% edge2(:,:,2) = edge(im(:,:,2),'LoG');
% edge2(:,:,3) = edge(im(:,:,2),'Canny');
% edge3(:,:,1) = edge(im(:,:,3),'Sobel');
% edge3(:,:,2) = edge(im(:,:,3),'LoG');
% edge3(:,:,3) = edge(im(:,:,3),'Canny');
% 
% figure;
% subplot(1,3,1), imshow(edge1(:,:,1),[]);
% title('Sobel');
% subplot(1,3,2), imshow(edge1(:,:,2),[]);
% title('LoG');
% subplot(1,3,3), imshow(edge1(:,:,3),[]);
% title('Canny');
% suptitle('Image 1');
% 
% figure;
% subplot(1,3,1), imshow(edge2(:,:,1),[]);
% title('Sobel');
% subplot(1,3,2), imshow(edge2(:,:,2),[]);
% title('LoG');
% subplot(1,3,3), imshow(edge2(:,:,3),[]);
% title('Canny');
% suptitle('Image 2');
% 
% figure;
% subplot(1,3,1), imshow(edge3(:,:,1),[]);
% title('Sobel');
% subplot(1,3,2), imshow(edge3(:,:,2),[]);
% title('LoG');
% subplot(1,3,3), imshow(edge3(:,:,3),[]);
% title('Canny');
% suptitle('Image 3');
