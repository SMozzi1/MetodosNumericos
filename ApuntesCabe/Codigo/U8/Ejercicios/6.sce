// Ejercicio 6

function z = f(x,y)
         z= 1;
endfunction

function y = c(x)
    y = -sqrt(2*x-x^2)
endfunction

function y=d(x)
    y = sqrt(2*x-x^2)
endfunction

printf("Aproximacion de la integral:")
disp(intg_doble(f, 0, 2, c, d, 1000, 1000))
