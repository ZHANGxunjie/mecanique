function y = C_elas(lambda0,mu0)
% -------------------------------------------------------------------------
%
%
%
% -------------------------------------------------------------------------
for i = 1:2
    for j = 1:2
        for k = 1:2
            for h = 1:2
                c0(i,j,k,h) = lambda0.*(i==j).*(k==h) + mu0.*((i==k).*(j==h)+(i==h).*(j==k)) ;
            end
        end
    end
end
y = zeros(3) ;
y(1,1) = c0(1,1,1,1) ;
y(1,2) = c0(1,1,2,2) ;
y(1,3) = c0(1,1,1,2) ;
y(2,1) = c0(2,2,1,1) ;
y(2,2) = c0(2,2,2,2) ;
y(2,3) = c0(2,2,1,2) ;
y(3,1) = c0(1,2,1,1) ;
y(3,2) = c0(1,2,2,2) ;
y(3,3) = c0(1,2,1,2) ;

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        