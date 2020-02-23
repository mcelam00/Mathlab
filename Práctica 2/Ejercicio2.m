% Creación de la matriz aleatoria de enteros
% Dimensiones tienen que ser 10 x 4 y los valores comprendidos entre -10 y
% 10
A = int32((10-(-10))*rand(10,4)-10);
    
% Inicialización de la matriz de distancias
Dist = zeros(length(A));

% Relleno de la matriz de distancias
for i=[1:1:10]
    for j=[1:1:10]
        Dist(i,j)= sqrt(sum(A(i,:)-A(j,:)).^2)
    end
end


%NO USAR Test_Ejer2. 
Dist2 = squareform(pdist(double(A), 'euclidean'));
if sum(sum(Dist==Dist2))==100
    disp('El resultado es correcto')
end


%APARTADO 2 DEL EJERCICIO:

[x,y] = find(Dist<10)