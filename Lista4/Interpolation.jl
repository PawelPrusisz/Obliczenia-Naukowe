#Paweł Prusisz
module Interpolation

    include("./zadanie1.jl")
    include("./zadanie2.jl")
    include("./zadanie3.jl")
    include("./zadanie4.jl")

    using PyPlot

    export ilorazyRoznicowe, warNewton, naturalna, rysujNnfx  
end