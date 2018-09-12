% ---------MAIN--------------------------------------------------------
%   La vie est dure !
clc ;
close all ;
clear all ;

% ---------COEFFICIENTS-------------------------------------------------------
E1 = 70e9 ;     %  E1 = Em
E2 = 420e9 ;    %  E2 = Ef
nu1 = 0.3 ;     %  nu1 = nu_m    
nu2 = 0.2 ;     %  nu2 = nu_f
N1 = 4 ;
N2 = 4 ;        %   pixel = N1*N2 
T1 = 1 ;        %   longeur de axe x
T2 = 1 ;        %   longeur de axe y
lambda1 = E1.*nu1./((1+nu1).*(1-2.*nu1)) ;
mu1     = 0.5.* E1./(1+nu1) ;
lambda2 = E2.*nu2./((1+nu2).*(1-2.*nu2)) ;
mu2     = 0.5.* E2./(1+nu2) ;
lambda0 = 0.5.*(lambda1+lambda2) ;
mu0     = 0.5.*(mu1+mu2) ;


% ---------ALGORITHES------------------------------------------------------
%  ---coordinates pixels reel espace --------------------------------------
x_d = zeros(N1, N2) ;
for i = 1 : fix(N1) 
    for j = 1 : fix(N2)
        x_d(j,i,1) = (i-1)*T1/N1;
        x_d(j,i,2) = (j-1)*T2/N2;
    end
end
% ---frequences fourier espace --------------------------------------------
[xi_2, xi_1] = ndgrid(xi(N1,T1), xi(N2,T2)) ;
% xi_d = zeros(N1,N2) ;
% for i = 1 : fix(N1) 
%     for j = 1 : fix(N2)
%         xi_(i,j,1) = xi_1(i,j);
%         xi_d(i,j,2) = xi_2(i,j);
%     end
% end

% ----- oerateurs---------------------------------------------------

% figure(1) ;
% plot(x_d(:,:,1), x_d(:,:,2),'*') ;
% figure(2)
% plot(xi_1,xi_2,'*')


% ------INITIAL -----------------------------------------------------------
% disp('==============Coordonnes=================') ;
% disp('-----dimensions de espcace reel-------') ;
% x_d
% disp('-----dimensions de espace Fourier-----') ;
% xi_d
% disp('============== initialization=================') ;
% disp('-----pour un pixel -------------------') ;
epsilon_0 = [1 0;0 0];
% ----- ITERATION -------------------------------------------------------------------------
disp('============= iteration =====================') ;
disp('-----pour tous les pixel----') ;
for i =1:N1
    for j = 1:N2
        epsilon_i(i,j,:,:) = epsilon_0 ;      
    end
end
disp('-----deformation-------') ;
size(epsilon_i)

sigma_i = production1(x_d,epsilon_i,lambda0,mu0) ;
disp('-----contrainte-------') ;
size(sigma_i)

for i=1:N1
    for j=1:N2
        Epsilon_i(i,j,:,:)=fft(epsilon_i(i,j,:,:));
        Sigma_i(i,j,:,:) = fft(sigma_i(i,j,:,:)) ;
    end
end
Epsilon_i(1,1,:,:)=epsilon_0;
while 1
    
    Epsilon_i = fft(epsilon_i) ;
    Sigma_i = fft(sigma_i) ;
    erreur = convergence_test(xi_d,Sigma_i) ;

    Epsilon_i1 = Epsilon_i - production2(xi_d,Sigma_i,lambda0,mu0) ;
    epsilon_i1 = ifft(Epsilon_i1) ;
    sigma_i1 = production1(x_d,epsilon_i1,lambda0,mu0) ;
    epsilon_i = epsilon_i1 ;
    sigma_i = sigma_i1 ;  
   
    break ;
end





















