#Pawel Prusisz

x = nextfloat(Float64(1.0))

while ((1/x)*x) == 1
    global x = nextfloat(x)
end

println("x = ", x)
println("1/x * x = ", (1/x)*x)