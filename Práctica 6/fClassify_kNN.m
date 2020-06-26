function Y_assign = fClassify_kNN(X_train, Y_train, X_test, k)
% This function implements the kNN classification algorithm with the
% eucludean distance
%
% INPUT
%   - X_train: Matrix (n_train x n), where n_Train is the number of 
%   training elements and n is the number of features (the length of the 
%   feature vector)
%   - Y_train: The classes of the elements in the training set. It is a
%   vector of length n_train with the number of the class.
%   - X_test: matrix (n_test x n), where n_test is the number of elements 
%   in the test set and n is the number of features (the length of the 
%   feature vector).
%   - k: Number of nearest neighbours to consider in order to make an
%   assignation
%
% OUTPUT
%   A vector with length n_test, with the classess assigned by the algorithm 
%   to the elements in the training set.
%

    numElemTest = size(X_test, 1);
    numElemTrain = size(X_train, 1); %aqui calculamos el numero de elementos de entrenamiento contra los que hay que calcular la distancia euclidea

    % Allocate space for the output
    Y_assign = zeros(1, numElemTest); %necesito un vector de 1 fila y 1380 columnas que sera el size de filas de X_test (o de la primera dimension de la matriz)
    
    % for each element in the test set... se ejecuta el algoritmo de los K
    % vecinos mas cercanos
    %Recorremos cada uno de los datos de test de la matriz pasada para ver
    %su clase segun su vecindario y asignarlo en la posicion i del vertor
    %retorno
    for i=1:numElemTest %(lo colocaremos todo en la posicion i de Y_assign)
        
        x_test_i = X_test(i,:); %cogemos el primer elemento de test (sus caracteristicas)
        
        % 1 - Compute the Euclidean distance of the i-th test element to 
        % all the training elements (cada fila de X_train)
        % ====================== YOUR CODE HERE ======================
           
           %Otra manera:
           %for j=[1:1:numElemTrain] 
               
              %distancias2(1,j) = pdist2(x_test_i, X_train(j,:)); 
           %end
           
        distanciasVecinos = pdist2(x_test_i, X_train); %calcuo la distancia entre mi dato de test i (la fila de caracteristicas) y cada uno de los elementos de entrenamiento (cada fila de la matriz X_train)
           
        % ============================================================
        
        % 2 - Order distances in ascending order and use the indices of the 
        % ordering(de menor a mayor)
        % ====================== YOUR CODE HERE ======================
        [vectorOrdenado, indicesAntiguos] = sort(distanciasVecinos); %me retorna el vector ordenado y los indices antiguos en los que estaban en ese mismo vector desordenado (es decir en distanciasVecinos)
        % ============================================================

        % 3 - Take the k first classes of the training set
        % ====================== YOUR CODE HERE ======================
        
            %Me quedo solo con los k vecinos mas cercanos y guardo sus
            %indices en indicesVecinos
            indicesVecinos = indicesAntiguos(1:k);
            %ahora tengo que contar las clases mayoritarias de entre los
            %vecinos, accedo a las clases de mis vecinos y las guardo
            clasesVecinos = Y_train(indicesVecinos);      
        % ============================================================
        
        % 4 - Assign to the i-th element the most frequent class
        % ====================== YOUR CODE HERE ======================
        Y_assign(1,i) = mode(clasesVecinos);   %le asigno la clase mayoritaria en su vecindario (mode retorna el elemento que se repite con mas frecuencia)
        % ============================================================
    end

end

