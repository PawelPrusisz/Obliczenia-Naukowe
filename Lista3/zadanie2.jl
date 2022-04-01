#Paweł Prusisz

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


function test1(x::Float64)
    return x*x - 2*x + 1
end

function test1p(x::Float64)
    return 2*x - 2
end

function test2(x::Float64)
    return sin(x) - (x/2 * x/2)
end

function test2p(x::Float64)
    return cos(x) - x/2 
end
p =  exp10(-5)/2
ans = [(0.0, 0.0, 0, 0) for i in 1:10]
ans[1] = mstycznych(test1, test1p, 0.0, p, p, 1000)
ans[2] = mstycznych(test1, test1p, 0.0, p, p, 10)
ans[3] = mstycznych(test1, test1p, 0.0, p, p, 1)
ans[4] = mstycznych(test1, test1p, 1000.0, p, p, 1000)
ans[5] = mstycznych(test2, test2p, 1.5, p, p, 1000)
ans[6] = mstycznych(test2, test2p, 1.5, p, p, 3)

for i in 1:10
    println(i, " ", ans[i])
end