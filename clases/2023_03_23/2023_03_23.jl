

function f(x)
    2x
end


f(1.0)

function g(x::Int64)
    2x
end

g(1.0)

### Ejemplo: ordenamiento de burbuja.

# Dada una lista de numeros (enteros) los queremos ordenar de menor a mayor.

# Ejemplo:

# Dado: x = [5, 2, 1]

# Sea i = 1,
#   Sea j = 2
#      [5, 2, 1] -> [2, 5, 1]
#   Sea j = 3
#      [2, 5, 1] -> [1, 5, 2]
# Sea i = 2
#    Sea j = 3
#      [1, 5, 2] -> [1, 2, 5]

# Otro ejemplo:

# x = [2, 3, 10, 1]

# Sea i = 1
#   Sea j = i + 1 = 2
#      [2, 3, 10, 1]
#   Sea j = i + 2 = 3
#      [2, 3, 10, 1]
#   Sea j = i + 3 = 4
#      [2, 3, 10, 1] -> [1, 3, 10, 2]
# Sea i = 2
#    Sea j = i + 1 = 3
#      [1, 3, 10, 2]
#    Sea j = i + 2 = 4
#      [1, 3, 10, 2] -> [1, 2, 10, 3]
# Sea i = 3
#    Sea j = i + 1 = 4
#      [1, 2, 10, 3] -> [1, 2, 3, 10]

"""
Recibe un vector de enteros y los devuelve de manera ordenada de menor a mayor.
Utiliza el algoritmo de ordenamiento de burbuja.

## Ejemplos

```julia
julia> ordenar([5, 2, 1])
3-element Vector{Int64}:
 1
 2
 5
```
"""
function ordenar(x::Vector{Int64})
    n = length(x)
    for i in 1:(n - 1)
        for j in (i + 1):n
            if x[j] < x[i]
                aux = x[i]
                x[i] = x[j]
                x[j] = aux
            end
        end
    end
    return x
end


# Correcta y eficiente.
sort(x)


using Plots

plot(1:10, rand(10))
plot!(1:10, rand(10))
plot!(1:10, rand(10))

# 1:100
# 
x = range(0, 2π, length = 100)

x = range(0, 2π, step = π / 2)
collect(x)

plot(x, sin.(x), linewidth = 3.0, color = :red, xlabel = "x", ylabel = "sin(x)", label = "")
plot!(x, cos.(x), linewidth = 3.0, color = :blue, xlabel = "x", ylabel = "sin(x)", label = "")

M = rand(2, 2)

## "Structs"

struct Complejo
    re::Float64
    im::Float64
end

c = Complejo(1.0, 2.0) # 1.0 + 2.0i
real(c) = c.re
imag(c) = c.im

# Como hago para que imprima 1.0 + 2.0i

c1 = Complejo(1.0, 2.0) # 1.0 + 2.0i
c2 = Complejo(0.0, 3.0) # 3.0i

c1 + c2

function Base.:(+)(c1::Complejo, c2::Complejo)
    r = real(c1) + real(c2)
    i = imag(c1) + imag(c2)
    return Complejo(r, i)
end

c1 + c2


c1 * c2

#####


function f(alumnos)
    alumnos
end
