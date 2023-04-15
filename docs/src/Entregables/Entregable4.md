## Entregable 4

!!! warning "Entrega"
    Se debe entregar un archivo .ZIP llamado `Entregable_4` que contenga un archivo de Julia (`.jl`) por cada ejercicio `Ejercicio1.jl`, `Ejercicio2.jl`, etc. Fecha límite de entrega: Viernes 21 de abril.


#### 1.

Determinar si un tablero de sudoku de 9x9 es válido. El tablero no tiener por qué estar completo, para lo cual se utilizan entradas
`missing`. El tablero se representa como una `Matrix{Union{Missing, Int64}}`.

Las reglas para determinar la validez del tablero son:

- Cada fila debe contener los digitos de 1 a 9 sin repetición.
- Cada columna debe contener los dígitos de 1 a 9 sin repetición.
- Cada uno de las 3 x 3 bloques debe contener los dígitos de 1 a 9 sin repetición.
- Las entradas `missing` se ignoran.
 
Implementar `valido(tablero::Matrix{Union{Missing, Int64}})::Bool` de acuerdo a las reglas anteriores.

### 2.

Dada una matriz 2D de tamaño $n \times n$ que podría representar una imagen, implementar una función `rotar!` que *rota* la matriz 90º en sentido horario. 

Por ejemplo, dada la entrada 

```julia
[1 2 3; 4 5 6; 7 8 9]
```

el algoritmo debe producir la salida:
```
[7 4 1; 8 5 2; 9 6 3]
```

LLamar a dicha funcion `rotar(x:Matrix{Int64})::Matrix{Int64}`.

### 3.

Revisar el algoritmo del ejercicio 2, implementando un algoritmo que opere en el sitio, es decir que no cree ninguna matriz auxiliar,
sino que opere sobre la misma matriz de entrada. LLamar a dichar funcion `rotar!(x:Matrix{Int64})::Matrix{Int64}`.

### 4.

Se adaptará el algoritmo desarrollado en el problema 2 (o 3) para rotar una imagen de verdad.
Para ello, obtener una imagen cualquiera (puede ser desde el celular), cargarla y rotarla.
El resultado del ejercicio es entonces implementar un nuevo metodo `rotar(path::String)::String` que recibe el path de una imagen, la rota, y la guarda
en un archivo del mismo nombre que `path` pero agregando `_rotada`.

Código de ejemplo:

```julia
# Cargar una imagen de disco en memoria.
using Images, FileIO

path = "imagen.png"
img = load(path)

# Visualizar la imagen.
using ImageView
imshow(img)

# Aplicar operaciones.
# ...

# Guardar la imagen.
save("resultado.png", img)
```
