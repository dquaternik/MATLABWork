N=length(testSign);
seg_width=100;
seg_step=0.5*(seg_width);
freq_step=fs/seg_width;

n_seg=floor(N/seg_step)-1;

time_center=zeros(1,n_seg);
avg_mag=zeros(1,n_seg);
mags_row1=zeros(1,n_seg);
mags_row2=zeros(1,n_seg);
mags_col1=zeros(1,n_seg);
mags_col2=zeros(1,n_seg);

nstart=1;

for t=1:n_seg
    n1=nstart;
    n2=nstart+seg_width-1;
    sig=testSign(n1:n2);
    
    fft1=fft(sig,2*seg_width);
    fv=(0:length(fft1)-1)*fs/length(fft1);  
    mags_fft=abs(fft1);
    
    
    
    loc697=round(697/(freq_step/2))+1;
    loc770=round(770/(freq_step/2))+1;
    loc1209=round(1209/(freq_step/2))+1;
    loc1336=round(1336/(freq_step/2))+1;
    
    nstart=seg_step+nstart;
    
    time_center(1,t)=((n1+n2)/2)/8000;
    avg_mag(1,t)=mean(mags_fft);
    mags_row1(1,t)=mags_fft(loc697);
    mags_row2(1,t)=mags_fft(loc770);
    mags_col1(1,t)=mags_fft(loc1209);
    mags_col2(1,t)=mags_fft(loc1336);
end
  
  figure();
  subplot(3,2,1), plot(time_center,avg_mag);
  title('average magnitude');
  subplot(3,2,2), plot(time_center,mags_row1);
  title('magnitudes row 1');
  subplot(3,2,3), plot(time_center,mags_row2);
  title('magnitudes row 2');
  subplot(3,2,4), plot(time_center,mags_col1);
  title('magnitudes column 1');
  subplot(3,2,5), plot(time_center,mags_col2);
  title('magnitudes column 1');
  extra=1:N;
  extra1=1/fs.*extra;
  subplot(3,2,6), plot(extra1,testSign);
  title('entire signal');
  
  actual697=(loc697-1)*freq_step;
  actual770=(loc770-1)*freq_step;
  actual1209=(loc1209-1)*freq_step;
  actual1336=(loc1336-1)*freq_step;
  
  fivebttn=mags_row2.*mags_col2;
  figure();
  plot(fivebttn);