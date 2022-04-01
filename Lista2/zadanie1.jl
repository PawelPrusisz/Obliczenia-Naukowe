#Pawel Prusisz
x = [2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
y = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

function sum1(mode)
    i = 1
    ans = mode(0.0)
    while i < 6
        ans += convert(mode, x[i]*y[i])
        i +=  1
    end
    ans
end

function sum2(mode)
    i = 5
    ans = mode(0.0)
    while i > 0
        ans += convert(mode, x[i]*y[i])
        i -=  1
    end
    ans
end

function sum3(mode)
    z = [mode(0.0), mode(0.0), mode(0.0), mode(0.0), mode(0.0)]
    i = 1
    while i < 6
        z[i] = convert(mode, x[i]*y[i])
        i += 1
    end
    p = mode(0.0)
    n = mode(0.0)
    i = 1
    while i < 6
        if z[i] < 0.0
            n += z[i]
        end
        i += 1
    end

    i = 5
    while i > 0
        if z[i] > 0.0
            p += z[i]
        end
        i -= 1
    end
    p + n
end

function sum4(mode)
    z = [mode(0.0), mode(0.0), mode(0.0), mode(0.0), mode(0.0)]
    i = 1
    while i < 6
        z[i] = convert(mode, x[i]*y[i])
        i += 1
    end
    p = mode(0.0)
    n = mode(0.0)
    i = 1
    while i < 6
        if z[i] > 0.0
            n += z[i]
        end
        i += 1
    end

    i = 5
    while i > 0
        if z[i] < 0.0
            p += z[i]
        end
        i -= 1
    end
    p + n
end


println("a) f32 ", sum1(Float32))
println("a) f64 ", sum1(Float64))
println()
println("b) f32 ", sum2(Float32))
println("b) f64 ", sum2(Float64))
println()
println("c) f32 ", sum3(Float32))
println("c) f64 ", sum3(Float64))
println()
println("d) f32 ", sum4(Float32))
println("d) f64 ", sum4(Float64))
println()
