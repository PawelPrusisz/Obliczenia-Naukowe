#Paweł Prusisz
include("./MyRoots.jl")
using .MyRoots
using Plots

ans = [(0.0, 0.0, 0, 0) for i in 1:3]

function f(x::Float64)
    return sin(x) - (x/2 * x/2)
end

function pf(x::Float64)
    return cos(x) - x/2 
end

delta = exp10(-5)/2
epsilon = delta = exp10(-5)/2
maxIt = 100

println("bisekcji: ", mbisekcji(f, 1.5, 2.0, delta, epsilon))
println("stycznych: ", mstycznych(f, pf, 1.5, delta, epsilon, maxIt))
println("siecznych: ", msiecznych(f, 1.0, 2.0, delta, epsilon, maxIt))

plot([-1.0:3.0], f, label = "sin(x) - 0.25*x^2")