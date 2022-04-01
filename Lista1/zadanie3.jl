
x = Float64(1.0)
det = ldexp(1.0, -52)

println("1 -> 2")
println(bitstring(x))
println(bitstring(x+det))
println(bitstring(x+2*det))
println(bitstring(x+3*det))
println(bitstring(x+4*det))
println()

x = Float64(0.5)
det = ldexp(1.0, -53)

println("0.5 -> 1")
println(bitstring(x))
println(bitstring(x+det))
println(bitstring(x+2*det))
println(bitstring(x+3*det))
println(bitstring(x+4*det))
println()

x = Float64(2)
det = ldexp(1.0, -51)

println("2 -> 4")
println(bitstring(x))
println(bitstring(x+det))
println(bitstring(x+2*det))
println(bitstring(x+3*det))
println(bitstring(x+4*det))
println()