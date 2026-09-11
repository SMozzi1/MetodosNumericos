// --- CARGAMOS TUS FUNCIONES (Asumiendo que ya están definidas en memoria) ---
// Si no, pegalas acá arriba.

// --- CONFIGURACIÓN GENERAL ---
eps = 1e-6;
maxIter = 100;
h = 1e-5;

printf("\n====== INICIANDO TESTING AGRESIVO ======\n\n");

// --- CASO 1: FUNCIONAMIENTO BÁSICO (HAPPY PATH) ---
printf("--- TEST 1: Polinomio simple x^2 - 4 (Raíz en 2) ---\n");
deff('y=f1(x)', 'y=x^2-4');
try
    r_newton = metodo_newton(f1, 6, eps, maxIter, h);
    printf("[NEWTON] Éxito. Raíz encontrada: %f\n", r_newton);
catch
    printf("[NEWTON] FALLÓ inesperadamente.\n");
end

try
    r_biseccion = biseccion(f1, 0, 5, eps);
    printf("[BISECCION] Éxito. Raíz encontrada: %f\n", r_biseccion);
catch
    printf("[BISECCION] FALLÓ inesperadamente.\n");
end
printf("\n");


// --- CASO 2: EL PUNTO CIEGO DE NEWTON (Derivada = 0) ---
// La función x^2 - 2 tiene derivada 2x. Si x0 = 0, la derivada es 0.
printf("--- TEST 2: Derivada nula (x^2 - 2 en x0=0) ---\n");
deff('y=f2(x)', 'y=x^2-2');
try
    r = metodo_newton(f2, 0, eps, maxIter, h);
    printf("[NEWTON] MAL: Debería haber fallado pero devolvió %f\n", r);
catch
    printf("[NEWTON] BIEN: Capturó el error -> %s\n", lasterror());
end
printf("\n");


// --- CASO 3: SIN RAÍZ REAL (Bucle infinito potencial) ---
// x^2 + 1 nunca toca el eje X. Newton debería iterar hasta morir.
// Bisección debería rechazar el intervalo porque signos son iguales.
printf("--- TEST 3: Función sin raíces reales (x^2 + 1) ---\n");
deff('y=f3(x)', 'y=x^2+1');

// Prueba Newton
try
    timer(); // Iniciamos cronómetro por si se cuelga
    r = metodo_newton(f3, 10, eps, maxIter, h);
    printf("[NEWTON] MAL: Inventó una raíz donde no hay: %f\n", r);
catch
    printf("[NEWTON] BIEN: Se detuvo por iteraciones -> %s\n", lasterror());
end

// Prueba Bisección (Intervalo [-5, 5])
try
    r = biseccion(f3, -5, 5, eps);
    printf("[BISECCION] MAL: Aceptó intervalo inválido.\n");
catch
    printf("[BISECCION] BIEN: Rechazó intervalo inválido -> %s\n", lasterror());
end
printf("\n");


// --- CASO 4: RAÍZ MÚLTIPLE / PLANA (El asesino de la precisión) ---
// (x-1)^4 tiene raíz en 1, pero es muy plana.
// Tu criterio DOBLE (step < eps Y func < eps) es muy estricto acá.
// A veces Newton converge lento y el step es chico pero f(x) todavía no.
printf("--- TEST 4: Función plana (x-1)^4 ---\n");
deff('y=f4(x)', 'y=(x-1)^4');
try
    r = metodo_newton(f4, 2, eps, maxIter, h);
    printf("[NEWTON] Convergió en %f (Raíz real: 1)\n", r);
    if abs(r-1) > 1e-3 then
        printf("         ¡OJO! La precisión es mala para ser Newton.\n");
    end
catch
    printf("[NEWTON] No convergió (posiblemente por el criterio doble estricto).\n");
end
printf("\n");


// --- CASO 5: EL ERROR DE BORDE DE BISECCIÓN ---
// ¿Qué pasa si uno de los extremos YA ES la raíz?
// f(x) = x. Intervalo [-1, 0]. f(0) = 0.
// Tu código hace: if f(a)*f(b) < 0.
// Si f(b)=0, entonces f(a)*f(b) es 0. 0 < 0 es FALSO.
printf("--- TEST 5: Raíz en el extremo del intervalo (Bisección) ---\n");
deff('y=f5(x)', 'y=x');
try
    r = biseccion(f5, -1, 0, eps);
    printf("[BISECCION] Éxito: Encontró la raíz en el borde: %f\n", r);
catch
    printf("[BISECCION] FALLO ESPERADO (Bug de lógica): Tu código rechaza si la raíz está en el borde.\n");
    printf("            Error devuelto: %s\n", lasterror());
end
