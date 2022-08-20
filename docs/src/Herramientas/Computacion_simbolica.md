# Computación simbólica

## Expresiones simbólicas

## Iteradores

## Diferenciación automática


---


## Entregable 5

!!! warning "Formato de entrega"
    El formato de entrega es análogo al utilizado en los entregables anteriores, ver [Ejercicio 1.2 Creación de un repositorio](https://mforets.github.io/computacion-cientifica-en-julia/dev/Herramientas/Entorno_de_desarrollo/#.2.-Creaci%C3%B3n-de-un-repositorio). En particular, todos los ejercicios entregados deben ser parte de un único módulo llamado `Entregable_5` que define la constante CI asi como también exporta las funciones que se piden en cada ejercicio entregado. **Importante:** Además debe incluir los archivos de proyecto (`Project.toml` y `Manifest.toml`) en su entrega. 

#### 5.1. Vector con entrada única

Construir un tipo que se llama `Vector1Ent` que representa un vector con un único elemento no nulo en dimension $n$. `Vector1Ent` debe admitir el siguiente constructor: `Vector1Ent(6, i=2, n=10)` donde `1` es el elemento, `i` es el indice y `n` la dimension. Es decir en este caso representamos `[0, 6, 0, 0, 0, 0, 0, 0, 0, 0]`.

Se debe implementar la interfaz de `AbstractVector{N}` prestando particular atencion a la eficiencia. Se deben tambien implementar metodos para realizar operaciones algebraicas entre pares de `Vector1Ent` asi como tambien entre arrays densos (resp. esparsos) y `Vector1Ent`. Se debe implementar ademas las siguientes funciones: `norm`, `inner`. 
Se debe tambien imprimir `Vector1Ent` de manera compacta.
