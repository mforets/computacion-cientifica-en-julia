# Computación numérica

## Aritmética de punto flotante

## Iteración de punto fijo

## Aritmética de intervalos

## Aplicaciones

---

## Ejercicios

#### Polinomios

Consideremos el polinomio univariado $P_k \in \mathbb{R}[x]$ dado por 

```math
P_k(x) := \sum_{k=0}^n \dfrac{x^k}{k!} = 1 + x + \frac{x^2}{2!} + \ldots + \frac{x^k}{k!}.
```

(a) Implementar una funcion `evaluar(x)` que evalua el polinomio $P_k$ en el valor $x$.

(b) ¿Cuantas multiplicaciones y cuantas divisiones utilizó en la parte anterior, para un valor de $k$ dado? Chequear (o revisar la implementación si no se verifica) que no se utilizan más de $2k$ multiplicaciones ni más de $k$ divisiones.

(c) Implementar la evaluación utilizando el [algoritmo de Horner](https://es.wikipedia.org/wiki/Algoritmo_de_Horner). Revisar el resultado de la parte anterior con el nuevo algoritmo.  
