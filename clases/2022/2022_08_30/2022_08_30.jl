# ----
# Cronograma:

# Clases del 13 y del 16 de setiembre
# No hay clase!

# Entregable 4 >> 31/08

# Entregable 5 >> 07/09

# Entregable 6 >> despues del corte

# Defensa de Propuesta de proyecto:
# **Martes 20 de setiembre**
# Entre 10 y 15 minutos max por persona.

# ----

abstract type Algoritmo end

struct A <: Algoritmo end

struct B <: Algoritmo end

f(x::A) = 1
f(x::B) = 2

f(A())

# Problema:

function g(x::Algoritmo = A())
    "ok"
end

function g(x::Algoritmo = B())
    "chau"
end


function h(x::Algoritmo = B())
    h(x)
end
function h(x::A)
    1
end
function h(x::B)
    2
end

function h(x::Algoritmo = B())
    if typeof(x) isa ...
    else
        ...
    end...
end


reachable_set(f::Function, ::RK4, t0, T, X0::Box)::Box


struct Rectangulo
    c::Vector{Float64}
    r::Vector{Float64}
end

Rectangulo([1.0, 1.0], [0.5, 0.8])

#=
struct Box
    c::Vector{Float64}
    r::Float64
end
Box([1.0, 1.0], 0.5)
=#

# -------------------------------
# Sugerencia para el ejercicio:
# -------------------------------
struct Box
    c::Vector{Float64}
    r::Vector{Float64}
end
centro(B::Box) = B.c
radio(B::Box) = B.r

function Box(c::Vector{Float64}, r::Float64)
    Box(c, fill(r, length(c)))
end
function Box(c::Vector{Float64}, r::Vector{Int64})
    Box(c, 2.0 .* r)
end

Box([1.0, 1.0], 0.5)

Box([1.0, 1.0], [0.5, 0.8])

function vertices(B::Box)
    @assert dim(B) == 2 "only implementred for dim = 2"
    # ...
end

a = [[1.1, 1.2]]
b = [[1.5, 1.5], [1.5, 0.5]]

vcat(a, b)

#-

puntos = [rand(2) for _ in 1:10]

using Plots

#=
fig = plot()
for p in puntos
    plot!(fig, ....)
end
fig
=#

# --


A = ones(4, 4)

using LinearAlgebra

D = Diagonal([1, 10, 100])

struct Diagonal2{T} <: AbstractMatrix{T}
    diag::Vector{T}
end
# Que tengo que implementar para la interfaz de array?
# https://docs.julialang.org/en/v1/manual/interfaces/#man-interface-array
D = Diagonal2([1.0, 2.0]);

function Base.size(D::Diagonal2)
    n = length(D.diag)
    (n, n)
end

#=
function Base.getindex(D::Diagonal2, i::Int)

end
=#

function f(A::AbstractMatrix)
    sum(A) - 100
end
