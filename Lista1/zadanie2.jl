#Pawel Prusisz
eps16 = Float16(3(Float16(4/3)-1)-1)
eps32 = Float32(3(Float32(4/3)-1)-1)
eps64 = Float64(3(Float64(4/3)-1)-1)


println("eps16: ", eps16, " actual: ", eps(Float16))
println("eps32: ", eps32, " actual: ", eps(Float32))
println("eps64: ", eps64, " actual: ", eps(Float64))


