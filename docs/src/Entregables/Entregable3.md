## Entregable 3

!!! warning "Formato de entrega"

#### 1. Vector con entrada única

Construir un tipo que se llama `Vector1E` que representa un vector con un único elemento no nulo en dimension $n$. `Vector1E` debe admitir el siguiente constructor: `Vector1E(6, i=2, n=10)` donde `6` es el elemento, `i` es el indice y `n` la dimension. Es decir en este caso se representa `[0, 6, 0, 0, 0, 0, 0, 0, 0, 0]` de manera simbólica.

Se deben implementar (en todos los casos chequeando conformidad de dimensiones):

- La interfaz de iteración.
- La interfaz de vector abstracto.
- Negación (`-`).
- Aritmética (`+`, `-`) entre vectores densos y `Vector1E`, y también entre pares de `Vector1E`, que debe devolver un vector denso en cualquier caso.
- Operaciones entre matrices densas y `Vector1E`.
- Funciones de `LinearAlebra`: `norm`, `dot`.
- Imprimir `Vector1E` de manera compacta.

#### 2. Estructura de conjunto

Se requiere implementar un struct llamado `CustomSet` que debe comportarse como un [conjunto](https://es.wikipedia.org/wiki/Conjunto) en el sentido ordinario. Se definen a continuación una serie de tests que el struct debe pasar.

```julia
using Test

@test CustomSet([1, 2, 3, 1]) == CustomSet([1, 2, 3])
@test CustomSet([1, 2, 3]) ∩ CustomSet([1, 2]) == CustomSet([1, 2])
@test CustomSet([1, 2, 3]) ∪ CustomSet([5, 6]) == CustomSet([1, 2, 3, 5, 6])
@test 1 ∈ CustomSet([1, 2, 3])
@test -1 ∉ CustomSet([1, 2, 3])
@test length(CustomSet([1, 2, 3])) == 3
@test push!(CustomSet([1, 2, 3]), 5) == CustomSet([1, 2, 3, 5])
@test push!(CustomSet([1, 2, 3]), 1) == CustomSet([1, 2, 3])
@test hasmethod(iterate, Tuple{CustomSet})
@test sum(CustomSet([1, 2, 3])) == 6
```
