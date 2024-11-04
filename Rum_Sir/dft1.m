function X_mag=dft1(x,N)
j=sqrt(-1);
for m=1:N
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

end





