%------------------------------------
% CLASIFICADOR REGRESION LOGISTICA
% 
% Author: Victor Gonzalez Castro
% Date: April 2020
%------------------------------------

clear
close all

%% PASO INICIAL: CARGA CONJUNTO DE DATOS Y PARTICI?N TRAIN-TEST

load mammographic_data_norm.mat; %cargamos el archivo .m
% X contiene los patrones de entrenamiento (dimension 5)
% Y contiene la clase del patron

% Numero de patrones (elementos) y de variables por cada patron en este dataset
[num_patrones, num_variables] = size(X); %saco las dimensiones de x; el numero de elementos y de sus caracteristicas

% Parametro que indica el porcentaje de patrones que se utilizaran en 
% el conjunto de entrenamiento
p_train = 0.7;

% Particion de los datos en conjuntos de entrenamiento y test. 

num_patrones_train = round(p_train*num_patrones);
%num_patrones_test = num_patrones - num_patrones_train;

ind_permuta = randperm(num_patrones); %maneras de ordenar aleatoriamente

inds_train = ind_permuta(1:num_patrones_train); %Conjunto de entrenamiento
inds_test = ind_permuta(num_patrones_train+1:end); %conjunto de test

%con la secuencia aleatoria dividida de todos los elementos iniciales en 2
%vectores tomo en una nueva matriz los datos de test y
%entrenamiento correspondientes

X_train = X(inds_train, :); 
Y_train = Y(inds_train);

X_test= X(inds_test, :);
Y_test = Y(inds_test);

%% PASO 1: ENTRENAMIENTO DEL CLASIFICADOR Y CLASIFICACION DEL CONJUNTO DE TEST

% La funcion fClassify_LogisticReg implementa el clasificador de la regresion 
% logistica. Abrela y completa el codigo
alpha = 2;
umbral_decision = 0.5;

% ENTRENAMIENTO
theta = fEntrena_LogisticReg(X_train, Y_train, alpha); %os devuleve los theta resultado del entrenamiento

% CLASIFICACION DEL CONJUNTO DE TEST
Y_test_hat = fClasifica_LogisticReg(X_test, theta); %se le proporcionan los datos de test sin las clses reales y los theta
%retornara las prob de que pertenezcan a la clase 1
Y_test_asig = Y_test_hat>=umbral_decision; %si las probabilidades son mayores que el umbral se asigna un 1 y sino un 0

%% PASO 2: RENDIMIENTO DEL CLASIFICADOR: CALCULO DEl ACCURACY Y FSCORE

% Muestra matriz de confusion
figure;
plotconfusion(Y_test, Y_test_asig);

% Error--> Error global %Accuracy
% ====================== YOUR CODE HERE ======================
TN = 0;
TP = 0;
FN = 0;
FP = 0;
    for i = 1:1:size(Y_test, 2) %OJO QUE ES DE LA SEGUNDA DIMENSION
        if(Y_test(i) == Y_test_asig(i)) %si marcan la misma hay que mirar si es 1 o 0 y ver si es vp o vn
            if(Y_test_asig(i) == 0)
                %se trata de un verdadero negativo
                TN = TN +1;
            else
                %se trata de un verdadero positivo
                TP = TP +1;
            end
        else %es que no es el mismo valor, entonces hay que mirar si es Fp o FN
            
            if(Y_test_asig(i) == 0) %la clase real es 1 y entonces es falso negativo
                
                FN = FN +1;
                
            else
                %es que la estimada es 1 y la real 0, con lo cual es un
                %falso positivo
                
                FP = FP +1;          
            end
        end
        
    end
            
accuracy = (TP+TN)/(TP+TN+FP+FN); 
% ============================================================

fprintf('\n******\nError global = %1.4f%% (classification)\n', accuracy*100);

% Sensitivity
% ====================== YOUR CODE HERE ======================
sensitivity = TP/(TP+FN);
% ============================================================

fprintf('\n******\nSensitivity = %1.4f (classification)\n', sensitivity);

% Specificity
% ====================== YOUR CODE HERE ======================
specificity = TN/(FP+TN);
% ============================================================

fprintf('\n******\nSpecificity = %1.4f (classification)\n', specificity);

% F-SCORE
% ====================== YOUR CODE HERE ======================
FScore =2*(((TP/(TP+FP)) * (TP/(TP + FN)))/ ((TP/(TP+FP)) + (TP/(TP + FN))));
% ============================================================
fprintf('\n******\nFScore = %1.4f (classification)\n', FScore);
