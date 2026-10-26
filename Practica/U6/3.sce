// ejercicio 3

function ej3()
    A = [1 -1 0; -2 4 -2; 0 -1 1];
    n = 3;
    for k=0 : 10
        disp(k+1, "es el valor de la iteracion actual");
        A(3,3) = 1 + (0.1 * k);
        p = poly(A, 'x');
        autovals = roots(p);
        autovect = spec(A)
        disp(p, "polinomio caracteristico");
        disp(autovals, "raices del polinomio");
        disp(autovect, "autovectores de A");
    end
endfunction
ej3()
