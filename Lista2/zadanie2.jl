using Plots

Plots.PlotlyBackend()
f(x) = exp(x)*log(1+exp(-x))
g(x) = log(1+exp(-x))
plot(f, 32, 40)

for i in 30:40
    println(i, " ", log(1+exp(-i)))
end