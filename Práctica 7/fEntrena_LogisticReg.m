function theta = fEntrena_LogisticReg(X_train, Y_train, alpha)
% Esta funcion implementa el entrenamiento de un clasificador de regresion 
% logistica utilizando los datos de entrenamiento (X_train) y sus clases 
% (Y_train).  
%
% INPUT
%   - X_train: Matriz de dimension (m x n) con los datos de entrenamiento, 
%   donde m es el numero de patrones de entrenamiento y n es el numero de 
%   caracteristicas (la longitud del vector de caracteristicas que definen 
%   el patron.
%   - Y_train: Vector que contiene las clases de los patrones de 
%   entrenamiento. Su longitud sera m.
%   - alpha: Tasa de aprendizaje del algoritmo de descenso del gradiente
%
% OUTPUT
%   theta: Vector de longitud 1+n (es decir, un elemento mas que el numero 
%   de caracteristicas de cada patron). Contiene los parametros theta de 
%   la hipotesis estimada tras el entrenamiento.
%
% Author: Victor Gonzalez Castro
% Date: April 2020
% 

    % CONSTANTES
    % =================
    VERBOSE = true;
    max_iter = 100;
    % =================

    % Numero de patrones de entrenamiento.
    m = size(X_train,1);

    % Reservar espacio para los valores de la funcion de hipotesis para
    % cada patron de entrenamiento
    h_train = zeros(1, m); %de 1 dimension y m tamanio
    
    % Initialize
    theta = zeros(1, 1+size(X_train,2)); % Inicializa parametros de la hipotesis (1 del theta 0 mas el numero de caracteristicas (la segunda dimension de X_train))
    J = zeros(1, 1+max_iter); % Vector para almacenar el valor de la funcion de coste en cada iteracion

% *************************************************************************
% CALCULO DEL COSTE J PARA LAS THETAS INICIALES %calculo del coste inicial
    
    %a. Resultado intermedio: Calcular el error para cada elemento y sumarlo
    coste_total = 0; %el bucle hace las veces del sumatorio y lo que esta dentro
    for i=1:m %itera a lo largo de todos los elementos de entrenamiento
        x_i = [1, X_train(i, :)]; % Coloca un 1 (el valor de x0) al principio de cada patron
        
        % Resultado de la hipotesis (salida esperada) PARA 1 SOLO ELEMENTO
        h_train(i) = fun_sigmoidal(theta, x_i); %me traigo el valor de theta0*x0+theta1*x1+theta2*x2... para el elemento actual (i)
        
        % Calculo del coste para el elemento i-esimo y suma al coste de los
        % elementos anteriores (estoy calculando el coste sin el sumatorio, solo lo de dentro el bucle me hace de sumatorio)
        coste_patron_i = fCalculaCosteRegLog(Y_train(i), h_train(i));%se le pasa la clase real de uno de los elementos del conjunto de datos de entrenamietno y la estimacion calculada previamente
        coste_total = coste_total + coste_patron_i;
    end
        %Ahora tengo la h(x) de todos los elementos en el momento inicial, calculada con las thetas iniciales que
        %utilizaremos en el bucle del algoritmo del descenso del gradiente
        
    % b. Calcula el coste inicial
    J(1) = (-1/m)*coste_total;

% *************************************************************************
% DESCENSO DEL GRADIENTE PARA ACTUALIZACION DE THETA
 
    % Metodo iterativo que se realiza durante un numero maximo de
    % iteraciones o hasta que la diferencia entre dos valores del coste
    % sea minima o menor que un umbral
    for num_iter=1:max_iter %se itera desde 1 al numero maximo de iteraciones que por defecto es 100
        
        % ***************************************************************
        % PASO 1:
        % Actualizar los valores de Theta
        theta_old = theta; %las theta se guardan (las de la iteracion actual)
        % ====================== YOUR CODE HERE ======================
        % Resultado de la actualizacion de los parametros theta mediante 
        % descenso del gradiente (se actualizan los valores de theta programando la ecuacion del guion como hay 5 caracteristicas van a ser 6 thetas por la 0)
            %se puede usar un for con theta(j) X_train(:,j-1) salvo para la
            %primera que seria .* j
       
        theta(1) = theta_old(1) - alpha*(1/m)*sum((h_train - Y_train).* 1); %theta0
            columnas = X_train(: ,1);
            theta(2) = theta_old(2) - alpha*(1/m)* sum((h_train - Y_train) .* columnas');  %theta1
        columnas = X_train(: ,2);
        theta(3) = theta_old(3) - alpha*(1/m)*sum((h_train - Y_train).* columnas');  %theta2
            columnas = X_train(: ,3);
            theta(4) = theta_old(4) - alpha*(1/m)*sum((h_train - Y_train).* columnas');  %theta3
        columnas = X_train(: ,4);
        theta(5) = theta_old(5) - alpha*(1/m)*sum((h_train - Y_train).* columnas');  %theta4
            columnas = X_train(: ,5);
            theta(6) = theta_old(6) - alpha*(1/m)*sum((h_train - Y_train).* columnas');  %theta5

        % ============================================================
        
        % ***************************************************************
        % PASO 2:
        % Calcular el valor de la funcion de hipotesis h (salida estimada) 
        % PARA CADA ELEMENTO DEL CONJUNTO DE ENTRENAMIENTO CON LOS NUEVOS 
        % THETA
        for i=1:m %se itera desde 1 a m
            x_i = [1, X_train(i,:)]; % Coloca un 1 (el valor de x0) al principio de cada patron
            % Resultado de la hipotesis (salida esperada) para el patron i-esimo
            % ====================== YOUR CODE HERE ======================
            h_train(i) = fun_sigmoidal(theta, x_i); %igual que al inicio pero ahora con las nuevas thetas obtenidas
            % ============================================================
        end

        % ***************************************************************
        % PASO 3. Calcular el coste en esta iteracion y almacenarlo en el
        % vector J
        
        %a. Resultado intermedio: Calcular el error PARA CADA ELEMENTO y 
        % sumar todos
        coste_total = 0;
        for i=1:m
            % ====================== YOUR CODE HERE ======================
            coste_total = coste_total + fCalculaCosteRegLog(Y_train(i), h_train(i)); %igual que arriba solo que ahora la matriz de las h(x) esta actualizada con los nuevos theta
            % ============================================================
        end
        
        % b. Calcular el valor de la funcion de coste J
        % ====================== YOUR CODE HERE ======================
        J(num_iter+1) = (-1/m) * coste_total;%Fuera del bucle le multiplicamos (-1/m) que es lo que nos resta de aplicar de la formula y lo vamos dejando salvado en el slot correspondiente a la interacion del algoritmo del descenso del gradiente por la que vayamos
        % ============================================================
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    if VERBOSE
        % Dibuja el coste J en funcion del numero de iteracion
        figure;
        plot(0:num_iter, J, '-')
        title(['Cost function over the iterations with \alpha=', num2str(alpha)]);
        xlabel('Number of iterations');
        ylabel('Cost J');
    end

end