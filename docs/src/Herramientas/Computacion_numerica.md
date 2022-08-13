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

o, lo que es equivalente:

```math
\mathbf{fl}(x) = x (1+\varepsilon) \mathrm{,~para~algún~} |\varepsilon|\leq \frac{1}{2}\varepsilon_{mach}
```

Por otro lado, la precisión (precision) de un número de punto flotante es siempre $d$ dígitos binarios.

Según el estándar *IEEE 754*, se define single (double) precision para $d=23$ ($52$) dígitos binarios para la parte fraccional $f$. En double precision $\varepsilon_{mach}=2^{-52}\approx 2.2\times 10^{-16}$.

Doble precisión corresponde a 64 bits binarios para representar un número: 52 bits para la mantisa ($1+f$), 1 bit para el signo y 11 bits para el exponente $e$. En este caso, el exponente $e$ puede variar de $2^0=1$ a $2^11=2048$. Como $e$ puede valer $0$, los valores posibles de $e$ son de $0$ a $2047$, donde el $1023$ representa el cero. Por lo tanto $e=-1023$ cuando todos los bits son 0 y $e=1024$ cuando todos los bits son 1. Sin embargo, estos extremos son reservados para números especiales ($NaN$ y $\pm \infty$), se tiene que $-1022\leq e \leq 1023$.

```julia
@show typeof(1)
x = 1.0
@show typeof(x)
@show bitstring(x)
@show sign(x)
@show eps(); # machine epsilon
@show floatmin() floatmax();
```

## Aritmética de punto flotante

Compare:

```julia
εₘ = eps()/2
(1.0 + ε) - 1.0
```

con:

```julia
1.0 + (ε - 1.0)
```

Las operaciones aritméticas en computadoras, son operaciones que se aplican a números de punto flotante y dan como resultado números de punto flotante. Cada operación matemática sobre números reales (suma, resta, multiplicación, división, raíz cuadrada, etc) tienen su análogo de máquina. Las operaciones elementales de máquina dan como resultado números de punto flotante cuyo error relativo está acotado por $\varepsilon_{mach}$. Por ejemplo, dados $x, \ y \in \mathbb{F}$, el error de la suma de máquina $\oplus$ está acotado por:

```math
\dfrac{|(x\oplus y)- (x+y)|}{|x+y|}\leq \varepsilon_{mach}
```

Por lo tanto, el error de las operaciones de máquina es prácticamente el mismo que el de la propia representación de los números de punto flotante.

Volviendo al ejemplo planteado, vemos que `(1.0 + ε) - 1.0` da $0$ miesntras que `1.0 + (ε - 1.0)` da `ε` (resultado exacto). Para entender este comportamiento, se debe notar que entre $1$ y $1+\varepsilon_{mach}/2$ no hay números de punto flotante, pues, en el intervalo $[1,2)$, el menor espaciamiento es $\varepsilon_{mach}$ (correspondiente a $e=0$), por lo que la diferencia da $0$. Por otro lado, el espacio entre números de punto flotante en el intervalo $[1/2,1)$ es $\varepsilon_{mach}/2$ (para $e=-1$), por lo tanto $1-\varepsilon_{mach}/2$ (y, por lo tanto, también su opuesto) se representa de manera exacta. Es por eso que en este último caso, el resultado `1.0 + (ε - 1.0)` es el exacto ($\varepsilon_{mach}/2$).

## Número de condición

Sea $\tilde{x}=\mathbf{fl}(x)=x(1+\varepsilon)$, para algún $|\varepsilon|\leq \varepsilon_{mach}/2$. Dada una función $f:\mathbb{R}\to\mathbb{R}$, calculamos la tasa de cambio relativo del resultado y de los datos como:

```math
\dfrac{\dfrac{|f(x)-f(\tilde{x})|}{|f(x)|}}{\dfrac{|x-\tilde{x}|}{|x|}}=\dfrac{|f(x)-f(x(1+\varepsilon))|}{| \varepsilon f(x) |}
```

Se define el condition number relativo para el problema $f(x)$, ($\kappa_f (x)$) tomando el límite para $\varepsilon_{mach}\to 0$, es decir, para el caso ideal de una computadora perfecta:

```math
\kappa_f (x) = \lim_{\varepsilon\to 0} \dfrac{|f(x)-f(x(1+\varepsilon))|}{| \varepsilon f(x) |}=\left| \dfrac{x f^\prime(x)}{f(x)} \right|
```
El problema de $f(x)$ es mal-condicionado (*ill-conditioned*) cuando $\kappa_f (x)$ es grande, ya que pequeñas perturbaciones del dato $x$ provoca grandes cambios relativos del resultado $f(x)$. En particular, $\kappa_f (x)$ grandes son una señal de que el error en el cálculo de la función $f(x)$ no se mantendrá comparable con el error de redondeo de $x$.

## El problema de k-bandits



## Evaluacion de polinomios

Como ejemplos consideremos el polinomio univariado $P_k \in \mathbb{R}[x]$ dado por

```math
P_k(x) := \sum_{k=0}^n \dfrac{x^k}{k!} = 1 + x + \frac{x^2}{2!} + \ldots + \frac{x^k}{k!}.
```

(a) Implementar una funcion `evaluar(x)` que evalua el polinomio $P_k$ en el valor $x$.

(b) ¿Cuantas multiplicaciones y cuantas divisiones utilizó en la parte anterior, para un valor de $k$ dado? Chequear (o revisar la implementación si no se verifica) que no se utilizan más de $2k$ multiplicaciones ni más de $k$ divisiones.

(c) Implementar la evaluación utilizando el [algoritmo de Horner](https://es.wikipedia.org/wiki/Algoritmo_de_Horner). Revisar el resultado de la parte anterior con el nuevo algoritmo.  

## Iteración de punto fijo

[Fixed point iteration](https://fncbook.github.io/v1.0/nonlineqn/demos/fp-spiral.html)

## Aritmética de intervalos

¿Biblio?

## Descenso por gradiente

## Referencias


---

## Ejercicios

#### 3.1. Método UCB para el problema de k-bandits 


#### 3.2. Integración de Runge-Kutta



