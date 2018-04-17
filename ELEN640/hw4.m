%% Devon Quaternik
% ELEN 640
% HW 4

%% Problem 1
close all;

f(1:25,1:25) = 50;
f(1:21,7:17) = 140; f(8,5) = 140; f(12,5) = 140; f(13,5) = 140; f(8,17) = 140; f(10,17) = 140; f(13,17) = 140; f(22,10)  = 140; f(22,11) = 140;
f(5,20) = 200; f(18,20) = 200; f(19,19) = 200 ; f(19,20) = 200; f(19,21) = 200; f(20,20) = 200;
figure;
imshow(imresize(f,5,'nearest'),[0 255]);
title('original');

h1 = (1/9).*ones(3);
h2 = (1/25).*ones(5);

%Part a
g1 = conv2(f,h1);
figure;
imshow(imresize(g1,5,'nearest'),[0 255]);
title('Problem 1 Part a');

%Part b
g2 = conv2(f,h2);
figure;
imshow(imresize(g2,5,'nearest'),[0 255]);
title('Problem 1 Part b');

%Part c 
g3x = conv2(f,h1);
g3 = conv2(g3x,h1);
figure;
imshow(imresize(g3,5,'nearest'),[0 255]);
title('Problem 1 Part c');

disp('The more things are averaged the blurrier they become. Lines are distorted, isolated points get lost to noise, and finite shapes become unrecognizable.')

%% Problem 2
%Part a
g4 = medfilt2(f,[3 3]);
figure;
imshow(imresize(g4,5,'nearest'),[0 255])
title('Problem 2 Part a')

%Part b
g5 = medfilt2(f,[5 5]);
figure;
imshow(imresize(g5,5,'nearest'),[0 255])
title('Problem 2 Part b')

%Part c
g6x = medfilt2(f,[3 3]);
g6 = medfilt2(g6x,[3 3]);
figure;
imshow(imresize(g6,5,'nearest'),[0 255])
title('Problem 2 Part c')

disp('Median filtering cuts the corners on all the squares. It also removes distinct points or misatributes them to weird places. Ultimately it leaves less noise, but at the cost of some of the main shape. Compared to Averaging, it is less blurry, but distorted in a different way. Which is better would depend on the desired result')

%% Problem 3

disp('If a median filter is applied to a line that is one pixel wide, it will remove the line entirely. This is due to how many spaces the line takes up in the filter. Only taking up 3 means it will never be the median. Conversely, a 2 pixel width line will not be removed because the pixels will take up 6 of the 9 spaces of the filter.')
disp('Median filters are non-linear. They do not take into account value of the pixels only the position, which will be changing constantly.')

%% Problem 4
[cc,rr] = meshgrid(1:13,1:13);
test1 = 100*ones(size(rr)) + 100*((rr > 3)&(rr < 9));
test2 = 100*ones(size(cc)) + 100*((cc > 3)&(cc < 9));
test3 = 100*ones(size(cc)) + 100*(cc>rr);
test4 = 100*ones(size(cc)) + 100*(cc>rr) + 50*(cc == rr);
test5 = 100*cc;

sb1 = [1 2 1; 0 0 0; -1 -2 -1];
sb2 = [1 0 -1; 2 0 -2; 1 0 -1];
x1 = conv2(test1,sb1,'valid'); y1 = conv2(test1, sb2,'valid');
x2 = conv2(test2,sb1,'valid'); y2 = conv2(test2, sb2,'valid');
x3 = conv2(test3,sb1,'valid'); y3 = conv2(test3, sb2,'valid');
x4 = conv2(test4,sb1,'valid'); y4 = conv2(test4, sb2,'valid');
x5 = conv2(test5,sb1,'valid'); y5 = conv2(test5, sb2,'valid');


G1 = sqrt((x1.^2)+(y1.^2));
G2 = sqrt((x2.^2)+(y2.^2));
G3 = sqrt((x3.^2)+(y3.^2));
G4 = sqrt((x4.^2)+(y4.^2));
G5 = sqrt((x5.^2)+(y5.^2));

%Part a
disp('The gradient components will show 0 in areas where there are no changes and something when there is a change occuring in the image value.')

%Part b
figure;
imshow(imresize(test1,10,'nearest'),[]);
title('Test 1');
figure;
imshow(imresize(G1,10,'nearest'),[]);
title('Sobel Magnitude, Test 1');

