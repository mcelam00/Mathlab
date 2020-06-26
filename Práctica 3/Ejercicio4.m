%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Crear un script para trabajar con struct y cell
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1.- Creación de los struct de partida.

% Struct en el que se va a almacenar el primer trabajador
Estructura1.Nombre = 'Bernard';
Estructura1.Tiempos = [25.8, 34.6, 22.9, 33.3];
Estructura1.Calidad = [true, true, false, true];

% Struct ene el que se va a almacenar el segundo trabajador
Estructura2.Nombre = 'Joe';
Estructura2.Tiempos = [18.7, 19.9, 23.4, 18.0, 18.7, 20.0];
Estructura2.Calidad = [false, true, true, false, true, false];

% Calculo de los tiempos medios en la fabricación de una pieza correcta para cada trabajador

for i=[1:1:size(Estructura1.Tiempos)]
    sumatorio = sumatorio+Estructura1.Tiempos(i);
end

Estructura1.Tmean = sumatorio / size(Estructura1.Tiempos);

for i=[1:1:size(Estructura1.Tiempos)]
   sumatorio = sumatorio+Estructura1.Tiempos(i);
end

Estructura2.Tmean = sumatorio / size(Estructura1.Tiempos);

% Conversion de las estructuras a cell y almacenamiento en la misma
% variable
Celda = struct2cell(Estructura1);
Celda = struct2cell(Estructura1);



% Calculo de los tiempos medios en la fabricación de una pieza incorrecta
% para cada trabajador
...
for ...
    ...
end