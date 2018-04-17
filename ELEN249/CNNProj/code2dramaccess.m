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

% Code 2

% off chip
Tm = 64;
Tn = 7;
Tc = 2;
Tr = 2;

for row = 1:Tr:R
    for col = 1:Tc:C
        for to = 1:Tm:M
            for ti = 1:Tn:N

                % On chip
                trrl = min([row+Tr R]);
                tccl = min([col+Tc C]);
                tool = min([to+Tm M]);
                tiil = min([ti+Tn N]);

                for trr = row:trrl
                    for tcc = col:tccl
                        for too = to:tool
                            for tii = ti:tiil
                                for i = 1:K
                                    for j = 1:K
                                        
                                        if count ~= 1
                                            inaddr(count) = inaddr(1) + 4*((S*trr+i)*(S*tcc+j)*tii);
                                            wgtaddr(count) = wgtaddr(1) + 4*(too*tii*i*j);
                                            outaddr(count) = outaddr(1) + 4*(too*trr*tcc);
                                        end

                                        count = count+1;
                                    end
                                end
                            end
                        end
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
title('Code 2 DRAM Access');
