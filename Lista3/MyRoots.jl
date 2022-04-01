#Paweł Prusisz
module MyRoots
    export mbisekcji, mstycznych, msiecznych
    #=
    Dane:
        f – funkcja f(x) zadana jako anonimowa funkcja (ang. anonymous function)
        a,b – końce przedziału początkowego
        delta,epsilon – dokładności obliczeń,
    Wyniki:
        (r,v,it,err) – czwórka, gdzie
            r – przybliżenie pierwiastka równania f(x) = 0
            v – wartość f(r),
            it – liczba wykonanych iteracji
            err – sygnalizacja błędu
                0 - brak błędu
                1 - funkcja nie zmienia znaku w przedziale [a,b]
    =#
    function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
        r = Float64(0.0)
        v = Float64(0.0)
        it = 0
        err = 0

        fa = f(a)
        fb = f(b)

        if signbit(fa) == signbit(fb)
            err = 1
            return (r, v, it, err)
        end
        
        middle = b - a

        while middle > epsilon
            it = it + 1
            middle = middle/2

            r = a + middle
            v = f(r)

            if abs(middle) < delta || abs(v) < epsilon
                return (r, v, it, err)
            end

            if signbit(v) != signbit(fa)
                b = r
                fb = v
            else
                a = r
                fa = v
            end
        end
    end
    #=
    Dane:
        f, pf – funkcją f(x) oraz pochodną f'(x) zadane jako anonimowe funkcje
        x0 – przybliżenie początkowe
        delta,epsilon – dokładności obliczeń
        maxit – maksymalna dopuszczalna liczba iteracj
    Wyniki:
        (r,v,it,err) – czwórka, gdzie
            r – przybliżenie pierwiastka równania f(x) = 0,
            v – wartość f(r),
            it – liczba wykonanych iteracji,
            err – sygnalizacja błędu
                0 - metoda zbieżna
                1 - nie osiągnięto wymaganej dokładności w maxit iteracji,
                2 - pochodna bliska zeru
    =#
    function mstycznych(f,pf,x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
        r = Float64(0.0)
        v = Float64(0.0)
        it = 0
        err = 0

        r = x0
        v = f(r)

        if abs(pf(r)) < epsilon
            err = 2
            return (r, v, it, err)
        end

        while it < maxit
            it = it + 1
            x1 = r - v / pf(r)
            v = f(x1)

            if abs(x1-r) < delta || abs(v) < epsilon
                r = x1
                return (r, v, it, err)
            end
            r = x1
            
        end

        err = 1

        return (r, v, it, err)
    end
    #=
    Dane:
        f – funkcja f(x) zadana jako anonimowa funkcja
        x0,x1 – przybliżenia początkowe
        delta,epsilon – dokładności obliczeń
        maxit – maksymalna dopuszczalna liczba iteracji
    Wyniki:
        (r,v,it,err) – czwórka, gdzie
            r – przybliżenie pierwiastka równania f(x) = 0,
            v – wartość f(r),
            it – liczba wykonanych iteracji,
            err – sygnalizacja błędu
                0 - metoda zbieżna
                1 - nie osiągnięto wymaganej dokładności w maxit iteracji
    =#
    function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
        r = Float64(0.0)
        v = Float64(0.0)
        it = 0
        err = 0

        fx0 = f(x0)
        fx1 = f(x1)

        while it < maxit
            it = it + 1

            if abs(fx0) > abs(fx1)
                x0, x1 = x1, x0
                fx0, fx1 = fx1, fx0
            end

            s = (x1 - x0) / (fx1 - fx0)
            x1 = x0
            fx1 = fx0
            x0 -= fx0 * s 
            fx0 = f(x0)

            if abs(x1 - x0) < delta || abs(fx0) < epsilon
                r = x0
                v = fx0
                return(r, v, it, err)
            end

        end

        err = 1
        r = x0
        v = f_x0
        return(r, v, it, err)

    end


end