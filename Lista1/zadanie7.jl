

function d(h)
    ((sin(1.0 + h) + cos(3*(1.0 + h))) - (sin(1.0) + cos(3.0)) )/h
end

function f()
    cos(1.0) - 3.0*sin(3.0)
end
i = 0
println()
while i < 55
    h = ldexp(1.0, -i)
    #println(i, " h: ", h, " d'(x):", d(h), " f'(x)", f(), " d(x)-f'(x):", abs(d(h)-f()))
    print("(",i,",",abs(d(h)-f()),")")
    global i += 1
end

println()
println(ldexp(1.0, -28))
