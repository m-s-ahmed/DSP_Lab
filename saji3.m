clc; clear ; close all;
dft_point=8;j=sqrt(-1);
fs=8*1e3;
ts=1/fs;

for n=1:dft_point
    m=n-1;
    %x(1,n)=sin(2*pi*1000*m*ts);
    x(1,n)=sin(2*pi*1000*m*ts)+0.5*sin(2*pi*2000*m*ts+((3*pi)/4));
end

t=0 :dft_point-1;

figure(1);
plot(t,x,'b--o');
title('input signal');
xlabel('Time(millisecond)');
ylabel('Amplitude');
grid on;
zoom xon;

N=dft_point;
for m=1:dft_point
    me=m-1;
    for i=1:N
        n=i-1;
        X(1,i)=x(1,i)*exp((-j*2*pi*n*me)/N);
    end

    X_exp(1,m)=sum(X(1,:));
    X_real(1,m)=real(X_exp(1,m));
    X_imag(1,m)=imag(X_exp(1,m));

    if X_real(1,m)>0 && X_real(1,m)<1e-10
        X_real(1,m)=0;
    end
    if X_real(1,m)<0 && X_real(1,m)>-1e-10
        X_real(1,m)=0;
    end
    if X_imag(1,m)>0 && X_imag(1,m)<1e-10
        X_imag(1,m)=0;
    end
    if X_imag(1,m)<0 && X_imag(1,m)>-1e-10
        X_imag(1,m)=0;
    end

    X_mag(1,m)=sqrt((X_real(1,m)).^2 +(X_imag(1,m).^2));
    X_rad(1,m)=atan((X_imag(1,m))/X_real(1,m));
    X_deg(1,m)=(180/3.1416)*X_rad(1,m);
    X_deg(isnan(X_deg))=0;
    
end

mf=0:N-1;

figure(2);
stem(mf,X_real,'bo');
title("real part");
xlabel('Time(millisecond');
ylabel('Amplitude');
grid on;
zoom xon;

figure(3);
stem(mf,X_imag,'b*');
title("imaginary part");
xlabel('Time(millisecond');
ylabel('Amplitude');
grid on;
zoom xon;

figure(4);
stem(mf,X_mag,'bo');
title("magnitude");
xlabel('Time(millisecond');
ylabel('Amplitude');
grid on;
zoom xon;

figure(5);
stem(mf,X_deg,'bo');
title("phase angle");
xlabel('Time(millisecond');
ylabel('Amplitude');
grid on;
zoom xon;



    
