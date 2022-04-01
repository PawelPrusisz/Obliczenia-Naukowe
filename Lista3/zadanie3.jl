#Paweł Prusisz

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

function test1(x::Float64)
    return x*x - 2*x + 1
end

function test2(x::Float64)
    return sin(x) - (x/2 * x/2)
end

p =  exp10(-5)/2
ans = [(0.0, 0.0, 0, 0) for i in 1:10]

ans[1] = msiecznych(test2, 1.0, 2.0, p, p, 1000)


for i in 1:10
    println(i, " ", ans[i])
end

