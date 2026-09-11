// --- CARGA TUS FUNCIONES PRIMERO --- 
// (Asegurate que 'secante' esté cargada en memoria)

// Configuración
eps = 1e-6;
maxIter = 100;

printf("\n====== TORTURA TEST: MÉTODO DE LA SECANTE ======\n\n");

// --- CASO 1: EL CLÁSICO (Debería andar joya) ---
printf("--- TEST 1: x^2 - 4 (Raíz en 2) ---\n");
deff('y=f1(x)', 'y=x^2-4');
try
    // Arrancamos cerca, todo normal
    r = secante(f1, 0, 3, eps, maxIter);
    printf("[SECANTE] ÉXITO. Raíz: %f\n", r);
catch
    printf("[SECANTE] FALLÓ en algo fácil. Revisar código.\n");
    printf("Error: %s\n", lasterror());
end
printf("\n");


// --- CASO 2: LA TRAMPA DE LA SIMETRÍA (Division por Cero) ---
// Este test DEBE fallar y activar tu 'if' de división por cero.
// Usamos x^2 y dos puntos simétricos: -2 y 2.
printf("--- TEST 2: Simetría Mortal (x^2 con x0=-2, x1=2) ---\n");
deff('y=f2(x)', 'y=x^2');
try
    r = secante(f2, -2, 2, eps, maxIter);
    printf("[SECANTE] MAL: Devolvió un valor (%f) cuando debería haber fallado por div 0.\n", r);
catch
    // Si entra acá, es que tu protección funcionó
    printf("[SECANTE] BIEN: Capturó el error -> %s\n", lasterror());
end
printf("\n");


// --- CASO 3: DIVERGENCIA (La Secante se vuelve loca) ---
// arctan(x) es famosa porque si elegís puntos muy lejos, la secante
// te manda cada vez más lejos del origen en lugar de acercarse.
printf("--- TEST 3: Divergencia con Arctan(x) ---\n");
deff('y=f3(x)', 'y=atan(x)');
// Puntos iniciales agresivos que suelen hacer diverger a la secante
try
    r = secante(f3, 3, 5, eps, 20); // Pocas iters para que corte rápido
    printf("[SECANTE] Convergió (Sorprendente): %f\n", r);
catch
    printf("[SECANTE] BIEN: Se detuvo por iteraciones (divergencia esperada) -> %s\n", lasterror());
end
printf("\n");


// --- CASO 4: FUNCIÓN PLANA (División por casi cero) ---
// x^10 cerca de 1. La curva es empinada, pero cerca de 0 es planísima.
// Probamos si la precisión numérica aguanta.
printf("--- TEST 4: x^10 - 1 (Raíz en 1) ---\n");
deff('y=f4(x)', 'y=x^10 - 1');
try
    r = secante(f4, 0, 1.5, eps, maxIter);
    printf("[SECANTE] ÉXITO: Raíz %f\n", r);
catch
    printf("[SECANTE] FALLO: Problema numérico o de iteraciones.\n");
    printf("Error: %s\n", lasterror());
end