figure;
imshow(imresize(test2,10,'nearest'),[]);
title('Test 2');
figure;
imshow(imresize(G2,10,'nearest'),[]);
title('Sobel Magnitude, Test 2');

figure;
imshow(imresize(test3,10,'nearest'),[]);
title('Test 3');
figure;
imshow(imresize(G3,10,'nearest'),[]);
title('Sobel Magnitude, Test 3');

figure;
imshow(imresize(test4,10,'nearest'),[]);
title('Test 4');
figure;
imshow(imresize(G4,10,'nearest'),[]);
title('Sobel Magnitude, Test 4');

figure;
imshow(imresize(test5,10,'nearest'),[]);
title('Test 5');
figure;
imshow(imresize(G5,10,'nearest'),[]);
title('Sobel Magnitude, Test 5');

disp('A detected edge is 20 pixels wide vertical or horizontal. A detected diagonal is twice that at 50 pixels, which scales to 2 and 5 pixels')

%Part c
k1 = atan2(y1,x1);
figure;
imshow(imresize(k1,10,'nearest'),[]);
title('Sobel Test 1 angles');

k2 = atan2(y2,x2);
figure;
imshow(imresize(k2,10,'nearest'),[]);
title('Sobel Test 2 angles');

k3 = atan2(y3,x3);
figure;
imshow(imresize(k3,10,'nearest'),[]);
title('Sobel Test 3 angles');

k4 = atan2(y4,x4);
figure;
imshow(imresize(k4,10,'nearest'),[]);
title('Sobel Test 4 angles');

k5 = atan2(y5,x5);
figure;
imshow(imresize(k5,10,'nearest'),[]);
title('Sobel Test 5 angles');

disp('The angles are related to the direction of the change happening in the tangent. White is 90 degrees, or a vertical change, and black is 0 degrees or horizontal change. Gray is somewhere in between.')

%% Problem 5
r1 = [1 0; 0 -1]; r2 = [0 1; -1 0];

x1 = conv2(test1,r1,'valid'); y1 = conv2(test1, r2,'valid');
x2 = conv2(test2,r1,'valid'); y2 = conv2(test2, r2,'valid');
x3 = conv2(test3,r1,'valid'); y3 = conv2(test3, r2,'valid');
x4 = conv2(test4,r1,'valid'); y4 = conv2(test4, r2,'valid');
x5 = conv2(test5,r1,'valid'); y5 = conv2(test5, r2,'valid');

G1 = sqrt((x1.^2)+(y1.^2));
G2 = sqrt((x2.^2)+(y2.^2));
G3 = sqrt((x3.^2)+(y3.^2));
G4 = sqrt((x4.^2)+(y4.^2));
G5 = sqrt((x5.^2)+(y5.^2));

figure;
imshow(imresize(G1,10,'nearest'),[]);
title('Roberts Magnitude, Test 1');

figure;
imshow(imresize(G2,10,'nearest'),[]);
title('Roberts Magnitude, Test 2');

figure;
imshow(imresize(G3,10,'nearest'),[]);
title('Roberts Magnitude, Test 3');

figure;
imshow(imresize(G4,10,'nearest'),[]);
title('Roberts Magnitude, Test 4');

figure;
imshow(imresize(G5,10,'nearest'),[]);
title('Roberts Magnitude, Test 5');

disp('Roberts vertical and horizontal lines are 10 pixels in width, where diagonal are 20 wide.');


k1 = atan2(y1,x1);
figure;
imshow(imresize(k1,10,'nearest'),[]);
title('Roberts Test 1 angles');

k2 = atan2(y2,x2);
figure;
imshow(imresize(k2,10,'nearest'),[]);
title('Roberts Test 2 angles');

k3 = atan2(y3,x3);
figure;
imshow(imresize(k3,10,'nearest'),[]);
title('Roberts Test 3 angles');

k4 = atan2(y4,x4);
figure;
imshow(imresize(k4,10,'nearest'),[]);
title('Roberts Test 4 angles');

k5 = atan2(y5,x5);
figure;
imshow(imresize(k5,10,'nearest'),[]);
title('Roberts Test 5 angles');

disp('Roberts angles are related in the same way that Sobels angles are.');

%% Problem 6
hst = [0 1 0; 1 -4 1; 0 1 0];

