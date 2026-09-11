// Ejercicio 5

t = [0:30]; 
Casos = [35; 23; 47; 59; 82; 113; 143; 179; 233; 269; 303; 335; 371; 404; 434; 446; 457; 470; 481; 482; 476; 465; 454; 436; 424; 397; 385; 359; 340; 322; 303]';

theta1 = 13129.3;

// Vector y
y_trans = log(-log(Casos / theta1));

// Funciones phi

function y = phi1(x)
    y = 1;
endfunction

function y = phi2(x)
    y = -x;
endfunction

listaFunc = list(phi1, phi2);

[coeffTheta, err] = min_cuadrados(t, y_trans, listaFunc);

theta2 = exp(coeffTheta(1));
theta3 = coeffTheta(2);

printf("Theta 2 = %f\n", theta2);
printf("Theta 3 = %f\n", theta3);

function y = g(x, t1, t2, t3)
    y = t1 * exp(-t2 * exp(-t3 .* x));
endfunction

clf;
rango= 0:0.01:30
plot2d(t, Casos, style=-1);
plot2d(rango, g(rango, theta1, theta2, theta3), style=5);
xgrid(1);
legend("Datos", "g(t)");
