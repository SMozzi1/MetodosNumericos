// Funcion que dado un vector de puntos xi y un grado genera la matriz del polinomio de aproximacion del grado dado

function A = matrixCons(x, gr)
    [n,m] = size(x);
    A = zeros(m,gr+1);
    A(:,1) = ones(m);
    disp(m);
    B = diag(x);
    for i = 2 : gr+1
        disp(B);
        A(:,i) = B * A(:,i-1);
    end
endfunction


x = [0 0.15 0.31 0.5 0.6 0.75];
A = matrixCons(x,2);
disp(A);

function [g, err] = coefPolGenerator(x,b,gr)
    [n,m] = size(x);
    A = matrixCons(x,gr);
    [Q,R] = qr(A, "e");
    g = R \ (Q' * b');
    err = norm((A * g) - b');
endfunction

y = [1 1.004 1.031 1.117 1.223 1.422];
[g1, err1] = coefPolGenerator(x,y,1);
[g2, err2] = coefPolGenerator(x,y,2);
[g3, err3] = coefPolGenerator(x,y,3);


disp(g1);
disp(err1);
disp(g2);
disp(err2);
disp(g3);
disp(err3);


// ejercicio 8

x = [4 4.2 4.5 4.7 5.1 5.5 5.9 6.3 6.8 7.1];
y = [102.56 113.18 130.11 142.05 167.53 195.14 224.73 256.73 299.5 326.72]

[g1, err1] = coefPolGenerator(x,y,1);
[g2, err2] = coefPolGenerator(x,y,2);
[g3, err3] = coefPolGenerator(x,y,3);

disp(g1);
disp(err1);
disp(g2);
disp(err2);
disp(g3);
disp(err3); 
pol1= poly(g1,"x","coeff");
pol2= poly(g2,"x","coeff");
pol3= poly(g3,"x","coeff");

// esto se lo pedi al chat

clf();

// Grilla fina en [4, 7.1] para trazar curvas suaves
xx = linspace(min(x), max(x), 200);
y1 = horner(pol1, xx);
y2 = horner(pol2, xx);
y3 = horner(pol3, xx);

// --- Panel superior: puntos y los 3 polinomios superpuestos ---
subplot(2, 1, 1);
plot(x, y, "ko", "MarkerSize", 6, "MarkerFaceColor", "k");
plot(xx, y1, "r-", "LineWidth", 2);
plot(xx, y2, "b--", "LineWidth", 2);
plot(xx, y3, "g:", "LineWidth", 2.5);

xgrid();
title("Ejercicio 8: Ajuste por mínimos cuadrados (Grados 1, 2 y 3)");
xlabel("x");
ylabel("y");
legend(["Datos de la tabla", "Grado 1 (recta)", "Grado 2 (parábola)", "Grado 3 (cúbica)"], "in_upper_left");

// Segmentos verticales que muestran el error (residuo) de la recta en cada nodo
y1_nodos = horner(pol1, x);
for i = 1:length(x)
    plot([x(i), x(i)], [y(i), y1_nodos(i)], "r:", "LineWidth", 1);
end

// --- Panel inferior: residuos e_i = y_i - P_d(x_i) para distinguir grados 2 y 3 ---
subplot(2, 1, 2);
plot(x, y - horner(pol1, x), "ro-", "LineWidth", 1.5);
plot(x, y - horner(pol2, x), "bs-", "LineWidth", 1.5);
plot(x, y - horner(pol3, x), "gd-", "LineWidth", 1.5);
plot([min(x), max(x)], [0, 0], "k--");

xgrid();
title("Residuos en cada nodo: e_i = y_i - P_d(x_i)");
xlabel("x");
ylabel("Error");
legend(["Residuo Grado 1", "Residuo Grado 2", "Residuo Grado 3"], "in_lower_left");

// fin de lo que le pedí al chat

