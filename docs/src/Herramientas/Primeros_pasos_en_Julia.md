# Primeros pasos en Julia

A continuación se da una pantallazo de distintos aspectos del lenguaje desde un punto de vista puramente práctico: mediante varios ejemplos de código se busca dar una vision de qué se trata el lenguaje. En otras partes del curso se profundizará en los distintos aspectos aquí mencionados.


## Variables

## Vectores

## Matrices

## Cadenas de caracteres


## Diccionarios


## Funciones


## Control de flujo


Como aplicación de los conceptos vistos anteriormente, consideramos la implementación de una de las funciones más básicas de ordenamiento: el método de ordenamiento de burbuja (bubblesort).

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

!!! warning "Formato de entrga"
    El formato de entrega es análogo al utilizado en el primer entregable, ver [Ejercicio 1.2 Creación de un repositorio](https://mforets.github.io/computacion-cientifica-en-julia/dev/Herramientas/Entorno_de_desarrollo/#.2.-Creaci%C3%B3n-de-un-repositorio). En particular, todos los ejercicios entregados deben ser parte de un único módulo llamado `Entregable_2` que define la constante CI asi como tambien exporta las funciones que se piden en cada ejercicio entregado.

#### 2.1. Transcripción de ADN

El [ácido desoxirribonucleico](https://es.wikipedia.org/wiki/%C3%81cido_desoxirribonucleico), conocido comúnmente como ADN (ó DNA de sus sigla en inglés) es la molécula responsable de la transmisión de la información genética de todos los organismos vivos. Dicha información se codifica mediante una secuencia de nucleótidos, que pueden ser cuatro: adenina (A), citosina (C), guanina (G) y timina (T). Ver figura de la estructura química del ADN [aquí](https://en.wikipedia.org/wiki/File:DNA_chemical_structure.svg).

El primer paso para sintetizar proteinas consiste en *transcribir* la secuencia de ADN en una secuencia de [ácido ribonicleido](https://es.wikipedia.org/wiki/%C3%81cido_ribonucleico) (ARN o RNA por su sigla en inglés). Dicha operación consiste en reemplazar todas las instancias de timina por el uracil (U), asi como cambién invertir la secuencia de ADN dada.

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

Luego de la etapa de transcripción, el ARN se traduce en una secuencia de aminoácidos que se pueden plegar en una proteina. 
Un *codón* es una secuencia de tres nucleótidos que se traduce en un aminoácido de acuerdo a la tabla que se puede encontrar [aquí](https://en.wikipedia.org/wiki/File:Aminoacids_table.svg). Ciertos codones se llaman codones de terminación (macrados con un cuadrado negro en la tabla).

Escribir una función `traducir(::ARN)` que traduce una secuencia de ARN en una secuencia de aminoacidos. Si se encuentar un codón de terminación, la traducción debe terminar (sin incluir el codón de terminación).

Se utilizarán los siguientes structs:

```julia
struct Aminoacido
    dat::String
end
struct CadenaProteica
    dat::Vector{Aminoacido}
end
```

Ejemplos:

```julia
julia> traducir(ARN("CCU"))
CadenaProteica([Aminoacido("Pro")])

julia> traducir(ARN("AUGCCAAAGGGUUGA"))
CadenaProteica([Aminoacido("Met"), Aminoacido("Pro"), Aminoacido("Lys"), Aminoacido("Gly")])

julia> traducir(ARN("GCAAGAGAUAAUUGU"))
CadenaProteica([Aminoacido("Ala"), Aminoacido("Arg"), Aminoacido("Asp"), Aminoacido("Asn"), Aminoacido("Cys")])
```

#### 2.3. La aguja de Buffon

Considérese un modelo como el descrito en la figura, donde una aguja de largo L se tira sobre un plano marcado con dos rectas paralelas espaciadas una distancia $D$. Se asume que $L < D$. En su *Essai d’arithmetique morale* (1777), George Louis Leclerc, mejor conocido como el Compte de Buffon, 
mostró que la probabilidad de que la aguja intersecte una de las líneas es $\frac{2L}{\pi D}$.

Sean

```julia
abstract type Metodo end
struct Buffon <: Metodo end
```
Implementar una función `estimar_pi(::Buffon, n=1000)` que utiliza el método antes descrito para obtener una aproximación del número ``pi`` con ``n`` corridas aleatorias.




