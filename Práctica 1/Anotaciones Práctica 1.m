Para crear una variable se utiliza nombre de la variable = valor que se le asigna
Si en el workspace hago doble clic sobre la varible me muestra mas detalles
la funcion sum hace el sumatorio de los elementos de un vector o una matriz sum(argumentos de entrada)
Los corchetes son para las matrices, para las funciones siempre paréntesis
Si ponemos help y la funcion se nos muestra la ayuda de la funcion
helpwin sum la saca en una ventana a parte
x = [0 1 2, 3 4 5]
sum(matriz, 1)El argumento es en filas o columnas
sum(matriz, 2)
En la ventana de comandos probamos y luego escribiremos en el script lo bueno. Si en la ventana de comandos tocamos la flecha de arriba nos apraecera un historico de todos los comandos que hemos estado utilizando
-Consejo, probar en la linea de comandos primero, lo hacemos y si funciona en la linea de comandos lo copio y lo pego
-En el script si selecciono una linea y doy f9 solo me ejecuta la linea seleccionada del script, con f5 ejecuto el script entero
* es la miltiplicaion normal
el valor del numero de euler es con exp(1)
si escribo un vector [1 2 3] el traspuesto del vector sería [1 2 3]'
Si aplicamos a un vector columna pues es el vector fila
.* Multiplcia elemento a elemento, el de la 1 1  con el de la 11 y asigna ese resultado
A * B es el producto matricical, es decir, la matriz producto que resulta y si querermos ir elemnto a elemento es con .*
Con las demas operaciones es igual con el . delante
Las varialbes se nombran con letras, no puede haber espacios
inf es la variable infinito
ans es el ultimo resultado obtenido (answer) y se sobreescribe, como en la calculadora
Vecores y matrices son lo mismo para matlab. Para escribir una matriz tenemos que usar los corcheres, A = [16 3 2 13 ; 5 10 11 8 ; 9 6 7 12 ; 4 15 14 1] para saltar de fila ;
para separar los elementos dentro de uan fila se pueden utilizar espacios o se pueden utilizar comas.
Despues de cada sentencia poner un ; para que si ejecutamos la instruccion con ; no aparece la respuesta que aparece en el workspace pero no en la consola. Y podemos darle doble click y verlo con detalle
14.1 es un numero decimal que puede introducirse en las matrices igualmente que los demas numeros
vector fila todo seguido vi = [16 3 2 13]
vector columna con separaciones de ; entre numeros vi = [16 ; 3 ; 2 ; 13]
vector desde 0 hasta pi con saltos de pi cuartos
tambien puede hacerse con la funcion linespace`podemos teclear con tabulador y me autocompleta
vi = linspace(-sqrt(3), pi , 5) creamos un vector que va desde la raiz cuadrada negativa de 3 hsata pi con 5 elementos 
v3 = [0:pi/4:pi]
zeros(5,6) es de 5 filas y 6 columnas matriz de ceros
si me he equivocado al poner la varible una vez creada la matriz cambio el elemento con el nombre de la matriz le decimos que elemento quereis cambiar  tercera fila segunda columna y me dira que es el 6. le decimos = lo que sea, es decir A(3,2) = 999
el tamano de una matriz size(nombre de la matriz)
A(end, end) sale el ultimo elemento de la matriz, la ultima fuila y la ultima columna es 1 A(1,end)
construir un vector de la matriz A y que sea solo la segunda fila de la matriz v10 = A(2,:)
los : se utilizan para todos los elementos de la fila

1 se refiere a las filas y 2 a las columnas

