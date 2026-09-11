// ---------------------------------------------------------
// DEFINICIÓN DE MÉTODOS NUMÉRICOS (Ejercicio 2 y 3)
// ---------------------------------------------------------

function y=trapecio_compuesto(f, a, b, n)
    // Método del trapecio compuesto
     h = (b - a) / n;
     y = (1/2) * f(a) + (1/2) * f(b);
     for j = 1:n-1
         y = y + f(a + h*j);
     end
     y = h * y;
endfunction

function y=simpson_compuesto(f, a, b, n)
    // Método de Simpson compuesto (n debe ser par)
     if modulo(n, 2) <> 0 then
        error("Simpson requiere n par.");
     end
     h = (b - a) / n;
     y = f(a) + 4 * f(a + h) + f(b);
     for j = 2:2:n-1
         y = y + 2* f(a + h*j) + 4* f(a + h*(j + 1));
     end
     y = (h / 3) * y;
endfunction

// ---------------------------------------------------------
// DEFINICIÓN DE FUNCIONES A INTEGRAR
// ---------------------------------------------------------

// a) Integral de 1/x en [1, 3]
function y=func_a(x)
    y = 1/x;
endfunction

// b) Integral de x^3 en [0, 2]
function y=func_b(x)
    y = x^3;
endfunction

// c) Integral de x(1+x^2)^(1/2) en [0, 3]
function y=func_c(x)
    y = x * sqrt(1 + x^2);
endfunction

// d) Integral de sin(pi*x) en [0, 1]
function y=func_d(x)
    y = sin(%pi * x);
endfunction

// e) Integral de x*sin(x) en [0, 2pi]
function y=func_e(x)
    y = x * sin(x);
endfunction

// f) Integral de x^2*e^x en [0, 1]
function y=func_f(x)
    y = (x^2) * exp(x);
endfunction

// ---------------------------------------------------------
// CÁLCULOS Y COMPARACIONES
// ---------------------------------------------------------

// --- Integral A ---
// n=4 [cite: 11]
nTrapA = 4;
aproxA_Trap = trapecio_compuesto(func_a, 1, 3, nTrapA);
aproxA_Simp = simpson_compuesto(func_a, 1, 3, nTrapA);
exactA = intg(1, 3, func_a);

// --- Integral B ---
// n=4 [cite: 12]
nTrapB = 4;
aproxB_Trap = trapecio_compuesto(func_b, 0, 2, nTrapB);
aproxB_Simp = simpson_compuesto(func_b, 0, 2, nTrapB);
exactB = intg(0, 2, func_b);

// --- Integral C ---
// n=6 [cite: 13]
nTrapC = 6;
aproxC_Trap = trapecio_compuesto(func_c, 0, 3, nTrapC);
aproxC_Simp = simpson_compuesto(func_c, 0, 3, nTrapC);
exactC = intg(0, 3, func_c);

// --- Integral D ---
// n=8 [cite: 14]
nTrapD = 8;
aproxD_Trap = trapecio_compuesto(func_d, 0, 1, nTrapD);
aproxD_Simp = simpson_compuesto(func_d, 0, 1, nTrapD);
exactD = intg(0, 1, func_d);

// --- Integral E ---
// n=8 [cite: 16]
nTrapE = 8;
aproxE_Trap = trapecio_compuesto(func_e, 0, 2*%pi, nTrapE);
aproxE_Simp = simpson_compuesto(func_e, 0, 2*%pi, nTrapE);
// Para funciones oscilatorias a veces intg necesita tolerancias, 
// pero en este rango simple suele funcionar bien.
exactE = intg(0, 2*%pi, func_e); 

// --- Integral F ---
// n=8 [cite: 18]
nTrapF = 8;
aproxF_Trap = trapecio_compuesto(func_f, 0, 1, nTrapF);
aproxF_Simp = simpson_compuesto(func_f, 0, 1, nTrapF);
exactF = intg(0, 1, func_f);

// ---------------------------------------------------------
// MOSTRAR RESULTADOS
// ---------------------------------------------------------

disp("--- Resultados Integrales Compuestas (Ej 2 y 3) ---");

disp("Integral a) 1/x [1,3], n=4");
printf("Trapecio: %.6f | Simpson: %.6f | Exacto: %.6f\n\n", aproxA_Trap, aproxA_Simp, exactA);

disp("Integral b) x^3 [0,2], n=4");
printf("Trapecio: %.6f | Simpson: %.6f | Exacto: %.6f\n\n", aproxB_Trap, aproxB_Simp, exactB);

disp("Integral c) x*sqrt(1+x^2) [0,3], n=6");
printf("Trapecio: %.6f | Simpson: %.6f | Exacto: %.6f\n\n", aproxC_Trap, aproxC_Simp, exactC);

disp("Integral d) sin(pi*x) [0,1], n=8");
printf("Trapecio: %.6f | Simpson: %.6f | Exacto: %.6f\n\n", aproxD_Trap, aproxD_Simp, exactD);

disp("Integral e) x*sin(x) [0,2pi], n=8");
printf("Trapecio: %.6f | Simpson: %.6f | Exacto: %.6f\n\n", aproxE_Trap, aproxE_Simp, exactE);

disp("Integral f) x^2*e^x [0,1], n=8");
printf("Trapecio: %.6f | Simpson: %.6f | Exacto: %.6f\n\n", aproxF_Trap, aproxF_Simp, exactF);
