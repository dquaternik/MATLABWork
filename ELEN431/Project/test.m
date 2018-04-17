
imm = 96;
imn = 96;

v1 = 0.8*ones(imm-25,1);
v2 = 0.2*ones(imm-25,1);

D1 = diag(v1,25);
D2 = diag(v2,-25);

image = ones(imm,imn);
image(9:88,9:88) = 0.2;
image(17:80,17:80) = 1;
image(27:70,27:70) = 0;
image(32:65,32:65) = 0.8;
image(41:56,41:56) = 0;

for i = 1:imm
    for j = 1:imn
        if D1(i,j) > 0
            image(i,j) = D1(i,j);
        end
        if D2(i,j) > 0
            image(i,j) = D2(i,j);
        end
    end
end

% Other initilizations
ensemble = 100;
mu = 70*10^(-5);
N = 3;
inicoefs = fspecial('average');
% inicoefs = zeros(3); 

MSE = zeros(imm,imn,ensemble);


% for l = 1:ensemble
   
%     noiseim = awgn(image,4.45);
    noiseim = imnoise(image,'gaussian');

    for i = 1:imm
        for j = 1:imn
            if i == 1 && j == 1
                prefixedimage(i,j) = 0;
            elseif j == 1 && i ~= 1
                prefixedimage(i,j) = noiseim(i-1,imn);
            else 
                prefixedimage(i,j) = noiseim(i,j-1);
            end
        end
    end

desired = image;
input = noiseim;

S = struct('step',mu,'filterOrderNo',(N-1),'initialCoefficients',inicoefs);

nCoefficients = S.filterOrderNo+1;
[nIterationsm,nIterationsn] = size(input);
nIterations = nIterationsm*nIterationsn;

% Pre-allocations
errorImage = zeros(nIterationsm, nIterationsn);
outputImage = zeros(nIterationsm, nIterationsn);
coefficientBlock = zeros(nCoefficients,nCoefficients,nIterations);
itCount = 1;

% Initial state of the weight vector

coefficientBlock(:,:,1) = S.initialCoefficients;

% Prefixed input
prefixedimage = input;

prefixedimage(:,(nIterationsn+1):(nIterationsn+S.filterOrderNo)) = 0;
prefixedimage((nIterationsm+1):(nIterationsm+S.filterOrderNo),:) = 0;


% Body

for i1 = 1:nIterationsm
    for i2 = 1:nIterationsn
        
        regressor(:,:,itCount) = prefixedimage(i1+(nCoefficients-1):-1:i1, i2+(nCoefficients-1):-1:i2);
        
        ex1 = coefficientBlock(:,:,itCount).*regressor(:,:,itCount);
        
        outputImage(i1,i2) = sum(ex1(:));
        
        errorImage(i1,i2) = desired(i1,i2) - outputImage(i1,i2);
        
        coefficientBlock(:,:,itCount+1) = coefficientBlock(:,:,itCount) + (2*S.step*errorImage(i1,i2)*regressor(:,:,itCount));
        
        itCount = itCount+1;
    end
end

figure;
subplot(2,1,1),imshow(outputImage,[]);
subplot(2,1,2),imshow(input,[]);
