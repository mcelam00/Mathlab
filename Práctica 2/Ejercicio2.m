% Creación de la matriz aleatoria de enteros
% Dimensiones tienen que ser 10 x 4 y los valores comprendidos entre -10 y
% 10
A = int32((10-(-10))*rand(10,4)-10);
    
% Inicialización de la matriz de distancias
Dist = zeros(length(A));

% Relleno de la matriz de distancias
for i=...
    for j=...
        Dist(i,j)=...
    end
end

%NO USAR Test_Ejer2. 
Dist2 = squareform(pdist(double(A), 'euclidean'));
if sum(sum(Dist==Dist2))==100
    disp('El resultado es correcto')
end