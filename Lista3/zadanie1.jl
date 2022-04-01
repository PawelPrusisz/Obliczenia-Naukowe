#Paweł Prusisz

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

function test1(x::Float64)
    return x + 2
end

function test2(x::Float64)
    return sin(x) - (x/2 * x/2)
end

p =  exp10(-5)/2
ans = [(0.0, 0.0, 0, 0) for i in 1:10]
ans[1] = mbisekcji(test1, -3.0, 3.0, p, p)
ans[2] = mbisekcji(test1, -1.999999999, 3.0, p, p)
ans[3] = mbisekcji(test1, -2.000000001, 3.0, p, p)
ans[4] = mbisekcji(test1, -1.0, 3.0, p, p)
ans[5] = mbisekcji(test2, 1.5, 3.0, p, p)

for i in 1:10
    println(i, " ", ans[i])
end