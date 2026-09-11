// Funcion que dado un polinomio de grado dos calcula las raices.
function r = miRaices(p)
c = coeff(p,0);
b = coeff(p,1);
a = coeff(p,2);
disc = sqrt(b^2-4*a*c);

if b < 0 then
    r(1) = (2*c)/(-b + disc); // x-
    r(2) = (-b + disc)/(2*a); // x+
else 
    r(1) = (-b - disc)/(2*a); // x-
    r(2) = (2*c)/(-b - disc); // x+
end
endfunction

//-----------------------------------------------------------------------------

// Funcion que dado un polinomio y un punto, devuelve la evaluacion del
// polinomio en el punto y la evaluacion de la derivada del polinomio en ese
// punto
function [val, deriv] = miHorner(p, x0)
    n = degree(p);
    val = coeff(p, n); // bn = an
    if n == 0 then
        deriv = 0;
    else
        deriv = val; // Voy a aplicar el algorimo horner en q para obtener 
        // q(x0) y luego P'(x0)
    end

    for i=n-1:-1:0
        bi = coeff(p,i) + x0*val;
        val = bi;
        if i <> 0 then
            deriv = val + x0*deriv;
        end
    end
endfunction

//-----------------------------------------------------------------------------

// Funcion que dada f ley de una función dada por un string, que usa como 
// variable x, v un valor donde se evaluará la derivada, n es el orden de 
// derivación y h paso de derivación, devuelve la evaluacion de la derivada
// n-esima de f en el punto v.
function valor = miDerivada(f, v, n, h)
    deff("y=DF0(x)","y="+f);
    if n==0 then 
        valor = DF0(v);
    else
        for i=1:(n-1)
            deff("y=DF"+string(i)+"(x)","y = numderivative(DF"+string(i-1)+",x,"+string(h)+",4)");
        end
        deff("y=DFn(x)","y=numderivative(DF"+string(n-1)+",x,"+string(h)+",4)");
        valor = DFn(v);
    end
endfunction

// Derivada recursiva.
function v=miDerivadaRec(f, v, n, h)
    if n==0 then 
        deff("y=tempFunc(x)", "y="+f);
        v = tempFunc(v);
    else
        v = (miDerivadaRec(f, v+h, n-1, h) - miDerivadaRec(f, v-h, n-1, h)) / (2*h);
    end
endfunction

//-----------------------------------------------------------------------------

// Funcion que calcula el factorial de un numero.
function y = miFactorial(x)
    if x == 1 | x == 0 then
        y = 1;
    else
        y = x* miFactorial(x-1);
    end
endfunction

//-----------------------------------------------------------------------------

// Funcion que calcula el valor del polinomio de taylor de una funcion dada
// alrededor de un punto dado, con un orden dado.
// Para grandes ordenes es mejor colocar un paso h grande (0.1 por ejemplo)
function y = miTaylor(f, a, n, v, h)
    val = 0;
    for i = 0: n
        val = val + (miDerivadaRec(f, a, i, h) / miFactorial(i)) * ((v-a)**i);
    end
    y = val;
endfunction
