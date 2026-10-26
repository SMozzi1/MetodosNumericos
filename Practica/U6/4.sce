function circ(r, x, y)
    plot2d(x, y ,0, rect=[x-r-1,y-r-1,x+r+1,y+r+1]);
    xarc(x-r,y+r, 2*r, 2*r,0, 360*64);
endfunction

function Gers(A)
    centros = diag(A);
    [nf,nc] = size(A);
    n = nc;
    radios = zeros(n,1);
    for i = 1: n
        radios = radios + abs(A(:,i))
    end
    radios = radios - abs(centros);
    for k = 1 : n
        circ(radios(k), centros(k), 0);
    end
endfunction

function CircGersValor(A)
    autovals = spec(A);
    Gers(A);
    plot2d(real(autovals), imag(autovals), -9);
endfunction

A = [1 -1; 2 -1];
CircGersValor(A);
