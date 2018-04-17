%% Devon Quaternik
%ELEN 640
%HW3

%% Problem 1
%Part A
clc;
clear;
h = [1 2 3; 2 4 2; 3 2 1];
[S,HCOL,HROW]=isfilterseparable(h);

if S==1
    disp('Yes, a is separable.')
    HCOL
    HROW
elseif S==0
    disp('No, a is not separable.')
end

%Part B
b = [1 2 1; 2 4 2; 1 2 1];

[S,HCOL,HROW]=isfilterseparable(b);
if S==1
    disp('Yes, b is separable.')
    HCOL
    HROW
elseif S==0
    disp('No, b is not separable.')
end

%Part C
c = [-1 -1 -1; -1 9 -1; -1 -1 -1];

[S,HCOL,HROW]=isfilterseparable(c);
if S==1
    disp('Yes, c is separable.')
    HCOL
    HROW
elseif S==0
    disp('No, c is not separable.')
end

%Part D
d = [1 2 1; 0 0 0; -1 -2 -1];

[S,HCOL,HROW]=isfilterseparable(d);
if S==1
    disp('Yes, d is separable.')
    HCOL
    HROW
elseif S==0
    disp('No, d is not separable.')
end

%Part E
e = [0 1 2; -1 0 1; -2 -1 0];

[S,HCOL,HROW]=isfilterseparable(e);
if S==1
    disp('Yes, e is separable.')
    HCOL
    HROW
elseif S==0
    disp('No, e is not separable.')
end

%Part F
f = [1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1];

[S,HCOL,HROW]=isfilterseparable(f);
if S==1
    disp('Yes, f is separable.')
    HCOL
    HROW
elseif S==0
    disp('No, f is not separable.')
end

%Part G
g = [1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1];

[S,HCOL,HROW]=isfilterseparable(g);
if S==1
    disp('Yes, g is separable.')
    HCOL
    HROW
elseif S==0
    disp('No, g is not separable.')
end

%% Problem 2
h=[9 7; 5 3];
f=zeros(12,10);
f(3,3)=2; f(6,5)=7;f(9,4)=10;f(9,5)=20;
g=conv2(f,h)

%% Problem 3
h=[9 7; 5 3];
f=[1 0 2; 1 3 1; 2 1 5];
g=conv2(h,f)
figure
imshow(imresize(g,50,'nearest'),[0 255])

%% Problem 5
h1=(1/9).*[1 1 1; 1 1 1; 1 1 1];
h2=[0 -1 0; -1 5 -1; 0 -1 0];
f=zeros(15,15);
f(8,8)=1;

%Part A
g1x=conv2(f,h1);
g1=conv2(g1x,h1);
figure
imshow(imresize(g1,10,'nearest'),[0 1])
title('Part A')
gmax=max(max(g1))
gmin=min(min(g1))

%Part B
g2x=conv2(f,h2);
g2=conv2(f,h2);
figure
imshow(imresize(g2,10,'nearest'),[0 1])
title('Part B')
gmax=max(max(g2))
gmin=min(min(g2))

%Part C
g3x=conv2(f,h1);
g3=conv2(f,h2);
figure
imshow(imresize(g3,10,'nearest'),[0 1])
title('Part C')

%Part D
g4x=conv2(f,h2);
g4=conv2(f,h1);
figure
imshow(imresize(g4,10,'nearest'),[0 1])
title('Part D')
disp('Because we are working with matrices, multiplying in different orders yields different results. Filter 2 is spreading the little brightness there is out before filter 1 is able to amplify it in part d. This is why you see a bright spot in part c, but only a gray here.')

%Part E
disp('The image would look similar, but brighter. Because the filters are not changing, the effect on uniform images would be the same.')

%% Problem 6

img(1:200,1:300)=255;

img(51:150,61:65)=0;
img(51:150,86:90)=0;
img(51:150,111:115)=0;
img(51:150,136:140)=0;
img(51:150,161:165)=0;
img(51:150,186:190)=0;
img(51:150,211:215)=0;
img(51:150,236:240)=0;

