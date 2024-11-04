clc;clear all;close all;
fs=8000; j=sqrt(-1);
DFT_points=8;
N=DFT_points;
k=3;
ts=1/fs;
x=zeros(1,N);
for n=1:N+k
    m=n-1;
    x(1,n)=sin(2*pi*1000*m*ts)+0.5*sin(2*pi*2000*m*ts+(3*pi/4));
end
x_1=x(1,1:N);
x_k=x(1,1+k:N+k);
%dft of x_1
Xe_1=dft1(x_1,N);
%dft of x_k
Xe_k=dft1(x_k,N);

for m=1:N
    me=m-1;
    X_s(1,m)=exp((j*2*pi*k*me)/N)*Xe_1(1,m);

    Xe_real(1,m)=real(X_s(1,m));
    Xe_imag(1,m)=imag(X_s(1,m));
  if Xe_real(1,m)>0&&Xe_real(1,m)<1e-10
      Xe_real(1,m)=0;
  end
  if Xe_real(1,m)<0&&Xe_real(1,m)>-1e-10
      Xe_real(1,m)=0;
  end
  if Xe_imag(1,m)>0&&Xe_imag(1,m)<1e-10
      Xe_imag(1,m)=0;
  end
  if Xe_imag(1,m)<0&&Xe_imag(1,m)>-1e-10
      Xe_imag(1,m)=0;
  end
  Xe_mag(1,m)=sqrt(Xe_real(1,m).^2+Xe_imag(1,m).^2);
end
X_shifted=Xe_mag;
D=  sum(abs(X_shifted-Xe_k));
if D==0||D<1e-10
    'Dft shifting theorem is proved'
end



