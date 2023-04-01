## Entregable 3

!!! warning "Entrega"
    Se debe entregar un archivo .ZIP llamado `Entregable_3` que contenga un archivo de Julia (`.jl`) por cada ejercicio `Ejercicio1.jl`, `Ejercicio2.jl`, etc. Fecha límite de entrega: Viernes 7 de marzo.

#### 1.

La traza de una mariz cuadrada de define como la suma de sus elementos diagonales. Implementar una funcion `traza` que calcula la traza de una matriz.

#### 2.

La norma matricial inducida por una `p`-norma ($1 \leq p \leq \infty`) en vectores, para el caso `p = 1`, adquiere la forma:

$$
\Vert A \Vert_1 = \max_{1 \leq j \leq n} \sum_{i=1}^n \vert a_{ij} \vert
$$

Implementar una funcion `norma1(A)` que implementa la formula anterior.

#### 3.

Generalizar el método desarrollado en clase para obtener una cota inferior del área interior de un polígono convexo. 
Sugerencia: para representar dicho polígono, utilizar `VPolygon` de LazySets.

#### 4.

Implementar un método para calcular el área de un polígono convexo que dé el resultado exacto.

Sugerencia: utilizar la fórmula del área de Gauss.

Comparar la estimación obtenida en el ejercicio 1 con el resultado exacto.

Suponiendo que las coordenadas del polígono son números racionales, ¿puede modificar su algoritmo para que el resultado del cálculo del área sea un número racional?
