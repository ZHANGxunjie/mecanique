function y1 = C(lambda0,mu0)
% ------------------------------------------------------------------------
%
%
%
%
% -----------------------------------------------------------------------

for i = 1:2
    for j = 1:2
        for k = 1:2
            for h = 1:2
                y1(i,j,k,h) = lambda0.*(i==j).*(k==h) + mu0.*((i==k).*(j==h)+(i==h).*(j==k)) ;
            end
        end
    end
end