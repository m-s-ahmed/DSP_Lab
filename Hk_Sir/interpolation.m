I=input('Enter the upsampling factor');
L=input('Enter the length of the input signal');
f1=input('Enter the frequency of the first signal');
f2=input('Enter the frequency of the second signal');

n=0:L-1;
x=sin(2*pi*f1*n)+sin(2*pi*f2*n);
y=interp(x,I);
subplot(2,1,1);
stem(n,x(1:L));
title('Input sequence');
xlabel('time(n)');
ylabel('Amplitude');
subplot(2,1,2);
m=0:(L*I)-1;
stem(m,y(1:L*I));