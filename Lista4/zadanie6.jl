#Paweł Prusisz
include("./Interpolation.jl")
using .Interpolation

ga(x) = abs(x)
a = Float64(-1.0)
b = Float64(1.0)
rysujNnfx(ga, a, b, 5)
rysujNnfx(ga, a, b, 10)
rysujNnfx(ga, a, b, 15)


gb(x) = 1.0 / (1.0 + x^2)
a = Float64(-5.0)
b = Float64(5.0)
rysujNnfx(gb, a, b, 5)
rysujNnfx(gb, a, b, 10)
rysujNnfx(gb, a, b, 15)