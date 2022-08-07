# Primeros pasos en Julia

A continuación se da una pantallazo de distintos aspectos del lenguaje desde un punto de vista puramente práctico: mediante varios ejemplos de código se busca dar una vision de qué se trata el lenguaje. En otras partes del curso se profundizará en los distintos aspectos aquí mencionados.


## Variables

## Control de flujo

## Vectores y matrices

## Más álgebra lineal

## Funciones

## Multiple dispatch


## Gestor de paquetes


## Gráficos


## Referencias

- [The fast track to Julia](https://juliadocs.github.io/Julia-Cheat-Sheet)
- [Getting started with Julia / JuMP docs](https://jump.dev/JuMP.jl/stable/tutorials/getting_started/getting_started_with_julia/#Getting-started-with-Julia)
- [julia-mit Tutorial notebook](https://github.com/mitmath/julia-mit/blob/master/Tutorial.ipynb)
- [Introduction to Julia by Jose Storopoli (JuliaCon 2022)](https://www.youtube.com/watch?v=uiQpwMQZBTA)
- [An Introduction to Julia by Jane Herriman](https://www.youtube.com/watch?v=8h8rQyEpiZA)
 
---

## Ejercicios

#### 2.1. Transcripción de ADN

El ácido desoxirribonucleico, conocido comúnmente como ADN (ó DNA de sus sigla en inglés) es la molécula responsable de la transmisión de la información genética de todos los organismos vivos. Dicha información se codifica mediante una secuencia de nucleótidos, que pueden ser cuatro: adenina (A), citosina (C), guanina (G) y timina (T).

El primer paso para sintetizar proteinas consiste en *transcribir* la secuencia de ADN en una secuencia de ácido ribonicleido (ARN o RNA por su sigla en inglés). Dicha operación consiste en reemplazar todas las instancias de timina por el uracil (U), asi como cambién invertir la secuencia de ADN dada.

Se consideran los siguientes struct:

```julia
struct ADN
    dat::String
end
struct ARN
    dat::String
end
```
Suponiendo que el campo de datos (`dat`) codifica al ADN como una secuencia de caracteres "A", "C", "G" y "T", escribir una funcion `transcribir(seq::ADN)` que devuelve la cadena `RNA` correspondiente.

Por ejemplo,

```julia
julia> transcribir(ADN("CCTAGGACCAGGTT"))
ARN("UUGGACCAGGAUCC")
```

#### 2.2. Traducción de ARN

#### 2.3. La aguja de Buffon






