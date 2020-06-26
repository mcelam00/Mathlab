function g = fun_sigmoidal(theta, x) %dado un vector de caracteristicas y un theta (vector thetas) calcular la salida de la funcion sigmoidal
% Esta funcion calcula la funcion sigmoidal g(z), donde z es la combinacion
% lineal de los parametros theta y de las X
%
% INPUT
%	- theta: Parametros de la funcion de hipotesis (h) del clasificador 
%   calculados durante el algoritmo de regresion logistica.
% 	- X: Vector que contiene los datos de un patron.
%
% OUTPUT
%	g: Resultado de aplicar la funcion sigmoidal utilizando la combinacion 
%   lineal de theta y x como parametro.
%
% Author: Victor Gonzalez Castro
% Date: April 2020
%

	% ====================== YOUR CODE HERE ======================
    z = sum(theta .* x); %calculo la combinacion lineal, para ello hago el producto elemento a elemento de cada theta por su x_i y lo sumo todo que será el exponente de la e
    g = 1/(1+exp(1)^(-z)); %aplico la funcion sigmoidal
    % ============================================================
	
end