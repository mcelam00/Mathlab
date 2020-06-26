%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creaci�n de una script va a almacenar los datos de una matriz en dos
% ficheros de texto diferentes.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Creaci�n de la matriz
matriz = magic(6);

% Creaci�n del fichero de texto 'matriz.txt' que tiene que estar separado
% por tabuladores. Utilizar funciones de fopen y fprintf
file = fopen('matriz.txt', 'w');

for i=1:6
    for j=1:6
    fprintf(file,'%d\t', matriz(i,j));
    end
    fprintf(file,'\n');
end
    
fclose(file);

% Creaci�n del fichero de texto 'matriz.csv' que tiene que ser un fichero
% csv delimitado por ';'

file1 = fopen('matriz.csv', 'w');
M = dlmread(file, ';');
    dlmwrite(file1,M,';');
    
    
fclose(file1);