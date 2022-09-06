#------------
## Preguntas 
#------------

# Un misterio
x = [1, 2, 3]

i = 1

# x[i +1] << ?
x[i + 1]

for i in 1:3
    x[i] += 1
end

# Usar JuliaFormatter
# .JuliaFormatter.toml
# Como activar format on save en VSCode. 

# Pregunta de structs
#---------------------

# Test Failed at 
# Expression:
# CustomSet([1, 2, 3, 1]) == CustomSet([1, 2, 3])
# Evaluated: CustomSet{Int64}([1, 2, 3]) == CustomSet{Int64}([1, 2, 3])
# ERROR: There was an error during testing 

[1, 2, 3] == [1, 2, 3]

# Paquete AutoHashEquals simplifica definir el ==
# @auto_hash_equals struct Foo
#    # ...
# end


# Pregunta de extender metodos
#------------------------------

a = [4, 5, 6]
firstindex(a)
first(a)

# Pirateria (piracy)
Base.first(x::Vector) = 42

first(a)

# import Base: foo
# foo(x::CustomSet) = ...

# es lo mismo que:
# Base.foo(x::CustomSet) = ...

# Leer: https://docs.julialang.org/en/v1/manual/faq/#What-is-the-difference-between-%22using%22-and-%22import%22?


# ------------------------------------------------------
# Mas ejemplos de definicion de structs / types
# ------------------------------------------------------

# https://docs.julialang.org/en/v1/manual/types/

function f(x::Int64)::Float64
    x + 1
end

f(1)

# es equivalente a
function f(x::Int64)
    convert(Float64, x + 1)
end

# Tipos compuestos / composite types
struct Foo
    bar
    baz::Int
    qux::Float64
end

t = Foo("ok", 1, 2.0)

typeof(t)

y = Foo("ok", 1.0, 2.0)

foo = fieldnames(Foo)
getfield(y, :bar)

y.baz = 4

w = Foo(y.bar, 4, y.qux)

using Accessors
w = @set y.bar = 4

struct Foo2
    baz::Int
    arr::Vector{Float64}
end

x = [1, 2.0]
z = Foo2(2, x)

push!(x, 5)
z.arr

z.baz += 1 # no

z.arr = [4.0, 5.0]

empty!(z.arr)
append!(z.arr, [4.0, 5.0])
z

# Truco para cambiar valores que no son mutable:

mutable struct MutableScalar{T}
    x::T
end

struct Foo3
    baz::MutableScalar{Int}
    arr::Vector{Float64}
end

z = Foo3(MutableScalar(1), [1.0, 2.0])

z.baz.x = 5

z

# ------------------------------------------------------
# Mutable types
# ------------------------------------------------------

mutable struct Bar
    baz
    qux::Float64
end

bar = Bar("Hello", 1.5);

# ------------------------------------------------------
# Parametric types / tipos parametricos
# ------------------------------------------------------

# Respuesta:
# - dispatch
# - generacion de codigo EFICIENTE

struct Point{T}
    x::T
    y::T
end

Point(1, 2)

Point("no", "yes")

#=
Generaliza todas estas definiciones:

struct Point
    x::Float64
    y::Float64
end

struct Point
    x::Int
    y::Int
end

struct Point
    x::String
    y::String
end

struct Point
    x::Foo
    y::Foo
end

....
=#

# si me intersa que T sea un numero
struct PointNumber{T<:Number}
    x::T
    y::T
end

PointNumber(1, 2)

PointNumber("ok", "no")

function PointNumber(x::T1, y::T2) where {T1,T2}
    T = promote_type(T1, T2)
    PointNumber(T(x), T(y))
end
PointNumber(1, 2.0)


# Ver promote_type

# Un ejemplo mas complejo:
# sacado de: https://github.com/JuliaReach/LazySets.jl/blob/master/src/Sets/Hyperrectangle.jl#L80
struct Hyperrectangle{N,VNC<:AbstractVector{N},VNR<:AbstractVector{N}}
    center::VNC
    radius::VNR

    # default constructor with length comparison & domain constraint for radius
    function Hyperrectangle(
        center::VNC,
        radius::VNR;
        check_bounds::Bool = true,
    ) where {N,VNC<:AbstractVector{N},VNR<:AbstractVector{N}}
        @assert length(center) == length(radius) "length of center and " * "radius must be equal"
        if check_bounds
            @assert all(v -> v >= zero(N), radius) "radius must not be negative"
        end
        return new{N,VNC,VNR}(center, radius)
    end
end

H = Hyperrectangle(zeros(2), ones(2))
typeof(H)

H = Hyperrectangle(zeros(100), ones(100))
typeof(H)

function f(::Hyperrectangle{N,Vector1E{N},Vector1E{N}}) where {N}
    # funcionalidad especifica
end

typeof([1.0, 2.0])

typeof([10, 20])

typeof(rand(2, 2))

typeof((1, 2, "ok"))

# v = Vector1E(...)

# x[i] = ...
