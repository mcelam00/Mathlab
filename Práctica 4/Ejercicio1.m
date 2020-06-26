%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Crear en una figura tres gráficas en las que se representen las
% relaciones trigonométricas del ángulo alpha y alpha +pi/4. Una gráfica
% será contínua en color rojo y la otra discontinua en color negro.
% Etiquetar cada una de ellas convenientemente
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Definimos la variable ángulo que va a ser el eje de las x
alpha=0:pi/8:6*pi;

% Inicializamos la figura
figure(1);
    
% Ploteamos la primera gráfica cos(alpha) & cos(alpha + pi/4)
subplot(311);
plot(alpha,cos(alpha), 'r-');
hold on;
plot(alpha, cos(alpha + pi/4), 'k--');
% Ponemos título y leyenda
title('\bf FUNCION COSENO');
legend('\alpha','\alpha+pi/4');
axis([0 20 -1 1]);
    
% Ploteamos la segunda gráfica sin(alpha) & sin(alpha + pi/4)
subplot(312);
plot(alpha,sin(alpha), 'r-');
hold on;
plot(alpha, sin(alpha + pi/4), 'k--');

% Ponemos título y leyenda
title('\bf FUNCION SENO');
legend('\alpha','\alpha+pi/4');
axis([0 20 -1 1]);
    
% Ploteamos la tercera gráfica tan(alpha) & tan(alpha + pi/4)
subplot(313);
plot(alpha,tan(alpha), 'r-');
hold on;
plot(alpha, tan(alpha + pi/4), 'k--');
% Ponemos título y leyenda y hay que limitar el eje y para que esté entre
title('\bf FUNCION TANGENTE');
legend('\alpha','\alpha+pi/4');

% los valores -10 y 10
axis([0 18 -10 10]);