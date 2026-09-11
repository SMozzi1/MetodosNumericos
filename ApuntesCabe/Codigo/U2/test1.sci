mprintf("=== INICIANDO TEST SUITE DE MÉTODOS NUMÉRICOS ===\n\n");

// -----------------------------------------------------------------------------
// 1. TEST DE RAÍCES ROBUSTAS
// Basado en la Ec. 10 del apunte: eps*x^2 + (1/eps)*x - eps = 0
// -----------------------------------------------------------------------------
mprintf("--- 1. Test de Raíces Robustas ---\n");
epsilon = 1e-4; 
// Coeficientes: a0 = -epsilon, a1 = 1/epsilon, a2 = epsilon
// poly crea el polinomio usando coeficientes de menor a mayor grado
p_robust = poly([-epsilon, 1/epsilon, epsilon], "x", "coeff");

raices_propias = miRaices(p_robust);
raices_scilab = roots(p_robust);

// La raíz positiva exacta aproximada es epsilon^2 (según apunte)
raiz_esperada = epsilon^2; 

mprintf("Polinomio: %f x^2 + %f x + %f = 0\n", epsilon, 1/epsilon, -epsilon);
mprintf("Raíz positiva esperada (aprox): %e\n", raiz_esperada);
mprintf("Tu miRaices (positiva):         %e\n", raices_propias(2)); // Asumiendo que x+ queda en index 2
mprintf("Roots de Scilab:                %e\n", raices_scilab(2)); 

err = abs(raices_propias(2) - raiz_esperada);
if err < 1e-10 then
    mprintf("RESULTADO: PASÓ (La robustez funciona, error bajo: %e)\n", err);
else
    mprintf("RESULTADO: OJO (Revisar lógica de signos)\n");
end
mprintf("\n");

// -----------------------------------------------------------------------------
// 2. TEST DE HORNER (VALOR Y DERIVADA)
// Polinomio simple: P(x) = x^3 - 2x^2 + x - 3 en x = 2
// P(2) = 8 - 8 + 2 - 3 = -1
// P'(x) = 3x^2 - 4x + 1 -> P'(2) = 12 - 8 + 1 = 5
// -----------------------------------------------------------------------------
mprintf("--- 2. Test de Horner Generalizado ---\n");
// Coefs: -3, 1, -2, 1
p_horner = poly([-3, 1, -2, 1], "x", "coeff"); 
x0 = 2;

[val, der] = miHorner(p_horner, x0);

mprintf("Polinomio: x^3 - 2x^2 + x - 3 en x=2\n");
mprintf("Esperado: Val = -1, Derivada = 5\n");
mprintf("Obtenido: Val = %f, Derivada = %f\n", val, der);

if val == -1 & der == 5 then
    mprintf("RESULTADO: PASÓ (Cálculo exacto)\n");
else
    mprintf("RESULTADO: FALLÓ\n");
end
mprintf("\n");

// -----------------------------------------------------------------------------
// 3. TEST DE DERIVADA NUMÉRICA (Orden superior)
// f(x) = sin(x). Derivada 4ta de sin(x) es sin(x).
// Evaluamos en x = pi/2. sin(pi/2) = 1.
// -----------------------------------------------------------------------------
mprintf("--- 3. Test de Derivada Numérica (Orden 4) ---\n");
func_str = "sin(x)";
v = %pi / 2;
n = 4;
h = 0.1; // Paso grande para probar la robustez de numderivative

d4 = miDerivada(func_str, v, n, h);

mprintf("Función: sin(x), Derivada orden 4 en pi/2\n");
mprintf("Esperado (teórico): 1.0\n");
mprintf("Obtenido (miDerivada): %.10f\n", d4);

if abs(d4 - 1) < 1e-5 then
    mprintf("RESULTADO: PASÓ (Precisión aceptable para derivadas numéricas)\n");
else
    mprintf("RESULTADO: FALLÓ (Revisar generación de strings en miDerivada)\n");
end
mprintf("\n");

// -----------------------------------------------------------------------------
// 4. TEST DE TAYLOR
// Aproximar e^-2 usando Taylor de e^x centrado en 0 (Maclaurin)
// Ejercicio 6 del apunte.
// -----------------------------------------------------------------------------
mprintf("--- 4. Test de Taylor ---\n");
f_taylor = "%e^x";
center = 0;
target = -2;
order = 10; // Según ejercicio 6a
h = 0.1

aprox = miTaylor(f_taylor, center, order, target, h);
exacto = %e^(-2);
error_abs = abs(exacto - aprox);

mprintf("Aproximando e^-2 con Taylor orden 10\n");
mprintf("Valor real:     %.10f\n", exacto);
mprintf("Aproximación:   %.10f\n", aprox);
mprintf("Error Absoluto: %e\n", error_abs);

// Criterio del apunte: redondeo a 3 dígitos (0.135)
if abs(aprox - 0.135335) < 1e-3 then
    mprintf("RESULTADO: PASÓ (Converge correctamente)\n");
else
    mprintf("RESULTADO: DUDOSO (Verificar factorial o potencias)\n");
end

mprintf("\n=== FIN DEL TEST ===\n");
