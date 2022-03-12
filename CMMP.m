function [x] = CMMP(A,b)
%% Problema celor mai mici patrate
% INPUTS:
%   A -- matrice aleatoare de dimensiune (m, n), m>n
%        cu coloane liniar independente    
%   b -- vector aleator de dimensiune (m, 1)
%
% OUTPUT:
%   x -- solutia sistemului liniar supradeterminat A*x=b
%        vector de dimensiune (n, 1)


%% SOLUTION START %%
[m,n]=size(A);
[R,U,beta]=TORT(A);
for k=1:n
    tau=(U(k:m,k)'*b(k:m))/beta(k);
    for i=k:m
        b(i)=b(i)-tau*U(i,k);
    end
end
x=UTRIS(R(1:n,:),b(1:n));
%% SOLUTION END %%

end