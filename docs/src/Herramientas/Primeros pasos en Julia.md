# Primeros pasos en Julia

A continuación se da una pantallazo de distintos aspectos del lenguaje desde un punto de vista puramente práctico: mediante varios ejemplos de código se busca dar una vision de qué se trata el lenguaje. En otras partes del curso se profundizará en los distintos aspectos aquí mencionados.

Esta sección está basada en [The fast track to Julia](https://juliadocs.github.io/Julia-Cheat-Sheet) y en [Getting started with Julia / JuMP docs](https://jump.dev/JuMP.jl/stable/tutorials/getting_started/getting_started_with_julia/#Getting-started-with-Julia).

## Control de flujo


## Arreglos por comprensión


## Funciones


## Objetos mutables e inmutables



## Gestor de paquetes



## Ejercicios

1. **Ordenamiento de burbuja.** En este ejercicio se trabajará con uno de los algoritmos de ordenamiento más sencillos, el [algoritmo de ordenamiento de burbuja](https://es.wikipedia.org/wiki/Ordenamiento_de_burbuja) (bubble sort).
    
    a. Primero, leer la descripción del algoritmo en el artículo de wikipedia o alguna otra fuente de interés. Se recomienda escribir el pseudo-código *a mano* antes de ponerse a programar.

    b. Implementar el algoritmo en Julia en una función que llamaremos `burbuja`.
    
    c. Generar una función que *verifica* que una lista de números naturales dada está bien ordenada y aplicar al algoritmo de la parte anterior con listas de números enteros generados de manera aleatoria.
    
    d. Graficar el costo (en términos de tiempo y en términos del número de operaciones de intercambio) en función del número de elementos para $n$ variando entre $10$ y $10^5$. Se sugiere utilizar una escala logarítmica y realizar promedios para cada valor de $n$.
    
    e. Comparar el resultado de la parte anterior con los valores esperados de forma teórica.

2. **Complejos.** En su forma polar, los números complejos se representan con un módulo $r \geq 0$ y un argumento o ángulo polar $\varphi \in [-\pi, \pi)$, defininiendo así a $z = re^{i\varphi}$ en el plano complejo (diagrama de Argand). 

    a. Supongamos que dada una lista $L := \{z_i\}_{i=1}^{n}$ de números complejos en su forma polar, se desea ordenarlos en forma creciente respecto de su argumento. Se pide modificar -- generalizar -- de forma mínima la implementación del Ejercicio 1 para que se pueda aprovechar en esta tarea. Como ejemplo se da la siguiente entrada:


    ```julia
    struct Complejo r::Float64; φ::Float64 end
    
    n = 10
    r = rand(0:1e-2:1, n)
    φ = rand(-pi:1e-2:pi, n)
    L = [Complejo(ri, φi) for (ri, φi) in zip(r, φ)]
    ```

    b. Implementar la suma, el producto y el cociente entre numeros complejos. En el caso de cociente, se debe chequear que el denominador no es nulo y dar un mensaje de error en caso contrario.

3. **Polinomios.** Consideremos el polinomio univariado $P_k \in \mathbb{R}[x]$ dado por 

$$
P_k(x) := \sum_{k=0}^n \dfrac{x^k}{k!} = 1 + x + \frac{x^2}{2!} + \ldots + \frac{x^k}{k!}.
$$

a. Implementar una funcion `evaluar(x)` que evalua el polinomio $P_k$ en el valor $x$.

b. ¿Cuantas multiplicaciones y cuantas divisiones utilizó en la parte anterior, para un valor de $k$ dado? Chequear (o revisar la implementación si no se verifica) que no se utilizan más de $2k$ multiplicaciones ni más de $k$ divisiones.

c. Implementar la evaluación utilizando el [algoritmo de Horner](https://es.wikipedia.org/wiki/Algoritmo_de_Horner). Revisar el resultado de la parte anterior con el nuevo algoritmo.  
