// Ejercicio 4

// Tabla
x = [2.0 2.1 2.2 2.3 2.4 2.5]
y = [0.2239 0.1666 0.1104 0.0555 0.0025 -0.0484]

p = dif_div_newton(x,y)
printf("El polinomio interpolante de la interpolación de Newton es:\n")
disp(p)

// Error de interpolación
function z = cota_error(p, x, cot)
    // Entrada: p = valor real a evaluar la interpolacion, x = nodos de 
    // interpolación, cot = cota de |f^(n + 1))| (derivada)
    // Salida: z = error de interpolación en x = p
    [filX, colX] = size(x);
    n = colX;
    z = cot/(factorial(n));
    for i = 1:n
        z = z * abs(p - x(i));
    end
endfunction

JEn215 = horner(p, 2.15);

errEn215 = cota_error(2.15, x, 1); // |j_0^(7)(x)| <= 1, por lo visto en 3.

printf("El valor aproximado de J_0(2.15) es: %f\n", JEn215);
printf("con cota de error: ");
disp(errEn215);
printf("\n")

JEn235 = horner(p, 2.35)

errEn235 = cota_error(2.35, x, 1);

printf("El valor aproximado de J_0(2.35) es: %f\n", JEn235);
printf("con cota de error: ");
disp(errEn235);
printf("\n")
