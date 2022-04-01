using LinearAlgebra

function matcond(n::Int, c::Float64)
# Function generates a random square matrix A of size n with
# a given condition number c.
# Inputs:
#	n: size of matrix A, n>1
#	c: condition of matrix A, c>= 1.0
#
# Usage: matcond(10, 100.0)
#
# Pawel Zielinski
        if n < 2
         error("size n should be > 1")
        end
        if c< 1.0
         error("condition number  c of a matrix  should be >= 1.0")
        end
        (U,S,V)=svd(rand(n,n))
        return U*diagm(0 =>[LinRange(1.0,c,n);])*V'
end

function hilb(n::Int)
    # Function generates the Hilbert matrix  A of size n,
    #  A (i, j) = 1 / (i + j - 1)
    # Inputs:
    #	n: size of matrix A, n>=1
    #
    #
    # Usage: hilb(10)
    #
    # Pawel Zielinski
            if n < 1
             error("size n should be >= 1")
            end
            return [1 / (i + j - 1) for i in 1:n, j in 1:n]
end
#Pawel Prusisz
#a)
n = 20
println("a)\n----------------------")
for i in 2:n
    A = hilb(i);
    x = [1 for j in 1:i] 
    b = A*x
    println(i, " ", cond(A), " ", norm(x -  inv(A)*b)/norm(x), " ", norm(x - A\b)/norm(x))
    println()
    
end
println("----------------------")
#b)
println("b)\n----------------------")

N = [5, 10, 20]
C = [1, 10, 1e3, 1e7, 1e12, 1e16]
for i in N
    for c in C
        A = matcond(i, c)
        x = [1 for j in 1:i]
        b = A*x
        println(i, " ", c, " ", norm(x -  inv(A)*b)/norm(x), " ", norm(x - A\b)/norm(x))
        println()
        #println(i, " ", c)
        #println("inv(A)*b: ", inv(A)*b)
        #println("A\\b: ", A\b)
    end
end


println("----------------------")