function y = LK(x,k)
    [xn,xm] = size(x);
    r = [x(1:k-1) ,x(k+1:xm)];
    p = poly(r,"x","roots");
    pk = horner(p,x(k));
    y = p/pk;
endfunction

function z = interpolLagrange(x,y)
    [xn,xm] = size(x);
    pol = 0;
    for k=1:xm
        pol = pol + (LK(x,k)*(y(k)));
    end
    z = pol;
endfunction

function tablaD = Dk(x,y)
    [n,m] = size(x);
    tablaD = zeros(m,m);
    tablaD(:,1) = y;
    disp(x(1));
    for i=2 : m
        for j = i : m
            tablaD(j,i)= (tablaD(j,i-1) - tablaD(j-1,i-1)) / (x(j)-x(j-i+1))
        end
    end
endfunction

function z= interpolNewton(x,y)
    tabla = Dk(x,y);
    disp("tabla");
    disp(tabla);
    D = diag(tabla)
    [n,m] = size(D) 
    pol = D(n);
    for i= n-1:-1:1
        pol1= poly(x(i),"x","roots") // (x-x_i)
        pol = pol * pol1 + D(i)
    end
    z= pol
endfunction

function [p,r] = polCheby(n)
    //r = zeros(n+1)
    cheb = zeros(n+1,1)
    cheb(1) = 1
    cheb(2) = poly([0,1],"x","coeff")
    disp("policheby2",cheb(2))
    for i=3:n+1
        cheb(i)= 2 * cheb(2) *cheb(i-1) - cheb(i-2);
    end
    p= cheb(n+1)
    r = roots(p)
    disp("polinomio de cheby",p)
endfunction

function xt = Tl(x,a,b)
    [n,m] = size(x)
    xt=zeros(1,m)
    for i=1:m
        xt(i) = ((b+a) + x(i)*(b-a))/2;
    end
endfunction

x = [0, 0.2, 0.4, 0.6];
y = [1.0, 1.2214, 1.4918, 1.8221];

polNew = interpolNewton(x,y);
res = horner(polNew, 1/3);
disp(res);

// calculo del error 
phi = poly(x, "x", "roots");
n = 3;
err = abs((1/factorial(n+1))* horner(phi, 1/3) * exp(0.6));
disp("Error aproximado de exp a la 1/3", err);
disp("Error exacto de exp a la 1/3", abs(1.395612425 - res))

// ejercicio 4
// p punto sobre el que evaluamos
// x lista de nodos sobre los que interpolamos
// cot cota de |f^(n)|

function w = calcErr(p,x,cot)
    n = length(x);
    w = cot / factorial(n);
    for i = 1 : n
        w = w*abs(p-x(i));
    end
endfunction



//ejercicio 4
x = [2.0 2.1 2.3 2.4 2.5];
y = [0.2239 0.1666 0.1104 0.0555 0.0025 -0.0484];

disp("error de 2.15", calcErr(2.15, x, 1));
disp("error de 2.35", calcErr(2.35, x, 1));

//ejercicio 5
/*
sabemos que p_i,j,.. coincide en f para los puntos xi, xj,...
*/
x = [1,2,3];
// y = [3,3,k];

L1 = LK(x,1);
L2 = LK(x,2);
L3 = LK(x,3);

c1 = horner(L1, 2.5);
c2 = horner(L2, 2.5);
c3 = (3 - c1 - c2) / horner(L3, 2.5);

x = [0,1,2,3];
y = [0,3,3,c3];

pol = interpolLagrange(x,y);
disp("valor buscado", horner(pol, 2.5));

// ejercicio 6
// notamos que nos dan la diagonal Di por lo tanto usamos el metodo ya implementado

function z= interpolNewtonDiag(x,D)
    [n,m] = size(D) 
    pol = D(m);
    for i= m-1:-1:1
        pol1= poly(x(i),"x","roots") // (x-x_i)
        pol = pol * pol1 + D(i)
    end
    z= pol
endfunction
/*
x = [-1 1 2 4];
D = [2 1 -2 2];
pol =  interpolNewtonDiag(x,D);
disp("polinomio calculado", pol);
disp("f en 0", horner(pol, 0));

//Ejercicio 9 (chat);

xx = linspace(-5, 5, 500);
f_xx = 1 ./ (1 + xx.^2);

grados = [2, 4, 6, 10, 14];
colores = ["b-", "g-", "r-", "m-", "k-"]; // Azul, verde, rojo, magenta y negro

clf();
for k = 1:length(grados)
    n = grados(k);
    xn = linspace(-5, 5, n + 1);
    yn = 1 ./ (1 + xn.^2);
    
    pn_x = interpolNewton(xn, yn);
    pn_xx = horner(pn_x,xx);
    plot(xx, f_xx - pn_xx, colores(k), "LineWidth", 1.5);
end

xgrid();
title("Error de interpolación f(x) - P_n(x) en [-5, 5]");
xlabel("x");
ylabel("Error");
legend(["n=2", "n=4", "n=6", "n=10", "n=14"]);
*/
//Ejercicio 10
[p,x] = polCheby(4)

y=zeros(4,1)

for i=1:4
    y(i) = exp(x(i))
end

pol = interpolNewton(x',y)

xn = linspace(-1,1,500)
y1 = horner(pol,xn)
y2 = exp(xn)

//plot(xn,y2 -y1)


//ejercicio 11

[p,x] = polCheby(4)

xt = Tl(x',0,%pi /2);
disp("xt",xt)
yt= zeros(1,4)

for i=1:4
    yt(i) = cos(xt(i))
end

pol = interpolNewton(xt,yt)
disp(pol)











