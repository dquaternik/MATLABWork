%% Problem 3
se1 = ones(3)
se2 = ones(1,12)
se3 = ones(10,1)

A=imread('textSampler.bmp');

figure
imshow(imresize(A,0.9))
title('Original')

disp('For all pictures, Matlab assumes black background. Operations are being performed properly, but a little backwards to normal thought');

g1=imdilate(A,se1);
g2=imerode(A,se1);
g3=imopen(A,se1);
g4=imclose(A,se1);

figure;
imshow(imresize(g1,0.9))
title('Part A dilated')

figure;
imshow(imresize(g2,0.9))
title('Part A eroded')

figure
imshow(imresize(g3,0.9))
title('Part A opened')

figure
imshow(imresize(g4,0.9))
title('Part A closed')

g1=imdilate(A,se2);
g2=imerode(A,se2);
g3=imopen(A,se2);
g4=imclose(A,se2);

figure;
imshow(imresize(g1,0.9))
title('Part B dilated')

figure;
imshow(imresize(g2,0.9))
title('Part B eroded')

figure
imshow(imresize(g3,0.9))
title('Part B opened')

figure
imshow(imresize(g4,0.9))
title('Part B closed')

g1=imdilate(A,se3);
g2=imerode(A,se3);
g3=imopen(A,se3);
g4=imclose(A,se3);

figure;
imshow(imresize(g1,0.9))
title('Part C dilated')

figure;
imshow(imresize(g2,0.9))
title('Part C eroded')

figure
imshow(imresize(g3,0.9))
title('Part C opened')

figure
imshow(imresize(g4,0.9))
title('Part C closed')

