# Funciones

## Despacho múltiple


---

## Ejercicios

#### 5.1. Dibujo de grafos con el método del equilibrio

Existen diversas técnicas para dibujar [grafos](https://es.wikipedia.org/wiki/Grafo) de manera automática, es decir, dado un grafo $G = (V, E)$ donde $V$ es el conjunto de vértices y $E$ es el conjunto de aristas, determinar posiciones $(x_i, y_i)$ para cada $i = 1, \ldots, |V|$ de forma que el dibujo resultante muestre la simetría subyacente en el grafo. Entre ellas encontramos métodos basado en resortes (force-directed algorithms), que tienen las siguientes características generales:

- Cada nodo se asocia con un masa puntual.
- Cada arista se asocia con un resorte.

Mediante la asociación de las componentes del grafo con un sistema físico, se establece la posición final de los nodos como aquella que minimiza la energía total del sistema.

En este ejercicio se deberá implementar el algoritmo que se describe en el artículo de Kamada, Tomihisa, and Satoru Kawai, "An algorithm for drawing general undirected graphs." Information processing letters 31.1 (1989): 7-15.

La función `calcular_coordenadas(V, E)` debe aceptar un arreglo `V` que define el conjunto de nodos y `E` que define el conjunto de aristas, y debe devolver un vector de tuplas donde cada tupla corresponde a la coordenada `x` e `y` de cada nodo. Ejemplos de entrada son `V = 1:4`, `E = [(1, 2), (2, 3), (3, 4), (4, 1)]`, que define un cuadrado, y `V = 1:6`, `E = [(1, 2), (1, 5), (2, 5), (2, 4), (3, 4), (3, 6), (4, 6)]` según la Fig. 2 del artículo citado.
