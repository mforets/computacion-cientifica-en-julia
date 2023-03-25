# trabajar con structs, multiple dispatch

struct Complejo
    re::Float64
    im::Float64
end

z = Complejo(1.0, 2.0) # 1.0 + 2.0i

# Voy a extender la funcion Base.show de Julia para que trabaje con mi propia definicion de Complejo.
# En julia esta la funcion "show" y esta definida en el modulo Base de Julia.
# Para extender la funcion voy a poner Base.show(...) donde ... son los argumentos de la funcion.
# En el caso particular de Base.show lleva un argumento obligatorio que es `io::IO`.
# Base.show(io::IO, z::Complejo) = print(io, z.re, " + ", z.im, "i")

# mas verborragico
Base.show(io::IO, z::Complejo) = print(io, "Numero complejo con parte real ", z.re, " y parte imaginaria ", z.im)

z = Complejo(1.0, 2.0)

# "script"
function Base.:(+)(c1::Complejo, c2::Complejo)
    r = c1.re + c2.re
    i = c1.im + c2.im
    return Complejo(r, i)
end

z1 = Complejo(1.0, 2.0)
z2 = Complejo(3.0, 5.0)

z1 + z2

function Base.:(*)(c1::Complejo, c2::Complejo)
    r = c1.re * c2.re - c1.im * c2.im
    i = c1.re * c2.im + c1.im * c2.re
    return Complejo(r, i)
end

z1 * z2

# Como hago para que ande 1 + Complejo(2, 0) ?

function Base.:(+)(x::Int64, c::Complejo)
    Complejo(x, 0) + c
end

# Complejo(2, 0) + 4 ?
function Base.:(+)(c::Complejo, x::Int64)
    Complejo(x, 0) + c
end

# 1.0 + Complejo(2, 4)

# podriamos poner en vez de la definicion con Int64:
function Base.:(+)(x::Real, c::Complejo)
    Complejo(x, zero(x)) + c
end

# Para abrir el shell poner ;
# Para abrir el gestor de paquetes poner ]

# paginas para buscar paquetes
# https://juliahub.com/ui/Packages
# https://juliapackages.com/

# libreria para trabajar con figuras geometricas: LazySets.jl

# integracion numerica:
#  1- Euler
#  2- Runge-Kutta order 4
