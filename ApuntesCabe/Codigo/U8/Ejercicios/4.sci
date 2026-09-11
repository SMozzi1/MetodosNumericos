// Ejercicio 4

function y = f(x)
    y = 1 /(x + 1);
endfunction

a = 0;
b = 3/2;
n = 10;

printf("Valor de la integral aproximada por metodo del trapecio compuesto\n");
disp(trapecio_compuesto(f, a, b, n));

printf("Valor de la integral aproximada por metodo compuesto de Simpson\n");
disp(simpson_compuesto(f, a, b, n));
