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

x = [0, 0.2, 0.4, 0.6];
y = [1.0, 1.2214, 1.4918, 1.8221];

polNew = interpolNewton(x,y);
res = horner(polNew, 1/3);
disp(res);


