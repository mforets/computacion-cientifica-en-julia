## Comentarios adicionales sobre arrays

x = [1, 2, 3]

x = Vector{Int}()

push!(x, 1)
push!(x, 123)
x
for i in 1:2:10
    push!(x, i)
end


struct Ropa
    talle::Int
    color::String
end

R = Vector{Ropa}()

# agrego elementos al final
push!(R, Ropa(36, "naranja"))
push!(R, Ropa(38, "rojo"))


y = [1, 2, 3]

function sumar_uno!(x::Vector)
    x .+= 1
end
function sumar_uno(x::Vector)
    sumar_uno!(copy(x))
end

# otra forma de hacer x .+= 1
for i in eachindex(x)
    x[i] += 1
end

f(y)
y[1]


x = [1, 2, 3]
y = x
y[1] = 100
x[1]

x = 1
y = x
y = 2
x

x = Ropa(20, "rojo")

mutable struct Ropa2
    talle::Int
    color::String
end
R = Ropa2(20, "rojo")
P = R
P.talle = 10
R

R.talle = 30

R


R = Ropa(20, "rojo")
R.talle = 30

x = Vector{Int}(undef, 3)
x[1] = 10
x

zeros(4)

zeros(2, 2)

M = zeros(2, 2, 2)
M[1, 2, 1] = 20.0

ones(2, 2)

x = Vector{Float64}(undef, 10)

# generar un vector de 10 elementos, todos ellos 5
fill(5, 10)

M = Matrix{Float64}(undef, 2, 2)

struct str
    dat::String
end
aux = str("hola")
aux2 = str("hola2")
z = Vector{Any}(undef, 3)
z[1] = aux
z[2] = aux

z = Vector{Any}()
push!(z, aux)

# z[1:2] .= aux

z[1:2] .= (aux, aux)

# mejor:
z = Vector{Any}(undef, 3)
z[1:2] .= Ref(aux)
z

## Bubblesort

# if
# while
# for

# [2, 3, 10, 1]
x = [2, 3, 10, 1]
function bubblesort!(x)
    n = length(x)
    for i in 1:(n - 1) # tambien se puede usar = o ∈
        for j in (i + 1):n
            if x[i] > x[j]
                a = x[i]
                x[i] = x[j]
                x[j] = a
            end
        end
    end
    x
end

bubblesort(x) = bubblesort!(copy(x))

# observar que sort y sort! funcionan de manera analoga

x = [2, 3, 10, 1]
bubblesort(x)
x

x = [2, 3, 10, 1]
bubblesort!(x)
x
# idea: usar tupla
# x[i], x[j] = x[j], x[i]

x = [1, 2, 3] # mutable
typeof(x)

y = (1, 2, 3)
typeof(y)

# ] add Plots

plot(1:10, rand(10))

x = range(0, 2π, length = 100)
p = plot(x, sin.(x), linewidth = 3.0, color = :red, xlabel = "x", ylabel = "y")
plot!(p, x, cos.(x), color = :blue, lw = 3.0)

savefig(p, "ejemplo.png")

## Integracion por el metodo de Euler

## Integracion por el metodo de Runge-Kutta

## k-bandit problem (reinforcement learning)

# maquina con k palancas
# tengo N jugadas

# cada vez que juego obtengo una recompensa, dicho valor
# esta dado por una distribucion normal (mu_i, sigma_i)
# i = 1, ..., k

# objetivo: maximizar la recompensa

# explorar vs explotar (utilizar)

# ----------------------------------------  y = D
#
#   \
#    \
# ----------------------------------------  y = 0
