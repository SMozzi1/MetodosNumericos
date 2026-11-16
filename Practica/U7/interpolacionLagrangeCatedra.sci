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

x1 = [-2, -1,0,1,2];
y1 = [4,-1,0,-1,4];

interpolLagrange(x1,y1);


// ejercicio 5

x = [1 2 3];
L1 = LK(x,1);
L2 = LK(x,2);
L3 = LK(x,3);

c1 = horner(L1,2.5)*3;
c2 = horner(L2,2.5)*3;
c3 = horner(L3,2.5);
k = (3-c1-c2) / c3;

xx = [0 1 2 3];
yy = [1 3 3 k];
pl = interpolLagrange(xx,yy);
res = horner(pl,2.5);