I=mat2gray(img,[0 255]);
figure
imshow(I)
title('Original')
h1=(1/9)*[1 1 1;1 1 1; 1 1 1];

y = conv2(img,h1);

figure
Y1=mat2gray(y,[0 255]);
imshow(Y1)
title('filtered by 3x3')

img100(1,:)=img(100,:);
y100(1,:)=y(100,:);

n1=1:length(img100);
n2=1:length(y100);
figure
subplot(2,1,1), plot(n1,img100)
title('original')
subplot(2,1,2), plot(n2,y100)
title('filtered')

disp('The smoothing filter widens the strips, but shrinks their darkest part. It lowers the contrast with the background by blurring the bars, extending the change over more pixesls.')

%Part b

h2(1:23,1:23)=1/23^2;
y2 = conv2(img,h2);

figure
Y2=mat2gray(y2,[0 255]);
imshow(Y2)
title('filtered by 23x23')

y200(1,:)=y2(100,:);
n2=1:length(y200);
figure
subplot(2,1,1), plot(n1,img100)
title('original')
subplot(2,1,2), plot(n2,y200)
title('filtered by 23x23 filter')

%Part C
h3(1:25,1:25)=1/25^2;
y3 = conv2(img,h3);

figure
Y3=mat2gray(y3,[0 255]);
imshow(Y3)
title('filtered by 25x25')

y300(1,:)=y3(100,:);
n2=1:length(y300);
figure
subplot(2,1,1), plot(n1,img100)
title('original')
subplot(2,1,2), plot(n2,y300)
title('filtered by 25x25 filter')

%Part D
h4(1:45,1:45)=1/45^2;
y4 = conv2(img,h4);

figure
Y4=mat2gray(y4,[0 255]);
imshow(Y4)
title('filtered by 45x45')

y400(1,:)=y4(100,:);
n2=1:length(y400);
figure
subplot(2,1,1), plot(n1,img100)
title('original')
subplot(2,1,2), plot(n2,y400)
title('filtered by 45x45 filter')

disp('The bars are more well defined in part d than in part c because the 25x25 filter matches the spacing of the bars and spaces. This means that it wwill capture exactly 1 bar and average it, then move to the next step with only 1 bar in it. The 45 actually is capturing multiple bars, which when convoluted will have a peak that the other will not.')

%% Problem 7
%Part A
img = imread('eight.tif');

cc=0.2;
h = [0 -cc 0; -cc 1+4*cc -cc; 0 -cc 0];
g1 = filter2(h,img);

%Part B
cc = 0.4;
h = [0 -cc 0; -cc 1+4*cc -cc; 0 -cc 0];
g2 = filter2(h,img);

%Part C
figure
imshow(img,[0 255])
title('original')
figure
imshow(g1,[0 255])
title('cc=0.2')
figure
imshow(g2,[0 255])
title('cc=0.4')

%Part D
%top left [x,y]=[75,20]
%bot right [x,y]=[125, 50]

count1 = 1;
count2 = 1;

for x=75:125
    for y=20:50
        zoom1(count1,count2)=img(x,y);
        zoom2(count1,count2)=g1(x,y);
        zoom3(count1,count2)=g2(x,y);
        count1=count1+1;
    end
    count1=1;
    count2=count2+1;
end

figure
imshow(imresize(zoom1,5),[0 255])
title('Original')
figure
imshow(imresize(zoom2,5),[0 255])
title('cc=0.2')
figure
imshow(imresize(zoom3,5),[0 255])
title('cc=0.4')

disp('The noise in the background seems to be slightly more drawn out. Contrast is rasied on the edges of the quarters, especially in cc=0.4.You are more able to see lines in the background, whether real or not, as cc goes up.')

%Part E
figure
imshow(img,[])
title('original')
figure
imshow(g1,[])
title('cc=0.2')
figure
imshow(g2,[])
title('cc=0.4')

disp('For the second set of images, the image has not been reweighted and the filter has negative values. These negatives are being shifted by MATLAB to 0 and everything looks darker because of it.')
















