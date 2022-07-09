# Primeros pasos en Julia

A continuación se da una pantallazo de distintos aspectos del lenguaje desde un punto de vista puramente práctico: mediante varios ejemplos de código se busca dar una vision de qué se trata el lenguaje. En otras partes del curso se profundizará en los distintos aspectos aquí mencionados.


## Control de flujo


## Álgebra lineal


## Funciones


## Tipos y constructores


## Gestor de paquetes


## Referencias

- [The fast track to Julia](https://juliadocs.github.io/Julia-Cheat-Sheet)
- [Getting started with Julia / JuMP docs](https://jump.dev/JuMP.jl/stable/tutorials/getting_started/getting_started_with_julia/#Getting-started-with-Julia)

---

## Ejercicios

#### Ordenamiento de burbuja

En este ejercicio se trabajará con uno de los algoritmos de ordenamiento más sencillos, el [algoritmo de ordenamiento de burbuja](https://es.wikipedia.org/wiki/Ordenamiento_de_burbuja) (bubble sort).
    
(a) Primero, leer la descripción del algoritmo en el artículo de wikipedia o alguna otra fuente de interés. Se recomienda escribir el pseudo-código *a mano* antes de ponerse a programar.

(b) Implementar el algoritmo en Julia en una función que llamaremos `burbuja`.

(c) Generar una función que *verifica* que una lista de números naturales dada está bien ordenada y aplicar al algoritmo de la parte anterior con listas de números enteros generados de manera aleatoria.

(d) Graficar el costo (en términos de tiempo y en términos del número de operaciones de intercambio) en función del número de elementos para $n$ variando entre $10$ y $10^5$. Se sugiere utilizar una escala logarítmica y realizar promedios para cada valor de $n$.

(e) Comparar el resultado de la parte anterior con los valores esperados de forma teórica.

#### Complejos

En su forma polar, los números complejos se representan con un módulo $r \geq 0$ y un argumento o ángulo polar $\varphi \in [-\pi, \pi)$, defininiendo así a $z = re^{i\varphi}$ en el plano complejo (diagrama de Argand). 

(a) Supongamos que dada una lista $L := \{z_i\}_{i=1}^{n}$ de números complejos en su forma polar, se desea ordenarlos en forma creciente respecto de su argumento. Se pide modificar -- generalizar -- de forma mínima la implementación del Ejercicio 1 para que se pueda aprovechar en esta tarea. Como ejemplo se da la siguiente entrada:

```julia
struct Complejo r::Float64; φ::Float64 end

n = 10
r = rand(0:1e-2:1, n)
φ = rand(-pi:1e-2:pi, n)
L = [Complejo(ri, φi) for (ri, φi) in zip(r, φ)]
```

(b) Implementar la suma, el producto y el cociente entre numeros complejos. En el caso de cociente, se debe chequear que el denominador no es nulo y dar un mensaje de error en caso contrario.
