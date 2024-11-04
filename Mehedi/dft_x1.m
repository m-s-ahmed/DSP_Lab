clc;clear all ;close all;
Fs=8000; j=sqrt(-1);
ts=1/Fs;
DFT_points=8;
ind=1;x1=[];
for n=1:DFT_points
    m=n-1;
    x1(ind)=sin(2*pi*1000*m*ts);
    ind=ind+1;
end
t=0:DFT_points-1;
figure(1);
plot(t,x1,'b--o');
title("input signal");

N=DFT_points;
X_1=zeros(N,1);Xe_ang=zeros(1,N);Xe_real=zeros(1,N);
for m=1:DFT_points
    me=m-1;
    for i=1:N
        n=i-1;
        X_1(i,1)=x1(1,i)*exp((-j*2*pi*n*me)/N);
    end
    X_exp(1,m)=sum(X_1(:,1));
    Xe_real(1,m)=real(X_exp(1,m));
    Xe_imag(1,m)=imag(X_exp(1,m));
    if Xe_real(1,m)>0 && Xe_real(1,m)< 1e-10
        Xe_real(1,m)=0;
    end
    if Xe_real(1,m)<0 && Xe_real(1,m)> -1e-10
        Xe_real(1,m)=0;
    end
    if Xe_imag(1,m)>0 && Xe_imag(1,m)< 1e-10
        Xe_imag(1,m)=0;
    end
    if Xe_imag(1,m)<0 && Xe_imag(1,m)> -1e-10
        Xe_imag(1,m)=0;
    end
    Xe_mag(1,m)=sqrt((Xe_real(1,m)).^2+(Xe_imag(1,m)).^2);
    Xe_ang(1,m) = (180/3.14159).*atan(Xe_imag(1,m)/Xe_real(1,m));
    Xe_ang(isnan(Xe_ang)) = 0;
end

mf=0:N-1;
figure(2);
stem(mf,Xe_real,'bo');
title("real part");
figure(3);
stem(mf,Xe_imag,'b*');
title("imaginary part");
figure(4);
stem(mf,Xe_mag,'bo');
title("magnitude");
figure(5);
stem(mf,Xe_ang,'bo');
title("phase angle");


