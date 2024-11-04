clc; clear; close all;
fs=8000;
j=sqrt(-1);
dft_point=8;
N=dft_point;
k=3;
ts=1/fs;
for n=1:N+k
    m=n-1;
    x(1,n)=sin(2*pi*1000*m*ts)+0.5*sin(2*pi*2000*m*ts+(3*pi/4));
end
x_1=x(1,1:N);
x_k=x(1,1+k:N+k);

%dft of x_1
xe_1=dft1(x_1,N);
%dft of x_k
xe_k=dft1(x_k,N);

for m=1:N
    me=m-1;
    x_sum(1,m)=exp((j*2*pi*k*me)/N)*xe_1(1,m);
    xe_real(1,m)=real(x_sum(1,m));
    xe_imag(1,m)=imag(x_sum(1,m));

    if xe_real(1,m)>0 && xe_real(1,m)<1e-10
        xe_real(1,m)=0;
    end
    if xe_real(1,m)<0 && xe_real(1,m)>-1e-10
        xe_real(1,m)=0;
    end
    if xe_imag(1,m)>0 && xe_imag(1,m)<1e-10
        xe_imag(1,m)=0;
    end
    if xe_imag(1,m)<0 && xe_imag(1,m)>-1e-10
        xe_imag(1,m)=0;
    end
    xe_mag(1,m)=sqrt((xe_real(1,m).^2)+(xe_imag(1,m).^2));
end
x_sifted=xe_mag;
D=sum(abs(x_sifted-xe_k));
if D==0 || D<1e-10
    'Dft shifting theorem in proved'
end
