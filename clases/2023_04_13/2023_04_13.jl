# Vimos una intro rapida a git.

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

function transponer(A::Matrix{Int64})::Matrix{Int64}
    n, m = size(A)
    B = Matrix{Int64}(undef, m, n)

    for i in 1:m
        for j in 1:n
            B[i, j] = A[j, i]
        end
    end
    return B
end

using Test

@testset "Ejemplos" begin
    A = [1 2; 3 4]
    @test transponer(A) == [1 3; 2 4]
end

#=
Comentarios:

- Analizar la diferencia entre iterar primer por i y despues por j, o primero por j y despues por i.
- Se podria haber hecho `B = zeros(m, n)`. 
- Ya que estamos observar que existe `similar(A)`.
- Comentamos sobre el `@test`.
=#

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
