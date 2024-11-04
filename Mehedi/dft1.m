function X_mag=dft1(x, N)
j=sqrt(-1);
for m=1:N
    me=m-1;
    for i=1:N
        n=i-1;
        X_1(i,1)=x(1,i)*exp((-j*2*pi*n*me)/N);
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
    X_mag(1,m)=sqrt((Xe_real(1,m)).^2+(Xe_imag(1,m)).^2);
    
end
 