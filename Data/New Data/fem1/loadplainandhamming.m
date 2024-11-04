close all; clc;
load('plain');
s=plain;
l=512;
segment=s(45001:45000+l);
hanning_window=zeros(1,l);
for i=1:l
    hanning_window(i)=0.54-0.46*cos(2*pi*(i-1)/(l-1));
end
segment_w=segment.*hanning_window';

subplot(3,1,1);
plot(s);
title('Plain Signal');
xlabel('Time')
ylabel('Amplitude');

subplot(3,1,2);
plot(segment);
title('Segment Signal');
xlabel('Time')
ylabel('Amplitude');

subplot(3,1,3);
plot(segment_w);
title('Segment_w');
xlabel('Time')
ylabel('Amplitude');