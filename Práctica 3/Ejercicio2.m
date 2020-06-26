%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Crear una funcion que adem�s de asignar el valor num�rico a cada palabra
% de una frase devolver� un cell en el que se �ndica cada palabra y el 
% n�mero de veces que se repite.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function cell = Ejercicio2(frase)

fraseDividida = regexp(frase,' ','split'); %divido la frase en un vector

%con unique saco la misma frase sin palabras repetidas
%con strcmp la comparo

fraseSinRepeticiones = unique(fraseDividida);
fraseDividida2 = regexp(fraseSinRepeticiones,' ','split');
cell = {};
contador = 0;
vectorComparaciones = [];
cell{1, 2} = vectorComparaciones;

for i=[1:1:size(fraseDividida)]
    for j=[1:1:size(fraseDividida2)]
        if(strcmp(fraseDividida(1,i),fraseDividida2(1,j)) == 1)
            %le suma una al vector repeticiones en la posicion i
            contador = contador + 1; 
            vectorComparaciones(1,i) = contador;
        end
    end
end

cell{1,1} = fraseDividida;



end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ejemplo de soluci�n
% I = 
% 
%     'Prueba'    'de'    'ejemplo'    'ejercicio2'
%     [     1]    [ 2]    [      1]    [         1]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%debe devolver las palabras unicas y debajo, el numero de repeticiones de la papabra
%se quitan las repetidas con la funcion unique