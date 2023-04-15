# ==============================
# Entregable 2, Ejercicio 2
# ==============================

#=
Escribir su propia funcion `transponer(A::Matrix{Int64})` que recibe una matriz de números enteros y devuelve la matriz transpuesta.
Corroborar con el resultado obtenido en la parte 1c.
=#

# Que significa transponer una matriz?

# Def.: Dada A ∈ M(n, m) (queremos decir n filas y m columnas) su matriz transpuesta es B ∈ M(m, n) tal que:
#       B[i, j] = A[j, i] para todo i ∈ 1 .. m, j ∈ 1 .. n.

#=
Pseudo-codigo:

Sean n y m el numero de filas y de columnas de A respectivamente.
Sea B una matriz vacia de m filas y n columnas.

Para cada i de 1 a m
  Para cada j de 1 a n
    B[i, j] = A[j, i]

Devolver B
=#

# Implementacion en Julia.

# Analizar la diferencia entre iterar primero por i y despues por j, o primero por j y despues por i.

function transponer1(A::Matrix{Int64})::Matrix{Int64}
    n, m = size(A)
    B = Matrix{Int64}(undef, m, n)

    for i in 1:m
        for j in 1:n
            B[i, j] = A[j, i]
        end
    end
    return B
end

function transponer2(A::Matrix{Int64})::Matrix{Int64}
    n, m = size(A)
    B = Matrix{Int64}(undef, m, n)

    for j in 1:n
        for i in 1:m
            B[i, j] = A[j, i]
        end
    end
    return B
end


# Como medir el tiempo en Julia?

# 1) Macro @time . Ejecuta 1 sola vez y reporta el tiempo transcurrido
#    y tambien las alocaciones de memoria.

# 2) Usar @btime o @benchmark. Ejecuta muchas veces.

# ==============================
# Entregable 2, Ejercicio 3
# ==============================

#=
Se dan las coordenadas de los extremos (inferior izquierdo y superior derecho) de dos rectangulos en un plano.

Escribir una funcion `area(a, b, c, d)` tal que devuelve el area total cubierta por los dos rectangulos
definidos por `(a, b)` y `(c, d)` respectivamente.

Por ejemplo,

```julia
julia> area((-3, 0), (3, 4), (0, -1), (9, 2))
45
```
=#

"""
Representa un rectangulo en el plano alineado con los ejes coordenados.
"""
struct Rectangulo
    a::Tuple{Float64,Float64}
    b::Tuple{Float64,Float64}

    function Rectangulo(a::Tuple{Float64,Float64}, b::Tuple{Float64,Float64})
        if !(b[1] ≥ a[1] && b[2] ≥ a[2])
            throw(ArgumentError("Las coordenadas nos son válidas."))
        end
        new(a, b)
    end
end

function area(H::Rectangulo)::Float64
    a, b = H.a, H.b
    (b[1] - a[1]) * (b[2] - a[2])
end
function area(H::Nothing)::Float64
    0.0
end

function interseccion(H1::Rectangulo, H2::Rectangulo)::Union{Rectangulo,Nothing}
    a, b = H1.a, H1.b
    c, d = H2.a, H2.b

    # Intersecto absisas.
    res = _interseccion(a[1], b[1], c[1], d[1])
    if isnothing(res)
        return nothing
    else
        e1, f1 = res
    end

    # Intersecto ordenadas.
    res = _interseccion(a[2], b[2], c[2], d[2])
    if isnothing(res)
        return nothing
    else
        e2, f2 = res
    end

    return Rectangulo((e1, e2), (f1, f2))
end

function _interseccion(a1, b1, c1, d1)
    e1 = if a1 < c1 && c1 < b1
        c1
    elseif c1 < a1 && a1 < d1
        a1
    else
        return nothing
    end

    f1 = if c1 < b1 && b1 < d1
        b1
    elseif a1 < d1 && d1 < b1
        d1
    else
        return nothing
    end
    return (e1, f1)
end

function area(a::Tuple, b::Tuple, c::Tuple, d::Tuple)
    H1 = Rectangulo(a, b)
    @show H1
    H2 = Rectangulo(c, d)
    @show H2
    H3 = interseccion(H1, H2)
    return area(H1) + area(H2) - area(H3)
end

area((-3.0, 0.0), (3.0, 4.0), (0.0, -1.0), (9.0, 2.0))

# area((-3.0, 0.0), (3.0, 4.0), (0.0, -1.0), (9.0, 2.0))
# area((-3, 0), (3, 4), (0, -1), (9, 2))


# Comentario sobre throw(ArgumentError):
#=
struct Rectangulo2
    a::Tuple{Float64,Float64}
    b::Tuple{Float64,Float64}

    function Rectangulo2(a::Tuple{Float64,Float64}, b::Tuple{Float64,Float64})
        if !(b[1] ≥ a[1])
            throw(ArgumentError("Las coordenadas x no son válidas."))
        elseif !(b[2] ≥ a[2])
            throw(ArgumentError("Las coordenadas y nos son válidas."))
        end
        new(a, b)
    end
end
=#
