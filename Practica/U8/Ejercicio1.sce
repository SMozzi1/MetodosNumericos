// El metodo del trapecio utilizaun polinomio de lagrange de grado 2 para poder interpolar entre los puntos de la funcion y aproximar el area por medio de trapecios en lugar de rectangulos

function Tn = metodoTrapecioComp(x0,x1,n,f)
    //xj = zeros(1,n+1);
    //xj(1) = x0;
    //xj(n+2) = x1;
    xj = linspace(x0,x1,n+1); // long n+1;
    disp(xj);
    h = (x1-x0) / n;
    Tn = 1/2 * f(xj(1));
    for i = 2 : n do
        Tn = Tn + f(xj(i));
    end
    Tn = Tn + 1/2 * f(xj(n+1));
    Tn = h * Tn;
    
endfunction
f = deff("y = f(x)", "y = 1/x");
a = metodoTrapecioComp(1,3,4,f);
disp("Area aproximada 1a trapecio: ", a);
f = deff("y = f(x)", "y = sin(%pi * x)");
disp("valor integral scilab:", intg(1,3,f));
d = metodoTrapecioComp(0,1,8,f);
disp("Area aproximada 1d trapecio: ", d);
disp("valor integral scilab:", intg(0,1,f));
function Sn = MetodoSimpsonComp(x0,x1,n,f) // n par
    xj = linspace(x0,x1,n+1);
    h = (x1-x0) / n;
    Sn = f(x0);
    for i = 2 : n do
        if (modulo(i,2) == 0) then
            Sn = Sn + 4*f(xj(i));
        else
            Sn = Sn + 2*f(xj(i));
        end        
    end
    Sn =  (h/3) * (Sn + f(x1));
endfunction

f = deff("y = f(x)", "y = 1/x");
a = MetodoSimpsonComp(1,3,4,f);
disp("Area aproximada 1a Simpson: ", a);
disp("valor integral scilab:", intg(1,3,f));
f = deff("y = f(x)", "y = sin(%pi * x)");
d = MetodoSimpsonComp(0,1,8,f);
disp("Area aproximada 1d Simpson: ", d);
disp("valor integral scilab:", intg(0,1,f));

// ejercicio 4

deff("y = f(x)", "y = (x+1)^-1");
I = metodoTrapecioComp(0,1.5,10,f);
disp("Valor aproximacion trapecio", I);
I = MetodoSimpsonComp(0,1.5,10,f);
disp("Valor aproximacion simpson", I);
disp("Valor scilab", intg(0,1.5,f));

function TCn = metodoTrapecioCompExt(a,b,x0,x1,nx,ny,f)
    TCn = 0;
    xj = linspace(x0,x1,nx+1); // puntos a trabajar en x;
    yj = linspace(a,b,ny+1); // puntos a trabajar en y
    h_x = (x1-x0) / nx; // espaciado de los x
    h_y = (b-a) / ny; // espaciado de los y
    for j = 1 : ny + 1; // fijamos y para aproximar primero x
    
    // Metodo del trapecio para cada x con el y fijado
    Tn = 1/2 * f(xj(1),yj(j));
    for i = 2 : nx do
        Tn = Tn + f(xj(i),yj(j));
    end
    Tn = Tn + 1/2 * f(xj(nx+1),yj(j));
    Tn = h_x * Tn;
    
    // Luego de hallar el valor para un y fijado. Aproximamos sobre y.
        if(j == 1 || j == ny+1) then
            TCn = TCn + 1/2 * Tn;
        else
        TCn = (TCn + Tn);
        end
    end
    TCn = h_y*TCn;
endfunction

z = deff("g = f(x,y)", "g = sin(x + y)");

TCn = metodoTrapecioCompExt(0,2,0,1,2,2,z);
disp("Valor aproximacion bidimensional", TCn);

