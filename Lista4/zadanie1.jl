#Paweł Prusisz

#=
Dane:
    x – wektor długości n + 1 zawierający węzły x0, . . . , xn
        x[1]=x0,..., x[n+1]=xn
    f – wektor długości n + 1 zawierający wartości interpolowanej
        funkcji w węzłach f (x0), . . . , f (xn)
Wyniki:
    fx – wektor długości n + 1 zawierający obliczone ilorazy różnicowe
        fx[1]=f [x0],
        fx[2]=f [x0, x1],..., fx[n]=f [x0, . . . , xn−1], fx[n+1]=f [x0, . . . , xn]
=#
function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
    len = length(f)
    fx = [f[i] for i in 1:len]

    for i in 1:len
        fx[i] = f[i]
    end

    for i = 2:len
        for j = len:-1:i
            fx[j] = (fx[j] - fx[j - 1]) / (x[j] - x[j - i + 1])
        end
    end

    return fx
end