%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Crear una funcion que permita devolver la letra del DNI
% La función tiene que llamarse Ejercicio4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function letra_dni = Ejercicio4 (numero)
%letra_DNI es la letra correspondiente al numero que se le pasa como
%parametro. numero esta comprendido entre 1.000.000 y 99.999.999

if(numero>=1000000 && numero<=99999999)
    resto = mod(numero,23);
else
    resto = 99;
end


switch(resto)
    case 0
      letra_dni = 'T';  
    case 1
        letra_dni = 'R';
    case 2
        letra_dni = 'W';
    case 3
        letra_dni = 'A';
    case 4
        letra_dni = 'G';
    case 5
        letra_dni = 'M';
    case 6
        letra_dni = 'Y';
    case 7
        letra_dni = 'F';
    case 8
        letra_dni = 'P';
    case 9
        letra_dni = 'D';
    case 10
        letra_dni = 'X';
    case 11
        letra_dni = 'B';
    case 12
        letra_dni = 'N';
    case 13
        letra_dni = 'J';
    case 14
        letra_dni = 'Z';
    case 15
        letra_dni = 'S';
    case 16
        letra_dni = 'Q';
    case 17
        letra_dni = 'V';
    case 18
        letra_dni = 'H';
    case 19
        letra_dni = 'L';
    case 20
        letra_dni = 'C';
    case 21
        letra_dni = 'K';
    case 22
        letra_dni = 'E';
    otherwise
        letra_dni = 'ninguna';
end

disp(letra_dni);

end