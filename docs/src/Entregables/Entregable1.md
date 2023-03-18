## Entregable 1

!!! warning "Entrega"
    Se debe entregar un archivo .ZIP llamado `Entregable_1` que contenga un archivo de Julia (`.jl`) por cada ejercicio `Ejercicio1.jl`, `Ejercicio2.jl`, etc. Fecha límite de entrega: Jueves 23 de marzo.

#### 1.

Escribir un programa que imprima en pantalla:

- Los enteros de 1 hasta 100.
- Los multiplos de 2 entre 1 y 100.
- Los multiplos de 5 entre 1024 y 1200.

#### 2. 

Alberto vende cursos de programación online y los promociona con un gasto fijo de 200 usd en publicidad. Por cada alumno que compra un curso Alberto gana 12 usd. Escribir una función `f(x)` que modele los ingresos de alberto si `x` es la cantidad de alumnos que compran su curso.

#### 3.

Escribir un programa que dada una cadena de caracteres (`String`) imprima todas las combinaciones posibles de tres letras. Por ejemplo para la palabra "sol" el output seria:

```julia
julia> combinaciones("sol")
6-element Vector{String}:
 "sol"
 "slo"
 "osl"
 "ols"
 "lso"
 "los"
```

#### 4. 

Dado un angulo $\theta$ escribir su respectiva matriz de rotación (2x2). Calcular la imagen del vector `[1, 0]` cuando teta toma valores entre `[0, pi/2, pi, 1]`.

#### 5. 

Al comienzo de 2023 Juana deposita $C$ pesos en un banco con una taza de interés $r$ (entre $0$ y $1$).La capitalizacion es continua. Escribir una funcion $g(C,r,x)$ que modele el interés. ¿Si $C = 100000$ y $r = 0.05$, cuánto es el capital de Juana pasados 18 meses?
