function val = derivateCociente (f, v, n, h)
    i = n
    deff('y = g0(x) ', 'y = f(x)');
    while i>0
        new = 'g' + string(n-i+1);
        old = 'g' + string(n-i);
        body = 'y = (' + old + '(x+' + string(h) + ') - ' + old + '(x))/' + string (h);
        deff('y = ' + new + '(x)', body);
        i = i -1;
    end
    n_derivate = 'g'+string(n);
    val = evstr(n_derivate + '(' + string(v) + ')');
endfunction
