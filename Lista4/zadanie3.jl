#Paweł Prusisz

#=
Dane:
    x – wektor długości n + 1 zawierający węzły x0, . . . , xn
        x[1]=x0,..., x[n+1]=xn
    fx – wektor długości n + 1 zawierający ilorazy różnicowe
        fx[1]=f [x0],
        fx[2]=f [x0, x1],..., fx[n]=f [x0, . . . , xn−1], fx[n+1]=f [x0, . . . , xn]
Wyniki:
    a – wektor długości n + 1 zawierający obliczone współczynniki postaci naturalnej
        a[1]=a0,
        a[2]=a1,..., a[n]=an−1, a[n+1]=an.
=#
function naturalna(x::Vector{Float64}, fx::Vector{Float64})
    len = length(x)
    a = [0 for i in 1:len]
    a[len] = fx[len]

    for i = len - 1:-1:1
        a[i] = fx[i] - a[i + 1] * x[i]

        for j = i + 1:len - 1
            a[j] = a[j] - a[j + 1] * x[i]
        end
    end

    return a
end