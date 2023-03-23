
## Entregable 2

!!! warning "Entrega"
    Se debe entregar un archivo .ZIP llamado `Entregable_2` que contenga un archivo de Julia (`.jl`) por cada ejercicio `Ejercicio1.jl`, `Ejercicio2.jl`, etc. Fecha límite de entrega: Jueves 30 de marzo.
    
### 1. 

a) Crear dos matrices aleatorias $A$ y $B$ de tamaño 3x3 con números enteros del 1 al 10.
Luego sumarlas para producir una matriz $C$.

b) Crear dos matrices aleatorias $D$ y $E$ de tamaño 3x2 y 2x3 respectivamente, con números enteros del 1 al 10.
Luego multiplicarlas para producir una matriz $F$.

c) Crear una matriz aleatoria $G$ con de tamaño 3x4 con números enteros del 1 al 10. Calcular su matriz traspuesta $H$ utilizando la función `transpose` de Julia.


### 2. 

Escribir su propia funcion `transponer(A::Matrix{Int64})` que recibe una mariz de números enteros y devuelve la matriz transpuesta.
Corroborar con el resultado obtenido en la parte 1c.

### 3.

Se dan las coordenadas de los extremos (inferior izquierdo y superior derecho) de dos rectangulos en un plano.

Escribir una funcion `area(A, B, C, D)` tal que devuelve el area total cubierta por los dos rectangulos
definidos por `(A, B)` y `(C, D)` respectivamente.

Por ejemplo,

```julia
julia> area((-3, 0), (3, 4), (0, -1), (9, 2))
45
```


