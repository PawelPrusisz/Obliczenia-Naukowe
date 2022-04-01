#Pawel Prusisz
eps16 = Float16(1.0)
eps32 = Float32(1.0)
eps64 = Float64(1.0)

#1.1
println("1.1\n")
function f16(x)
    if Float16(1.0 + x) > Float16(1.0)
        return true
    else
        return false
    end
end

function f32(x)
    if Float32(1.0 + x) > Float32(1.0)
        return true
    else
        return false
    end
end

function f64(x)
    if Float64(1.0 + x) > Float64(1.0)
        return true
    else
        return false
    end
end

while eps16 != eps16/2
    if f16(eps16/2)
        global eps16 = eps16/2
    else
        break
    end
end

while eps32 != eps32/2
    if f32(eps32/2)
        global eps32 = eps32/2
    else
        break
    end
end

while eps64 != eps64/2
    if f64(eps64/2)
        global eps64 = eps64/2
    else
        break
    end
end

println("eps16: ", eps16, "\nesp(Float16): ", eps(Float16))
println("eps32: ", eps32, "\nesp(Float32): ", eps(Float32))
println("eps64: ", eps64, "\nesp(Float64): ", eps(Float64))

#1.2
println("\n1.2\n")
eta16 = Float16(1.0)
eta32 = Float32(1.0)
eta64 = Float64(1.0)

while eta16/2 > 0.0
    global eta16 = eta16/2
end

while eta32/2 > 0.0
    global eta32 = eta32/2
end

while eta64/2 > 0.0
    global eta64 = eta64/2
end

println("eta16: ", eta16, "\nnextfloat(Float16): ", nextfloat(Float16(0.0)))
println("eta32: ", eta32, "\nnextfloat(Float32): ", nextfloat(Float32(0.0)))
println("eta64: ", eta64, "\nnextfloat(Float64): ", nextfloat(Float64(0.0)))

#1.3
println("\n1.3\n")

max16 = Float16(1.0)
max32 = Float32(1.0)
max64 = Float64(1.0)

while !isinf(max16*2)
     global max16 = max16 * 2
end
m16 = max16/2
while !isinf(max16 + m16)
    global max16 = max16 + m16
    global m16 = m16 / 2
end

while !isinf(max32*2)
    global max32 = max32 * 2
end
m32 = max32/2
while !isinf(max32 + m32)
    global max32 = max32 + m32
    global m32 = m32 / 2
end

while !isinf(max64*2)
    global max64 = max64 * 2
end
m64 = max64/2
while !isinf(max64 + m64)
    global max64 = max64 + m64
    global m64 = m64 / 2
end

println("max16: ", max16, "\nfloatmax(Float16): ", floatmax(Float16))
println("max32: ", max32, "\nfloatmax(Float32): ", floatmax(Float32))
println("max64: ", max64, "\nfloatmax(Float64): ", floatmax(Float64))