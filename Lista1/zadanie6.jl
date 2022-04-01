#Pawel Prusisz

function f(x)
    sqrt(x*x + 1) - 1
end

function g(x)
    x*x / (sqrt(x*x + 1) + 1)
end

i = 1

while i <= 15
    x = Float64(ldexp(Float64(1.0), -3*i))
    println("i: ", i, "\nx: ", x)
    println("f: ", f(x))
    println("g: ", g(x), "\n------------------")
    
    global i += 1
end
