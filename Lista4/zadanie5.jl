#Paweł Prusisz
include("./Interpolation.jl")
using .Interpolation

fa(x) = exp.(x)
a = Float64(0.0)
b = Float64(1.0)
rysujNnfx(fa, a, b, 5)
rysujNnfx(fa, a, b, 10)
rysujNnfx(fa, a, b, 15)


fb(x) = (x^2) * sin.(x) 
a = Float64(-1.0)
b = Float64(1.0)
rysujNnfx(fb, a, b, 5)
rysujNnfx(fb, a, b, 10)
rysujNnfx(fb, a, b, 15)