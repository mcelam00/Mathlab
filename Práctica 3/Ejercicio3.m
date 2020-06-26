%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creación de una función que nos va a dar los tiempos de procesado en
% función de como reservemos la memoria y trabajemos con los datos.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Tiempos = Ejercicio3(n)
    
    % Inicialización del array en el que vamos a guardar los tiempos
    Tiempos = zeros(1,3);
    numeros = 1:n;

    % Utilizando un bucle for sin declarar las variables. 
    t = cputime; 
    for i=numeros
        a(i) = i^2;
     end
   Tiempos(1) = cputime - t; 
    
    % Utilizando un bucle for declarando previamente la variable. 
   
    t = cputime; 
   
    a = zeros(1,n);
    
    for i=numeros
        a(i) = i^2;
    end
    Tiempos(2) = cputime - t; 

    
    % Calculando el cuadrado del vector correspondiente
    t = cputime; 
    
    for i=numeros
        a(i) = i; %relleno el vector con numeros
    end
    
    b = a .^ 2; %calculo el cuadrado
   
    Tiempos(3) = cputime - t; 
    
    
end

%le pasamos en la n el numero que representa si le pasamos el numero 10 la
%funcion calcula los cuadrados de los 10 primeros numeros 
%pasadle 10 millones
%con un bucle sin declarar la variable solo a=^2 a es un vector con un
%tamaño determinado, cada cuadrado en una posicion del vecotr
%reservando memoria
%meter los numeros en un vector y elevarlos al cuadrado .^2 
%medimos tiempos y que se nos cuarden en la variable que se nos pide, la
%variable debe ser un vector