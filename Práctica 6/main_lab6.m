%------------------------------------
% CLASIFICADOR K VECINOS MAS PROXIMOS
%------------------------------------

clear

%% PARTE 1: CARGA CONJUNTO DE DATOS Y PARTICION TRAIN-TEST

load spambase_data.mat;
% X contiene los elementos que se van a estudiar (cada fila corresponde a 
% un vector de caracteristicas)
% Y contiene la clase de cada elemento (cada columna es la clase de cada fila de X)

% Numero de elementos del dataset y de variables que tiene cada uno (dimensiones de la matriz x)
[num_patrones, num_variables] = size(X);

% Parametro que indica el porcentaje de elementos que se utilizaran en
% el conjunto de entrenamiento (para el entrenamiento se utilizaran el 70 por cien de las filas === de los elementos de x y de las columnas de y)
p_train = 0.7;

% En la siguiente seccion de codigo se realiza la particion de los datos en 
% entrenamiento y test. Indica lo que realiza cada linea de codigo mediante 
% comentarios.
% ============================================================================================================================
    %Como necesito calcular el 70 por cien de los elementos, y los elementos completos (caracteristicas + etiqueta) son la dimension de filas de X y de columnas de Y (que son
    %iguales: atributos - clase) y he obtenido las dimensiones de X. Tengo que calcular el 70 por cien (0.7 en tanto por uno) del numero de filas(num_patrones), por eso se multiplican p_train y él. 
    %Como no da entero (= 3220.7) y los elementos no pueden ser partes, pues redondeo con round al entero
    %más cercano (=3221). Como el no. de filas de X es igual al no. columnas de Y me vale para las 2 esos 3221 elementos. 

num_patrones_train = round(p_train*num_patrones); 

    %Calculamos ahora las permutaciones del numero de elementos totales
    %(filas de X) devolviendonos un vector fila que contendrá las permutaciones
    %aleatorias de 1 a 4601 sin repetir elementos.

ind_permuta = randperm(num_patrones);

    %El paso anterior lo hacemos para obtener unos índices aleatorios y no
    %coger los 3221 primeros elementos como datos de entrenamiento, sino los 3221 primeros del vector ind_permuta, siendo
    %indices aleatorios entre 1 y 4601
    
inds_train = ind_permuta(1:num_patrones_train); %De nuestro vector fila seleccionamos todas las columnas de la 1 a la num_patrones_train que sera la 3221

    %Obtenemos así un vector de indices (con los indices de los 3221 elementos de entrenamiento) que será el inds_train
    %Asimismo, el numero de elementos ( o de indices) restantes en el vector ind_permuta los cogemos para nuestros elementos de test
    %configurando asi otro vector de indices para los elementos de test
    
inds_test = ind_permuta(num_patrones_train+1:end); %De nuestro vector fila seleccionamos desde la columna siguiente al ultimo indice cogido hata el final

    %Con nuestros dos vectores de indices vamos a ir ahora a sacar los
    %elementos (sus carácteristicas) y las clases correspondientes:
    
    %Accedemos en X y cogemos todas las columnas de las filas que marca el
    %vector de indices de elementos de entrenamiento obtenido antes
    %Hacemos lo mismo con sus clases (matriz y), pero en lugar de seleccionar las
    %filas que marque el vector de indices, en este caso seleccionaremos esos indices pero en columnas
    
X_train = X(inds_train, :);   %Así pues en X_train tendremos las caracteristicas de los 3221 elementos aleatorios de entre los 4601
Y_train = Y(inds_train);        %Y en Y_train tendremos las clases correspondientes a esos mismos elementos

    %Hacemos justamente los dos mismos pasos pero utilizando los indices de
    %los valores que seran test (nuestro vector de indices de elementos de test) y
    %obtenemos:

X_test= X(inds_test, :);  %En X_test las caracteristicas correspondientes a los 1380 datos de test elegidos de forma aleatoria
Y_test = Y(inds_test);      %En Y_test las clases correspondientes a esos elementos

% =====================================================================================================================================

%% PARTE 2: ALGORITMO DE LOS K VECINOS MAS CERCANOS

% La funcion fClassify_kNN ejecuta el algoritmo de kNN. Abrela y completa 
% el codigo
k=3;

Y_test_asig = fClassify_kNN(X_train, Y_train, X_test, k);


%% PARTE 3: EVALUACION DEL RENDMIENTO DEL CLASIFICADOR

% Muestra matriz de confusion
plotconfusion(Y_test, Y_test_asig);

% Error--> Error global
% ====================== YOUR CODE HERE ======================
    %numero de verdaderos positivos recorro el vector de clases asignadas y comparar en la posicion 1 dependiendo de si es un 1 o 0 y viendo en el vector de clases reales si da lo mismo o no pues contar uno o no 

Y_test_asig = [1 1 0 1];
Y_test = [0 0 1 1];   

%Verdadero positivo: si ha dicho que es 1 y era 1 su clase
TP =  sum(Y_test(Y_test_asig == 1) ==1); %Miro en primer lugar los indices del vector salida del clasificador donde se cumple la condicion (se validó a 1 el indice) y esos mismos indices donde se cumple los uso en la matriz de etiquetas real y miro si en esos indices, que validan la primera condicion, se valida tambien la segunda. Esto me retorna una matriz booleana con 1 cuando si validan las 2 y 0 si no valida la
                                         %segunda (si la primera no se valida para ese indice la segunda ni cuenta ya)entonces al hacer sum y ser una matriz de booleanos se suman los 1 (verdaderos) y los 0 no, asi que obtengo como suma de unos el total de columnas que cumplen las condiciones
%Falso positivo: ha salido clase 1 y era 0
FP = sum(Y_test(Y_test_asig == 1) == 0);
%Verdadero negativo: ha salido clase 0 y era 0
TN = sum(Y_test(Y_test_asig == 0) == 0);
%Falso negativo: ha salido 0 y era 1
FN = sum(Y_test(Y_test_asig == 0) == 1);

    %con esta matriz formada pues ya aplicamos las formulas pdf

    
    error = (FP + FN)/(TP + TN + FP + FN);    
    
% ============================================================
fprintf('\n******\nError global = %1.4f%% (classification)\n', error*100);

% Tasa de falsa aceptaci?n
% ====================== YOUR CODE HERE ======================
    FPR = (FP)/(FP + TN);
% ============================================================
fprintf('\n******\nTasa de falsa aceptacion = %1.4f%% (classification)\n', FPR*100);

% Tasa de falso rechazo
% ====================== YOUR CODE HERE ======================
    FNR = (FN)/(TP + FN);
% ============================================================
fprintf('\n******\nTasa de falso rechazo = %1.4f%% (classification)\n', FNR*100);

% Precision
% ====================== YOUR CODE HERE ======================
    precision = TP/(TP + FP);
% ============================================================
fprintf('\n******\nPrecision = %1.4f%% (classification)\n', precision*100);

% Recall
% ====================== YOUR CODE HERE ======================

recall = sum(Y_test_asig==1 & Y_test==1)/sum(Y_test==1);
%recall = (TP)/(TP + FN); Porque yo hice los índices ya arriba
% ============================================================
fprintf('\n******\nRecall = %1.4f%% (classification)\n', recall*100);

