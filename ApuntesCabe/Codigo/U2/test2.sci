mprintf("\n=== TEST SUITE V2: STRESS TEST ===\n\n");

// -----------------------------------------------------------------------------
// 1. TEST DE RAÍCES ROBUSTAS (CORREGIDO)
// -----------------------------------------------------------------------------
mprintf("--- 1. Raíces Robustas (Caso b > 0) ---\n");
K = 1e4;
p_robust2 = poly([1, K + 1/K, 1], "x", "coeff");

r_esperada1 = -K;
r_esperada2 = -1/K;

r_calc = miRaices(p_robust2);

mprintf("Polinomio: x^2 + %.4f x + 1 = 0\n", K + 1/K);
mprintf("Raíces Esperadas: %.4e  y  %.4e\n", r_esperada1, r_esperada2);
mprintf("Tus Raíces:       %.4e  y  %.4e\n", r_calc(1), r_calc(2));

// CORRECCIÓN: Forzamos ambos a columna con (:) para evitar el error row/col
v_calc_col = r_calc(:);
v_esp_col = [r_esperada1; r_esperada2]; // El ; crea columna, pero por las dudas...
v_esp_col = v_esp_col(:); 

// Ahora sí ordenamos y restamos (gsort por defecto ordena descendente)
v_calc_ord = gsort(v_calc_col);
v_esp_ord = gsort(v_esp_col);

err_r = max(abs(v_calc_ord - v_esp_ord));

if err_r < 1e-10 then
    mprintf("RESULTADO: PASÓ (Lógica robusta para b > 0 correcta)\n");
else
    mprintf("RESULTADO: FALLÓ (Error: %e)\n", err_r);
end
mprintf("\n");

// -----------------------------------------------------------------------------
// 2. TEST DE HORNER (Grado 4 con huecos)
// P(x) = x^4 - 2x^2 + 1  (Notar que no tiene x^3 ni x)
// Evaluado en x = 2
// P(2) = 16 - 8 + 1 = 9
// P'(x) = 4x^3 - 4x -> P'(2) = 32 - 8 = 24
// -----------------------------------------------------------------------------
mprintf("--- 2. Horner con Polinomio Incompleto ---\n");
// Coefs orden ascendente: 1, 0, -2, 0, 1
p_cuarta = poly([1, 0, -2, 0, 1], "x", "coeff");
x_eval = 2;

[h_val, h_der] = miHorner(p_cuarta, x_eval);

mprintf("P(x) = x^4 - 2x^2 + 1 en x=2\n");
mprintf("Esperado: Val=9, Deriv=24\n");
mprintf("Obtenido: Val=%.0f, Deriv=%.0f\n", h_val, h_der);

if abs(h_val - 9) < 1e-8 & abs(h_der - 24) < 1e-8 then
    mprintf("RESULTADO: PASÓ\n");
else
    mprintf("RESULTADO: FALLÓ\n");
end
mprintf("\n");

// -----------------------------------------------------------------------------
// 3. COMPARATIVA DERIVADAS: Numderivative vs Recursiva
// Función: f(x) = e^x en x=1, Orden 2
// Exacta: e^1 = 2.7182818...
// -----------------------------------------------------------------------------
mprintf("--- 3. Batalla de Derivadas (f(x)=e^x, x=1, n=2) ---\n");
f_str = "%e^x";
v_pt = 1;
n_ord = 2;
h_step = 0.01;

d_num = miDerivada(f_str, v_pt, n_ord, h_step);    // Usa numderivative
d_rec = miDerivadaRec(f_str, v_pt, n_ord, h_step); // Usa recursión manual

exacta = %e;
err_num = abs(d_num - exacta);
err_rec = abs(d_rec - exacta);

mprintf("Exacta:        %.10f\n", exacta);
mprintf("miDerivada:    %.10f (Error: %.2e)\n", d_num, err_num);
mprintf("miDerivadaRec: %.10f (Error: %.2e)\n", d_rec, err_rec);

if err_num < err_rec then
    mprintf("GANADOR: miDerivada (numderivative es más precisa)\n");
else
    mprintf("GANADOR: miDerivadaRec (sorprendentemente)\n");
end
mprintf("\n");

// -----------------------------------------------------------------------------
// 4. TEST DE TAYLOR (Logaritmo)
// Aproximar ln(1.2) usando Taylor centrado en 1
// Serie converge lento, buen test para tu función.
// -----------------------------------------------------------------------------
mprintf("--- 4. Taylor de Logaritmo ---\n");
f_log = "log(x)";
centro = 1;
objetivo = 1.2;
orden_taylor = 4; 
h_taylor = 0.01; // Paso grande para estabilidad en derivadas altas

taylor_val = miTaylor(f_log, centro, orden_taylor, objetivo, h_taylor);
real_val = log(objetivo);

mprintf("Aproximando ln(1.2) con orden %d\n", orden_taylor);
mprintf("Valor Real:   %.8f\n", real_val);
mprintf("Aproximación: %.8f\n", taylor_val);
mprintf("Error Abs:    %.2e\n", abs(taylor_val - real_val));

if abs(taylor_val - real_val) < 1e-4 then
    mprintf("RESULTADO: PASÓ (Aproximación decente)\n");
else
    mprintf("RESULTADO: OJO (Revisar h o fórmula)\n");
end

mprintf("\n=== FIN DE PRUEBAS ===\n");
