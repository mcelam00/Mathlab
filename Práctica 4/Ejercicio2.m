%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script que va a pedir por pantalla varios datos referente a partículas
% que se van a plotear y calcular su centro de masas
% NO MODIFICAR EL NOMBRE DE LAS VARIABLES QUE SE INCUYEN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Se pide por pantalla el número de particulas que se va introducir.
particulas = input('Por favor, introduzca el numero de particulas:');

% Se inicializa la matriz que va a almacenar las coordenadas y la masa de
% cada una de las partículas
matriz = zeros(particulas, 3);

% Se van pidiendo por pantalla los datos de todas las particulas
for i=[1:1:particulas]
    matriz(i,1) = input('Posicion x:');
    matriz(i,2) = input('Posicion y:');
    matriz(i,3) = input('Masa');
end

% Se iniciliza la variable donde se va a almacenar el centro de masas
centroDeMasasx = 0;
centroDeMasasy = 0;
CentroDeMasasTotal = 0;
CoordX = 0;
CoordY = 0;
masaTotal = 0;
    
% Se calcula el centro de masas
    
for i=[1:1:particulas]
    masaTotal = masaTotal +  matriz(i,2);
    centroDeMasasx = centroDeMasasx + (matriz(i,1)*matriz(i,3));
    centroDeMasasy = centroDeMasasy + (matriz(i,2)*matriz(i,3));
end
   CoordX = centroDeMasasx/masaTotal;
  CoordY = centroDeMasasy/masaTotal;
    
    
% Inicializamos la figura en la que se van a plotear los datos
    figure(1);
    
% Se plotea cada una de las partículas añadiendo el número de la particula
% con una etiqueta en la que se inidica el valor de la masa.

   for i=1:particulas
        
       scatter(matriz(i,1), matriz(i,2), 'r.');
        hold on;
   end
       

% Se añade el centro de masas teniendo en cuenta que hay que cambiar la
% forma del punto para que destaque


       scatter(CoordX, CoordY, 'rx');
       
       grid on;
