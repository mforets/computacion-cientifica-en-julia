# Hoy: 27 de setiembre

# Viernes 30 de setiembre
#    - Federico Licandro
#    - Rodrigo Perdomo
#    - Daniel Gomez
#    - Juan Pedro Tarigo

# Martes 04 de octubre
#    - Federico Bliman
#    - Joaquin Viera
#    - Mauricio Vanzulli

# Confirmar inscripcion de Rodrigo Perdomo con Agustin Laguarda.


# Entregable 7:
# - Crear un git repo para el proyecto de cada uno.
# - El repo contendra un modulo de Julia "esqueleto" de lo que sera el proyecto.
# - Debera contener tambien un esqueleto de documentacion y de tests.
# - Si se identifican algunas dependencias, se sugieren agregar tambien.

# ] add <pagina-web>

# ] add <paquete>

# - Plot recipes.

struct Foo{A,B}
    x::A
    y::B
end

function foo(obj::Foo{A,B}) where {A,B}
    # ...
end

function foo(obj::Foo{Float64,B}) where {B}
    # ...
end

function foo(obj::Foo{Float64,Int64})
    # ...
end

struct Interval{N}
    a::N
    b::N
    function Interval(a::N, b::N) where {N}
        a ≤ b || throw(ArgumentError("The first argument should be smaller or equal than the second argument."))
        new{N}(a, b)
    end
end

Interval(1, 2)

Interval(1.0, 2.0)

Interval(1.0, 2)

Interval("chau", "hola")
