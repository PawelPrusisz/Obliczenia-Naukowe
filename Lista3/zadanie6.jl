#Paweł Prusisz

include("./MyRoots.jl")
using .MyRoots
using Plots

function f1(x)
    return exp(1.0-x)-1
end

function fp1(x)
    return -exp(1.0-x)
end

function f2(x)
    return x*exp(-x)
end

function fp2(x)
    return -exp(-x)*(x-1)
end

delta = exp10(-5)
epsilon = delta = exp10(-5)
maxit = 100
n = 20
ans1 = [(0.0, 0.0, 0, 0) for i in 1:n]
ans2 = [(0.0, 0.0, 0, 0) for i in 1:n]
ans3 = [(0.0, 0.0, 0, 0) for i in 1:n]

#=
for i in 1:n
    ans1[i] = mbisekcji(f1, Float64((i-1)*-2), Float64(i*2), delta, epsilon)
end

for i in 1:n
    ans2[i] = mstycznych(f1, fp1, Float64(i), delta, epsilon, maxit)
end

for i in 1:n
    ans3[i] = msiecznych(f1, Float64(-i), Float64(i), delta, epsilon, maxit)
end
println()
for i in 1:n
    println("[", (i-1)*-2, ",", i*2 , "] ", ans1[i][1], " ", ans1[i][2], " ", ans1[i][3], " ", ans1[i][4])
end
println()
for i in 1:n
    println(i, " ", ans2[i][1], " ", ans2[i][2], " ", ans2[i][3], " ", ans2[i][4])
end
println()
for i in 1:n
    println(-i, ",", i, " ", ans3[i][1], " ", ans3[i][2], " ", ans3[i][3], " ", ans3[i][4])
end
println()
=#
println("\nmetoda bisekcji f1")
println("[0,2] ", mbisekcji(f1, 0.0, 2.0, delta, epsilon))
println("[-2,2] ", mbisekcji(f1, -2.0, 2.0, delta, epsilon))
println("[0.1,1.9] ", mbisekcji(f1, 0.1, 1.9, delta, epsilon))
println("[0.999,200] ", mbisekcji(f1, 0.999, 200.0, delta, epsilon))

println("\nmetoda bisekcji f2")
println("[-1,2] ", mbisekcji(f2, -1.0, 2.0, delta, epsilon))
println("[-2,2] ", mbisekcji(f2, -2.0, 2.0, delta, epsilon))
println("[-0.1,2.1] ", mbisekcji(f2, -0.1, 2.1, delta, epsilon))
println("[-0.001,200] ", mbisekcji(f2, -0.001, 200.0, delta, epsilon))
println("[-0.001,800] ", mbisekcji(f2, -0.001, 8000.0, delta, epsilon))

println("\nmetoda Newtona f1")
println("-1.0 ", mstycznych(f1, fp1, -1.0, delta, epsilon, maxit))
println("0.0 ", mstycznych(f1, fp1, 0.0, delta, epsilon, maxit))
println("1.0 ", mstycznych(f1, fp1, 1.0, delta, epsilon, maxit))
println("1.1 ", mstycznych(f1, fp1, 1.1, delta, epsilon, maxit))
println("2.0 ", mstycznych(f1, fp1, 2.0, delta, epsilon, maxit))
println("4.0 ", mstycznych(f1, fp1, 4.0, delta, epsilon, maxit))
println("8.0 ", mstycznych(f1, fp1, 8.0, delta, epsilon, maxit))
println("16.0 ", mstycznych(f1, fp1, 16.0, delta, epsilon, maxit))

println("\nmetoda Newtona f2")
println("-1.0 ", mstycznych(f2, fp2, -1.0, delta, epsilon, maxit))
println("0.0 ", mstycznych(f2, fp2, 0.0, delta, epsilon, maxit))
println("1.0 ", mstycznych(f2, fp2, 1.0, delta, epsilon, maxit))
println("1.1 ", mstycznych(f2, fp2, 1.1, delta, epsilon, maxit))
println("2.0 ", mstycznych(f2, fp2, 2.0, delta, epsilon, maxit))
println("4.0 ", mstycznych(f2, fp2, 4.0, delta, epsilon, maxit))
println("8.0 ", mstycznych(f2, fp2, 8.0, delta, epsilon, maxit))
println("16.0 ", mstycznych(f2, fp2, 16.0, delta, epsilon, maxit))

println("\nmetoda siecznych f1")
println("-2.0 2.0 ", msiecznych(f1, -2.0, 2.0, delta, epsilon, maxit))
println("0.0 2.0 ", msiecznych(f1, 0.0, 2.0, delta, epsilon, maxit))
println("-0.3 1.8 ", msiecznych(f1, -0.3, 1.8, delta, epsilon, maxit))

println("\nmetoda siecznych f2")
println("-2.0 2.0 ", msiecznych(f2, -2.0, 2.0, delta, epsilon, maxit))
println("0.0 2.0 ", msiecznych(f2, 0.0, 2.0, delta, epsilon, maxit))
println("-0.3 1.8 ", msiecznych(f2, -0.3, 1.8, delta, epsilon, maxit))

println()

p1 = plot([-2:5], f1, label = "e^(1-x)")
p2 = plot([-2:5], f2, label = "xe^-x")

savefig(p1, "zadanie6.1.png")
savefig(p2, "zadanie6.2.png")