% DRAM Access patterns (assuming 2GB of DDR3 DRAM) THIS IS LAYER DEPENDENT
% MODELS DONE ARE FOR LAYER 1

% Please note, although I have allocated enough space to run over an entire
% 244x244x3 image, doing so requires a huge number of points and slows down
% the graphs and matlab in general. If you would like to see it for the
% full run, change R and C to 55. In its current form, it is doing an 11x11
% chunk, to save time.


% Addresses are shown in decimal. Assumes contiguous blocks for the
% storages. 
clear; 

%Layer 1
N = 3;
M = 48;
R = 11;
C = 11;
K = 11;
S = 4;

inaddr = zeros(1,244*244*3);
wgtaddr = zeros(1,M*N*K*K);
outaddr = zeros(1,M*R*C);

inaddr(1) = 1;
wgtaddr(1) = 714413;
outaddr(1) = 784129;
count = 1;

% Code 1

for row = 1:R
    for col = 1:C
        for to = 1:M
            for ti = 1:N
                for i = 1:K
                    for j = 1:K
                        if count ~= 1
                            inaddr(count) = inaddr(1) + 4*((S*row+i)*(S*col+j)*ti);
                            wgtaddr(count) = wgtaddr(1) + 4*(to*ti*i*j);
                            outaddr(count) = outaddr(1) + 4*(to*row*col);
                        end

                        count = count+1;

                    end
                end
            end
        end
    end
end

figure;
plot(inaddr); hold on;
xlabel('Loop Number');
ylabel('Address Number in Decimal');
plot(wgtaddr);
plot(outaddr);
legend('Input Address','Weight Address','Output Address','Location','northeastoutside');
title('Code 1 DRAM Access');