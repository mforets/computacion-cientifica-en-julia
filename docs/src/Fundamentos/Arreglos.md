# Arreglos

## Matrices esparsas

## Matrices estáticas

---

## Entregable 6

!!! warning "Formato de entrega"
    El formato de entrega es análogo al utilizado en los entregables anteriores, ver [Ejercicio 1.2 Creación de un repositorio](https://mforets.github.io/computacion-cientifica-en-julia/dev/Herramientas/Entorno_de_desarrollo/#.2.-Creaci%C3%B3n-de-un-repositorio). En particular, todos los ejercicios entregados deben ser parte de un único módulo llamado `Entregable_6` que define la constante CI asi como también exporta las funciones que se piden en cada ejercicio entregado. **Importante:** Además debe incluir los archivos de proyecto (`Project.toml` y `Manifest.toml`) en su entrega. 

#### 6.1. Evaluación de polinomios por el método de Bernstein

En este ejercicio revisitamos el problema del cálculo de coeficientes de Bernstein del Ejercicio 3.2, generalizando el cálculo a múltiples dimensiones. 
Utilizamos multi-índices $i = (i_1, i_2, \ldots, i_n)$ para representar n-tuplas de números enteros no negativos (lo mismo con $l$). Sea $p: \mathbb{R}^n \to \mathbb{R}$ un polinomio multivariado (en $n$ variables). Dado un polinomio en su forma canónica (es decir en la base de potencias),

```math
p(x) = \sum_{i=0}^l a_i x^i,\qquad x = (x_1, \ldots, x_n),
```
nos interesa expresarlo en una base diferente llamada la *base de Bernstein*. Gráficos de los polinomios de la base de Bernstein, $B_i^l(x)$, se pueden apreciar en la Figura 3.1 de [Enclosure Methods for Systems of Polynomial Equations and Inequalities](https://d-nb.info/1028327854/34) de A. P. Smith (2012). En este ejercicio se debe implementar la ecuación (3.13) en dicha tesis, es decir, aquella que permite encontrar los coeficientes de $p$ en la base de Bernstein,

```math
p(x) = \sum_{i=0}^l b_i B_i^l(x),
```
donde $b_i$ son los coeficientes de Bernstein a determinar. Por conveniencia incluímos aquí la mencionada fórmula:

```math
b_i = \sum_{j=0}^i \dfrac{\binom{i}{j}}{\binom{l}{j}}(\bar{x} - \underline{x})^j \sum_{k=j}^l \binom{k}{j}\underline{x}^{k-j}a_k,\qquad 0 \leq i \leq l.
```

Sea $X = [\underline{x}_1, \bar{x}_1] \times \cdots \times [\underline{x}_n, \bar{x}_n] := [\underline{x}, \bar{x}]$ un dominio rectangular ("caja").

Implementar una función `bernstein_coefficients(pol, X)` que recibe un polinomio definido en el paquete [`DynamicPolynomials.jl`](https://github.com/JuliaAlgebra/DynamicPolynomials.jl) y devuelve los coeficientes de Bernstein ($b_i$) asociados de grado $l$ (para $l$ suficientemente grande) en el dominio $X$.
