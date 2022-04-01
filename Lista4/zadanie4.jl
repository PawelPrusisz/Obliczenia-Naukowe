#Paweł Prusisz

#=
Dane:
    f – funkcja f (x) zadana jako anonimowa funkcja,
    a,b – przedział interpolacji
    n – stopień wielomianu interpolacyjnego
Wyniki:
      – funkcja rysuje wielomian interpolacyjny i interpolowaną
        funkcję w przedziale [a, b]
=#
function rysujNnfx(f, a::Float64, b::Float64, n::Int)
    x = [0.0 for i in 1:n+1]
    
    y = [0.0 for i in 1:n+1]
    f_x = [0.0 for i in 1:n+1]

    max_nodes = n + 1
    
    h = (b - a) / n
    kh = Float64(0.0)

    mult = 20

    size = mult * max_nodes

    plot_args = [0.0 for i in 1:size]
    plot_val = [0.0 for i in 1:size]
    plot_ip = [0.0 for i in 1:size]

    for i = 1:max_nodes
        x[i] = a + kh
        y[i] = f(x[i])
        kh += h
    end

    f_x = ilorazyRoznicowe(x, y)

    kh = Float64(0.0)
    max_nodes *= mult
    h = (b - a) / (max_nodes - 1)

    for i = 1:max_nodes
        plot_args[i] = a + kh
        plot_ip[i] = warNewton(x, f_x, plot_args[i])
        plot_val[i] = f(plot_args[i])
        kh += h
    end

    filename = string("plot_", f, "_", n, ".png")
    clf()
    plot(plot_args, plot_val, label="f(x)", linewidth=1.0)
    plot(plot_args, plot_ip, label="w(x)", linewidth=1.0)
    grid(true)
    legend(loc=2,borderaxespad=0)
    title(string("Interpolation: n = ", n))
    savefig(filename)
end