g1 = conv2(test1,hst);
figure;
imshow(imresize(g1,10,'nearest'),[]);
title('Laplacian Test 1');

g2 = conv2(test2,hst);
figure;
imshow(imresize(g2,10,'nearest'),[]);
title('Laplacian Test 2');

g3 = conv2(test3,hst);
figure;
imshow(imresize(g3,10,'nearest'),[]);
title('Laplacian Test 3');

g4 = conv2(test4,hst);
figure;
imshow(imresize(g4,10,'nearest'),[]);
title('Laplacian Test 4');

g5 = conv2(test5,hst);
figure;
imshow(imresize(g5,10,'nearest'),[]);
title('Laplacian Test 5');

%% Problem 7
a=5;
test6 = test2 + a*randn(size(cc));
a=25;
test7 = test2 + a*randn(size(cc));

x6 = conv2(test6,sb1,'valid'); y6 = conv2(test6,sb2,'valid');
x7 = conv2(test7,sb1,'valid'); y7 = conv2(test7,sb2,'valid');

G6 = sqrt((x6.^2)+(y6.^2));
G7 = sqrt((x7.^2)+(y7.^2));

k6 = atan2(y6,x6);
k7 = atan2(y7,x7);

figure;
imshow(imresize(test6,10,'nearest'),[]);
title('Test 6');
figure;
imshow(imresize(G6,10,'nearest'),[]);
title('Sobel Magnitude, Test 6');
figure;
imshow(imresize(k6,10,'nearest'),[]);
title('Test 6 angles');

figure;
imshow(imresize(test7,10,'nearest'),[]);
title('Test 7');
figure;
imshow(imresize(G7,10,'nearest'),[]);
title('Sobel Magnitude, Test 7');
figure;
imshow(imresize(k7,10,'nearest'),[]);
title('Test 7 angles');

%Part a
count1 = 1;
count2 = 1;
for m = 1:11
    for n = 1:11
        if G2(m,n) == 0
            extra1(count1)=G6(m,n);
            extra2(count1)=G7(m,n);
            count1=count1+1;
        else
            extra3(count2)=G6(m,n);
            extra4(count2)=G7(m,n);
            count2=count2+1;
        end
    end
end

maxzero6 = max(extra1)
maxzero7 = max(extra2)

%Part b
minnonzero6 = min(extra3)
minnonzero7 = min(extra4)

%Part c
count1 = 1;
count2 = 1;
count3 = 1;
for m = 1:11
    for n = 1:11
        if k2(m,n) == 0
            extra1(count1)=k6(m,n);
            extra2(count1)=k7(m,n);
            count1=count1+1;
        elseif k2(m,n) == max(max(k2))
            extra3(count2)=k6(m,n);
            extra4(count2)=k7(m,n);
            count2=count2+1;
        else
            extra5(count3)=k6(m,n);
            extra6(count3)=k7(m,n);
            count3=count3+1;
        end
    end
end

maxangle16 = max(extra3)
minangle16 = min(extra3)
maxangle26 = max(extra5)
minangle26 = min(extra5)

maxangle17 = max(extra4)
minangle17 = min(extra4)
maxangle27 = max(extra6)
minangle27 = min(extra6)

%% Problem 8
h1 = fspecial('gaussian',[5 5],0.5);
h2 = fspecial('gaussian',[5 5],1.0);
h3 = fspecial('gaussian',[5 5],8.0);

ratio1 = h1(1,3)/h1(3,3);
ratio2 = h2(1,3)/h2(3,3);
ratio3 = h3(1,3)/h3(3,3);

if ratio1 < 0.01
    disp('Ratio of h1 is < 0.01');
else 
    disp('Ratio of h1 is > 0.01');
end

if ratio2 < 0.01
    disp('Ratio of h2 is < 0.01');
else 
    disp('Ratio of h2 is > 0.01');
end

if ratio2 < 0.01
    disp('Ratio of h3 is < 0.01');
else 
    disp('Ratio of h3 is > 0.01');
end

HSPEC = 1;
count = 0;
flag1 = 0;
while 1
    h4 = fspecial('gaussian',HSPEC+2*count,2.0);
    ratio = h4(1,1+count)/h4(1+count,1+count);
    if ratio < 0.01
        break
    end
    count=count+1;
end

total = 1 + 2*count;
fprintf('The size needed is %d',total);




























