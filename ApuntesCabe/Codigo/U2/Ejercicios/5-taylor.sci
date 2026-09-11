function y = miExp(x)
    y = exp(x);
endfunction

// Derivadas-------------------------------------------------------------------

function v = miDerivada(f, vx, n, h)
    if n==0 then 
        v=f(vx)
    else 
        v=(miDerivada(f, vx+h, n-1,h)-miDerivada(f,vx-h, n-1,h))/(2*h)
    end
endfunction

function valor = derivadaNum(f,v,n,h)
    deff("y=DF0(x)","y="+f);
    if n==0 then valor = DF0(v);
    else
        for i=1:(n-1)
        deff("y=DF"+string(i)+"(x)","y=numderivative(DF"+string(i-1)+",x,"+string(h)+",4)");
        end
        deff("y=DFn(x)","y=numderivative(DF"+string(n-1)+",x,"+string(h)+",4)");
        valor = DFn(v);
    end
endfunction

// Factorial-------------------------------------------------------------------

function y = miFactorial(x)
    if x == 1 | x == 0 then
        y = 1;
    else
        y = x* miFactorial(x-1);
    end
endfunction

// Taylor----------------------------------------------------------------------

function y = taylor(f, a, n, v)
    val = 0;
    for i = 0: n
        val = val + (miDerivada(f, a, i, 10e-8) / miFactorial(i)) * ((v-a)**i);
    end
    y = val;
endfunction

function y = taylorNum(f, a, n, v)
    val = 0;
    for i = 0: n
        val = val + (derivadaNum(f, a, i, 10e-8) / miFactorial(i)) * ((v-a)**i);
    end
    y = val;
endfunction
