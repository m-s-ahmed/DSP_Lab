%Segment the plain data and show it in hamming window
clc;close all;
load('plain');
s=plain;
l=512;
segment=s(60001:60000+l);
hamming_window=zeros(1,l);
for i=1:l
    hamming_window(i)=0.54-0.46*cos(2*pi*(i-1)/(l-1));
end
segment_w=segment.*hamming_window';

subplot(3,1,1);
plot(s);
title('Voice Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(3,1,2);
plot(segment);
title('Segment Signal');
xlabel('Time');
ylabel('Amplitude');  

subplot(3,1,3);
plot(segment_w);
title('Segment_w signal');
xlabel('Time');
ylabel('Amplitude');  