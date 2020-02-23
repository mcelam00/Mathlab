% Creación de la matriz aleatoria
% Dimensiones 20 x 20 y valores entre 0 y 3
A = 3*rand(20,20)
    
% Apartado 1
[Ap11, Ap12] = find(A>=1 & A<2)

% Apartado 2
Ap2 = find(A<1 | A>2)

%Apartado 3
Y = round(A)
Ap3 = find(Y~=1) %el elemento 396 los estoy leyendo como si las columans estuvieran seguidas una de otra hacia abajo
    
%%find(A==7) elemento de la matriz que sean igual es a siete