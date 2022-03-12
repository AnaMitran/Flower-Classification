% Clasificare cu CMMP

load("iris.mat");
% date initiale
N1 = 50;        % numar puncte in prima clasa
N2 = 100;       % numar puncte in a doua clasa
ell = 4;        % dimensiunea vectorilor de clasificat 
tip_clase = 3;  % cum generam clasele 

% genereaza vectorii din cele doua clase
for k=1:tip_clase
    switch k
       case 1%Setosa      
            V1 = iris_data(1:50,1:ell);%(50x4)
            V2 = iris_data(51:150,1:ell);%(100x4)
        case 2%Versicolor    
            V1 = iris_data(51:100,1:ell);
            V2 = [iris_data(1:50,1:ell); iris_data(101:150,1:ell)];
        case 3%Virginica 
            V1 = iris_data(101:150,1:ell);
            v2 = iris_data(1:100,1:ell);
    end
    % formeaza si rezolva problema CMMP
    A = [ V1 ones(N1,1); V2 ones(N2,1) ]; %(50x4 50x1; 100x4 100x1)
    b = [ones(N1,1); -ones(N2,1)]; %(50x1; 100x2)
    x = CMMP(A, b);    
    c = x(1:ell);
    d = x(ell+1);

    % Verificam cati vectori de antrenare sunt clasificati corect in fiecare clasa
    matrice_confuzie = zeros(2);
    for i = 1 : N1         
      if sign(c'*V1(i,:)' + d) == 1
        matrice_confuzie(1,1) = matrice_confuzie(1,1) + 1;
      else
        matrice_confuzie(1,2) = matrice_confuzie(1,2) + 1;
      end
    end
    for i = 1 : N2
      if sign(c'*V2(i,:)' + d) ~= 1
        matrice_confuzie(2,2) = matrice_confuzie(2,2) + 1;
      else
        matrice_confuzie(2,1) = matrice_confuzie(2,1) + 1;
      end
    end
    matrice_confuzie %Setosa este complet si corect clasificata, deci poate fi separata de restul
 end


