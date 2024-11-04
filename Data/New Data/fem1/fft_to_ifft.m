close all;clc;
load('plain');
s=plain;
l=512;
n=1024;
segment=s(17001:17000+l);
x=(abs(fft(segment,n).^2));
y=real(ifft(x));

subplot(3,1,1);
plot(x);
title('FFT Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(3,1,2);
plot(y);
xlabel('Time');
ylabel('Amplitude');