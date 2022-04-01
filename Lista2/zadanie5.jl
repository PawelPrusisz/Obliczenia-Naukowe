#Pawel Prusisz

p1 = Float32(0.01)
p2 = Float32(0.01)
p3 = Float64(0.01)

r = 3.0

for i in 1:40
    global p1 = Float32(p1 + Float32(r*p1)*Float32((1-p1)))
    global p2 = Float32(p2 + Float32(r*p2)*Float32((1-p2)))
    global p3 = p3 + r*p3*(1-p3)
    if i == 10
        p2 = Float32(0.722)
    end
    println(i, " ", p1, " ", p2, " ", p3)
end

typeof(p1)