function [dial_sig] = my_dtmf(tone_time,quiet_time,fs,dial_vals)
%This function represents a DTMF.
%Essentially what a DTMF does is based on
%what digit is pressed a high tone and a 
%low tone are concatenated. A series of if/else 
%loops determine which frequencies the tone is at
%Then the number quiet times are inputed based on how many 
%samples we have. The length of time the tone plays, 
% the length of quiet time, sampling frequency, and values
% that are dialed are all inputs to the function.

num=length(dial_vals);
row_freq=[697 770 852 941];
col_freq=[1209, 1336, 1477];
num_samples=0:fs*tone_time;
num_quiet=fs*quiet_time;
quiet_sig=zeros(1,num_quiet);
dial_sig=[];

for k=1:num
    if(dial_vals==0)
        row_index=4;
        col_index=2;
    else if(dial_vals=='*')
            row_index=4;
            col_index=1;
        else if(dial_vals=='#')
                row_index=4;
                col_index=3;
            end
        end
    end
    if(ceil(dial_vals(k)/3)==1)
        row_index=1;
        else if (ceil(dial_vals(k)/3)==2)
        row_index=2;
            else if (ceil(dial_vals(k)/3)==3)
                row_index=3;
                else if (ceil(dial_vals(k)/3)==4)
                        row_index=4;
                    end
                end
            end
    end
    if(mod(dial_vals(k),3)==1)
        col_index=1;
    else if (mod(dial_vals(k),3)==2)
            col_index=2;
        else if (mod(dial_vals(k),3)==0)
                col_index=3;
            end
        end
    end
    row=(row_freq(row_index)/fs);
    row_cos=cos(2*pi*row*num_samples);
    col=(col_freq(col_index)/fs);
    col_cos=cos(2*pi*col*num_samples);
    new_sig=(row_cos+col_cos)/2;
    dial_sig=[dial_sig, new_sig, quiet_sig ];
end

end