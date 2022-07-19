# Computación numérica

En computación, la representación de un número real consiste en reemplazarlo por una cantidad finita de dígitos. Este proceso de discretización, implica que todo conjunto de números reales y los resultados de operaciones aritméticas que hagamos con ellos, se verán alterados respecto al valor matemático exacto. Existen algoritmos, llamados inestables, que son extremadamente sensibles a dichas perturbaciones (tal sensibilidad se cuantifica con el [condition number](https://en.wikipedia.org/wiki/Condition_number)). En este apartado, discutiremos cómo se tratan estos aspectos.

## Números de punto flotante

El conjunto de los números reales $\mathbb{R}$ es infinito en dos sentidos: no es acotado y es contínuo. En computación numérica, reemplazamos $\mathbb{R}$ por el conjunto de números de punto flotante $\mathbb{F}$, cuyos elementos son el cero y los números de la forma:

```math
\pm (1 + f) \times 2^e
```

donde $e$ es el exponente y $1+f$ es la mantisa, definda como

```math
f = \sum_{i=1}^d b_i 2^{-i}, \ b_i \in \left\{ 0,1 \right\}
```

con $d$ un número entero fijo. Por lo tanto, $f\in \left[0,1 \right)$ y $(1+f)\in \left[1,2 \right)$. Notar que:

```math
f = 2^{-d}\sum_{i=1}^d b_i 2^{d-i} = 2^{-d} z
```

con $z\in \{ 0,1,\dots,2^d-1 \}$. Por lo tanto, el conjunto $\mathbb{F}$ contiene $2^d$ números equiespaciados por $2^{e-d}$, cuyo primer elemento es $2^e$ y el último es $2^{e+1}-2^{-d}$.

El elemento de $\mathbb{F}$ es 1 y el siguiente es $1+2^{-d}$ (para $e=0$) y, por lo tanto, la precisión de máquina o "machine epsilon" se define como $\varepsilon_{mach}=2^{-d}$.

La función de redondeo $\mathbf{fl}$ mapea cada $x\in\mathbb{R}$ al elemento $\mathbf{fl}(x)\in\mathbb{F}$ más cercano. Si $x$ es positivo, sabemos que $x\in \left[ 2^e, 2^{e+1} \right)$ para algún $e$. Por lo tanto, $| \mathbf{fl}(x) - x | \leq \frac{1}{2}(2^{e-d})$ y el error relativo (relative accuracy) de la función de redondeo está acotado por:

```math
\dfrac{| \mathbf{fl}(x) - x |}{| x |} \leq \frac{1}{2}\varepsilon_{mach}
```

Por otro lado, la precisión (precision) de un número de punto flotante es siempre $d$ dígitos binarios.

Según el estándar *IEEE 754*, se define single (double) precision para $d=23$ ($52$) dígitos binarios para la parte fraccional $f$. En double precision $\varepsilon_{mach}=2^{-52}\ap$.

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
