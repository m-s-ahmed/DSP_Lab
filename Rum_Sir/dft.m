%% DFT using exponential form equation:
function Xe_mag = dft(x, N)
    X_exp = zeros(N,1);     Xe_real = zeros(N,1);     Xe_imag = zeros(N,1);
    Xe_mag = zeros(N,1);    j = sqrt(-1);  
    for m = 1:N
        X_1 = zeros(N,1);   m_e = m - 1;
        for ii = 1:N
            n = ii-1;   X_p1 = [];   
            X_p1 = x(1,ii)*exp((-j*2*pi*n*m_e)/N);                    
            X_1(ii,1) = X_p1;  
        end
        X_exp(m,1) = sum(X_1(:,1));
        Xe_real(m,1) = real(X_exp(m,1));
            if Xe_real(m,1) > 0 && Xe_real(m,1) < 1e-10
               Xe_real(m,1) = 0;  
            end  
            if Xe_real(m,1) < 0 && Xe_real(m,1) > -1e-10
               Xe_real(m,1) = 0;  
            end
        Xe_imag(m,1) = imag(X_exp(m,1));
            if Xe_imag(m,1) > 0 && Xe_imag(m,1) < 1e-10
               Xe_imag(m,1) = 0;  
            end  
            if Xe_imag(m,1) < 0 && Xe_imag(m,1) > -1e-10
               Xe_imag(m,1) = 0;  
            end
        Xe_mag(m,1) = sqrt(Xe_real(m,1).^2 + Xe_imag(m,1).^2);
    end   
end

