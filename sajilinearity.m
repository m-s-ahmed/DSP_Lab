clc; clear; close all;

fs=8000;
ts=1/fs;
N=8;
j=sqrt(-1);
f1=1000;
f2=3000;
ind=1;
for n=0:N-1
    x1(ind)=sin(2*pi*f1*n*ts);
    x2(ind)=0.5*cos(2*pi*f2*n*ts);
    ind=ind+1;
end
x3=x1+x2;
%dft of x1
X1=dft1(x1,N);
%dft of x2
X2=dft1(x2,N);
%dft of x2;
X3=dft1(x3,N);
X1X2=X1+X2;

D=sum(abs(X3-X1X2));
if D>0 && D<1e-10
    D=0;
end
if D<0 && D>-1e-10
    D=0;
end
if D==0
    'DFT linearity is proved'
end
