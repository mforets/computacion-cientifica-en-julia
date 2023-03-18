
## Entregable 2

!!! warning "Entrega"
    Se debe entregar un archivo .ZIP llamado `Entregable_2` que contenga un archivo de Julia (`.jl`) por cada ejercicio `Ejercicio1.jl`, `Ejercicio2.jl`, etc. Fecha límite de entrega: Jueves 30 de marzo.
    
#### 1. Áreas

Se dan las coordenadas de los extremos (inferior izquierdo y superior derecho) de dos rectangulos en un plano.

Escribir una funcion `area(A, B, C, D)` tal que devuelve el area total cubierta por los dos rectangulos
definidos por `(A, B)` y `(C, D)` respectivamente.

Por ejemplo,

```julia
julia> area((-3, 0), (3, 4), (0, -1), (9, 2))
45
```

### 2. Puntos

Realizar un demostración que ilustre de forma *gráfica* el siguiente enunciado:

Si se colocan 5 puntos en un cuadrado de lado 1, entonces siempre se cumple que existe por lo menos un par de puntos que están separados a lo sumo una distancia de 3/4.

Sugerencia: utilizar los paquetes [LazySets.jl](https://github.com/JuliaReach/LazySets.jl) y [Plots.jl](https://github.com/JuliaPlots/Plots.jl) para representar y graficar figuras geométricas respectivamente. 

