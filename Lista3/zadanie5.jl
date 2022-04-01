#Paweł Prusisz
include("./MyRoots.jl")
using .MyRoots
using Plots

ans = [(0.0, 0.0, 0, 0) for i in 1:3]

function f1(x::Float64)
    return 3*x
end

function f2(x::Float64)
    return exp(x)
end

function f(x::Float64)
    return f1(x) - f2(x)
end



delta = exp10(-5)/2
epsilon = delta = exp10(-5)/2

println("[0,1] ", mbisekcji(f, 0.0, 1.0, delta, epsilon))
println("[1,2] ", mbisekcji(f, 1.0, 2.0, delta, epsilon))


pt = plot([-1.0:2.0], [f1, f2], label = ["3x" "e^x"])
pt2 = plot([-1.0:2.0], f, label = ["|3x - e^x|"])
savefig(pt, "zadanie5.png")
savefig(pt2, "zadanie5.2.png")