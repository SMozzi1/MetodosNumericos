// --- CONFIGURACIÓN ---
eps = 1e-7; // Precisión alta

printf("\n====== TEST DE ESTRÉS: FALSA POSICIÓN (SIN LÍMITE DE ITERACIONES) ======\n\n");

// --- CASO 1: EL PASEO EN EL PARQUE ---
// Polinomio simple, cruce limpio.
deff('y=f1(x)', 'y=x^2 - 5'); // Raíz en sqrt(5) ≈ 2.236
printf("--- TEST 1: Normal (x^2 - 5) en [0, 5] ---\n");
try
    timer();
    r = falsa_posicion(f1, 0, 5, eps);
    t = timer();
    printf("resultado: %f | Tiempo: %f seg | Estado: ÉXITO\n", r, t);
catch
    printf("FALLÓ: %s\n", lasterror());
end
printf("\n");


// --- CASO 2: EL PUNTO DE ESTANCAMIENTO (La debilidad del método) ---
// x^10 - 1. La curva es muy plana en el centro y muy vertical en el borde.
// La Falsa Posición suele dejar un extremo fijo (el izquierdo en este caso)
// y avanza pasito a pasito.
deff('y=f2(x)', 'y=x^10 - 1');
printf("--- TEST 2: Convergencia Lenta (x^10 - 1) en [0, 1.3] ---\n");
printf("(Si esto tarda más de 1 segundo, es por la falta de maxIter)\n");
try
    timer();
    r = falsa_posicion(f2, 0, 1.3, eps);
    t = timer();
    printf("Resultado: %f | Tiempo: %f seg | Estado: ÉXITO (Pero notá si tardó más)\n", r, t);
catch
    printf("FALLÓ: %s\n", lasterror());
end
printf("\n");


// --- CASO 3: FUNCIÓN EXPONENCIAL ---
// e^x - 3*x.
deff('y=f3(x)', 'y=%e^x - 3*x');
printf("--- TEST 3: Trascendente (e^x - 3x) en [0, 1] ---\n");
try
    timer();
    r = falsa_posicion(f3, 0, 1, eps);
    t = timer();
    printf("Resultado: %f | Tiempo: %f seg | Estado: ÉXITO\n", r, t);
catch
    printf("FALLÓ: %s\n", lasterror());
end
printf("\n");


// --- CASO 4: EL ROMPE-CÓDIGO (Intervalo Inválido) ---
// Probamos que tu validación inicial funcione.
deff('y=f4(x)', 'y=x - 1');
printf("--- TEST 4: Intervalo Malo (Sin raíz) [2, 5] ---\n");
try
    r = falsa_posicion(f4, 2, 5, eps);
    printf("MAL: El código aceptó un intervalo sin cambio de signo.\n");
catch
    printf("BIEN: El código rechazó el intervalo -> %s\n", lasterror());
end
