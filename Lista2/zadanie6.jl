#Pawel Prusisz
using Plots
function iterate(c, x)
    A = [] 
    for i in 1:40
        x = x*x + c
        push!(A, x)
    end
    return A
end

A = [iterate(-2.0, 1.0),
     iterate(-2.0, 2.0),
     iterate(-2.0, 1.99999999999999),
     iterate(-1.0, 1.0),
     iterate(-1.0, -1.0),
     iterate(-1.0, 0.75),
     iterate(-1.0, 0.25)]
val = 1
for i in 1:40
    print(i, " ")
    for j in A
        print(j[i], " ")
    end
    println()
end
y = 1:40
println("\n\n")
for i in A
    plot(i, y)
end

plt1 = plot(y, A[1], title = "Eksperyment 1")
plt2 = plot(y, A[2], title = "Eksperyment 2")
plt3 = plot(y, A[3], title = "Eksperyment 3")
plt4 = plot(y, A[4], title = "Eksperyment 4")
plt5 = plot(y, A[5], title = "Eksperyment 5")
plt6 = plot(y, A[6], title = "Eksperyment 6")
plt7 = plot(y, A[7], title = "Eksperyment 7")

savefig(plt1, "plt1.png")
savefig(plt2, "plt2.png")
savefig(plt3, "plt3.png")
savefig(plt4, "plt4.png")
savefig(plt5, "plt5.png")
savefig(plt6, "plt6.png")
savefig(plt7, "plt7.png")