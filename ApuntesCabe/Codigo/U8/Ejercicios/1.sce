// Ejercicio 1

// Funciones de cada integral:

function y = a(x)
    y = log(x);
endfunction

function y = b(x)
    y = x**(1/3);
endfunction

function y = c(x)
    y = sin(x)**2;
endfunction

// Aproximaciones

aproxATrap = trapecio(a, 1, 2);
aproxBTrap = trapecio(b, 0, 0.1);
aproxCTrap = trapecio(c, 0, %pi / 3);

aproxASimp = simpson(a, 1, 2);
aproxBSimp = simpson(b, 0, 0.1);
aproxCSimp = simpson(c, 0, %pi / 3);

// Valores exactos

exactA = intg(1, 2, a);
exactB = intg(0, 0.1, b);
exactC = intg(0, %pi / 3, c);

disp("Integral a: Aproximacion por regla del trapecio:");
disp(aproxATrap);
disp("Aproximacion por regla de Simpson:");
disp(aproxASimp);
disp("Valor exacto:");
disp(exactA);

disp("Integral b: Aproximacion por regla del trapecio:");
disp(aproxBTrap);
disp("Aproximacion por regla de Simpson:");
disp(aproxBSimp);
disp("Valor exacto:");
disp(exactB);

disp("Integral c: Aproximacion por regla del trapecio:");
disp(aproxCTrap);
disp("Aproximacion por regla de Simpson:");
disp(aproxCSimp);
disp("Valor exacto:");
disp(exactC);
