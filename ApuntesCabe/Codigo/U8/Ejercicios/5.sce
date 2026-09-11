// Ejercicio 5

function z = f(x, y)
    z = sin(x + y);
endfunction

function y = c(x)
    y = 0; 
endfunction

function y = d(x)
    y = 1; 
endfunction

printf("Aproximacion de la integral:")
disp(intg_doble(f, 0, 2, c, d, 2, 2))
