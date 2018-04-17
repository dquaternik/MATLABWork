%% Devon Quaternik
% ELEN 640
% HW #7

clear;
clc;
close all;

%% Problem 1
%read images
pprs = imread('4.2.07.tiff');
slbt = imread('4.2.06.tiff');
hous = imread('4.1.05.tiff');

%Part a
figure; image(pprs);
title('Peppers');
figure; image(slbt);
title('Sailboat');
figure; image(hous);
title('House');

%Part b
pprsb = zeros(size(pprs));
pprsb(:,:,2) = pprs(:,:,2);
slbtb = zeros(size(slbt));
slbtb(:,:,2) = slbt(:,:,2);
housb = zeros(size(hous));
housb(:,:,2) = hous(:,:,2);

figure; image(pprsb);
title('Peppers, RB set to 0')
figure; image(slbtb);
title('Sailboat, RB set to 0')
figure; image(housb);
title('House, RB set to 0')

disp('RGB is additive light, so most colors have a combination of all three within them. In the evenly lit house and trees, there is mostly just green. The trees in the sailboat picture show some darkness in the transformed issue, and the shaded parts of the peppers come through.')

%Part c
pprsc = zeros(size(pprs));
pprsc(:,:,:) = 255;
pprsc(:,:,2) = pprs(:,:,2);
slbtc = zeros(size(slbt));
slbtc(:,:,:) = 255;
slbtc(:,:,2) = slbt(:,:,2);
housc = zeros(size(hous));
housc(:,:,:) = 255;
housc(:,:,2) = hous(:,:,2);

figure; image(pprsc);
title('Peppers, RB set to 255')
figure; image(slbtc);
title('Sailboat, RB set to 255')
figure; image(housc);
title('House, RB set to 255')

disp('Now most of the light is getting added in, leaving most areas white. Again the shaded areas show up, but as pink due to being 255 for red and blue.')

%Part d
pprsd = pprs;

for m = 1:512
    for n=1:512
        if pprs(m,n,2) >200
            pprsd(m,n,2) = 255;
        else
            pprsd(m,n,2) = 0;
        end
    end
end

slbtd = slbt;
for m = 1:512
    for n = 1:512
        if slbt(m,n,2) >200
            slbtd(m,n,2) = 255;
        else 
            slbtd(m,n,2) = 0;
        end
    end
end

housd = hous;
for m = 1:256
    for n = 1:256
        if hous(m,n,2) >200
            housd(m,n,2) = 255;
        else
            housd(m,n,2) = 0;
        end
    end
end

figure; image(pprsd);
title('Peppers, G thresholded');
figure; image(slbtd);
title('Sailboat, G thresholded');
figure; image(housd);
title('House, G thresholded');

disp('This seems like it may work for detection, but it is hard to say. Just looking at the matrices it does not seem obvious and the pictures do not help either. It may work, but dark greens may be missed.')

%% Problem 2

h=[0:12]/12;
s=ones(size(h));
v=ones(size(h));

mytestHSV(:,:,1)=h;
mytestHSV(:,:,2)=s;
mytestHSV(:,:,3)=v;

%Part a
mytestRGB=hsv2rgb(mytestHSV);
t=0:12;

figure;
hold on;
subplot(2,2,1),...
plot(t,mytestRGB(:,:,1),'r',t,mytestRGB(:,:,2),'g',t,mytestRGB(:,:,3),'b'); 
axis([-1 13 -0.2 1.2]);
title('Part a');

disp('The HSV value for pure red would be 0 or 1, as it wraps around. Green would be 4/12 and Blue is 8/12. This variation in value generates hue that ramps from 0 to 1 because hue is a normalized value that only represents additive color. Since saturation and brightness are separate values and would end up representing black or white, its as if it was normalized to the outside of the color wheel, in other words 2*PI.');

%Part b
s=0.5*ones(size(h));
mytestHSV(:,:,1)=h;
mytestHSV(:,:,2)=s;
mytestHSV(:,:,3)=v;
mytestRGB=hsv2rgb(mytestHSV);

subplot(2,2,2),...
plot(t,mytestRGB(:,:,1),'r',t,mytestRGB(:,:,2),'g',t,mytestRGB(:,:,3),'b'); 
axis([-1 13 -0.2 1.2]);
title('Part b');
disp('Decreasing s shrinks the graph and pushes it up. This makes sense, as white is a 0 saturation. As this is additive light, all three hue values would be 1, which is reflected in the graph.')

%Part c
s=ones(size(h));
v=0.5*ones(size(h));
mytestHSV(:,:,1)=h;
mytestHSV(:,:,2)=s;
mytestHSV(:,:,3)=v;
mytestRGB=hsv2rgb(mytestHSV);

subplot(2,2,3),...
plot(t,mytestRGB(:,:,1),'r',t,mytestRGB(:,:,2),'g',t,mytestRGB(:,:,3),'b'); 
axis([-1 13 -0.2 1.2]);
title('Part c');
disp('Decreasing v shrinks the graph, and lowers it from the top. This would represent a shift toward black, a v value of 0 on the color cylinder.');

%Part d
s=0.5*s;
mytestHSV(:,:,1)=h;
mytestHSV(:,:,2)=s;
mytestHSV(:,:,3)=v;
mytestRGB=hsv2rgb(mytestHSV);

subplot(2,2,4),...
plot(t,mytestRGB(:,:,1),'r',t,mytestRGB(:,:,2),'g',t,mytestRGB(:,:,3),'b'); 
axis([-1 13 -0.2 1.2]);
title('Part d');
hold off;

disp('Decreasing both s and v converges the graph towards the middle. This makes sense, as setting both to 0 would result in gray. S and V act as scalers and biases to h, in effect. V is biased toward black, S to white.')


%% Problem 3

im = imread('autumn.tif');

H = rgb2hsv(im);

figure;
subplot(2,2,1), image(im);
title('Original Image');

%Part a
Ha=H;
Ha(:,:,2)=1;

ima = hsv2rgb(Ha);

subplot(2,2,2), image(ima);
title('Part a');

%Part b
Hb=H;
Hb(:,:,3)=1;

imb = hsv2rgb(Hb);

subplot(2,2,3), image(imb);
title('Part b');

%Part c
Hc=H;
Hc(:,:,2:3)=1;

imc = hsv2rgb(Hc);

subplot(2,2,4), image(imc);
title('Part c');

%Part d
disp('In Part a, by maxing out the saturation, you push all the color vectors out to the edge of the color cylinder. This results in any subtle colors that are mostly white being blown out, like the orange of the sky or the green of the lake');
disp('In Part b, the Value is maxed out without tweaking the saturation. This pushes any dark spots that are unsaturated to white, and brightens the image a lot.The underlying colors are easily visible.');
disp('In Part c, both are maxed out. This means you will only see colors on the outside of the color cylinder, eliminating whites, as well as all the way at the top, elimnating blacks. Dark areas assume color and any natural color of the trees is blown out. The once slight hint of orange in the sky is blatant, and the reflection in the laake is more obvious.');














