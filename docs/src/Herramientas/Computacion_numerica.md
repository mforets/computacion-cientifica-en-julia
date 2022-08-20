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

## Descenso por gradiente

## Referencias


---

## Entregable 3

!!! warning "Formato de entrega"
    El formato de entrega es análogo al utilizado en los entregables anteriores, ver [Ejercicio 1.2 Creación de un repositorio](https://mforets.github.io/computacion-cientifica-en-julia/dev/Herramientas/Entorno_de_desarrollo/#.2.-Creaci%C3%B3n-de-un-repositorio). En particular, todos los ejercicios entregados deben ser parte de un único módulo llamado `Entregable_3` que define la constante CI asi como también exporta las funciones que se piden en cada ejercicio entregado. **Importante:** Además debe incluir los archivos de proyecto (`Project.toml` y `Manifest.toml`) en su entrega. 

#### 3.1. Integración de Runge-Kutta

En este ejercicio trabajamos con ecuaciones diferenciales numéricamente. Sea $x' = f(x(t), t)$, $x \in \mathbb{R}^n$, un sistema de ecuaciones diferenciales ordinarias de primer orden en $n \geq 1$ variables. Dentro de la gran variedad de enfoques para integrar numéricamente dichos sistemas se encuentra la familia de métodos de [Runge-Kutta](https://en.wikipedia.org/wiki/Runge%E2%80%93Kutta_methods). Nos concentramos en el método RK4 (cuarto orden) que se describe a continuación. En dicho método, dado un paso temporal $h > 0$ y un estado inicial $x_0$ se calcula, para cada $k = 0, 1,\ldots, N$, una secuencia de valores $x_1, x_2, \ldots, x_N$ mediante la siguiente fórmula explícita:

```math
x_{k+1} = x_k + h\sum_{k=1}^s b_k w_k,
```
Para el esquema que nos interesa utilizamos $s = 4$ y los coeficientes $b_i$ resultan ser $(1/6, 2/6, 2/6, 1/6)$. Los términos $w_i$ resultan de evaluar el campo vectorial $f$ en los siguientes puntos intermedios: $w_1 = f(x, t)$, $w_2 = f(x + hw_1 / 2, t + h/2)$, $w_3 = f(x + hw_2 / 2, t + h/2)$ y $w_4 = f(x + hw_3, t + h)$.

Implementar una función `integrate(f::Function, alg::RK4, t0, T, x0)` que resuelve el problema de valores iniciales $x' = f(x(t), t)$, $x(0) = x_0$, en el intervalo de tiempo entre $t_0$ y $T$. Aquí `RK4` es un struct asociado al algoritmo y que debe almacenar el paso $h$ (sin valor por defecto). La función `integrate` debe devolver un vector con el resultado de la integración.

Como caso de ejemplo se considerará la integración de las ecuaciones de [Lotka-Volterra](https://es.wikipedia.org/wiki/Ecuaciones_Lotka%E2%80%93Volterra):

```julia
function lotkavolterra(x, t)
    α, β, γ, δ = 1.5, 1., 3., 1.
    [α * x[1] - β * x[1] * x[2], δ * x[1] * x[2] - γ * x[2]]
end
```
entendiéndose que el siguiente comando debe integrar dicho sistema entre $t = 0$ y $t = 1.0$ con paso temporal $h = 0.01$ y condición inicial $x_0 = [1, 1]$:
```julia
julia> integrate(lotkavolterra, RK4(h=0.01), 0.0, 1.0, ones(2))
```

#### 3.2. Evaluación de polinomios por el método de Bernstein

En este ejercicio trabajamos con polinomios univariados $p : \mathbb{R} \to \mathbb{R}$, cuyos coeficientes en la base de potencias notamos $\{a_i\}_{i=0}^l$ siendo $l \in \mathbb{N}$ el *grado* del polinomio ($a_l \neq 0$). Tiene así a lo sumo $l+1$ términos (monomios) no nulos y escribimos:
```math
p(x) = a_0 + a_1 x + \ldots + a_l x^l.
```
Para trabajar con polinomios univariados en Julia utilizaremos [Polynomials.jl](https://github.com/JuliaMath/Polynomials.jl). Por ejemplo, sea

```math
p(x) = 3x^2 - 2x + 1.
```
Podemos definirlo como un `Polynomials.Polynomial` así:
```julia
julia> using Polynomials

julia> p = Polynomial([1, -2, 3])
Polynomial(1 - 2*x + 3*x^2)
```
Nótese que el órden más bajo se ingresa primero. Consultar la documentación de [Polynomials.jl](https://juliamath.github.io/Polynomials.jl/stable/) por más casos de uso.

El método llamado *expansion de Bernstein* permite, entre otras cosas, calcular extremos (máximos y mínimos) de polinomios en un dominio dado, de manera aproximada pero rápida. Dicho método también aplica a polinomios multivariados, pero dejaremos esa generalización para un entregable futuro. Como referencia, tanto para el caso univariado como para el multivariado, ver [Enclosure Methods for Systems of Polynomial Equations and Inequalities](https://d-nb.info/1028327854/34) de A. P. Smith (2012).

El primer paso en este ejercicio consiste en implementar una función
```julia
bernstein_basis(l::Int, i::Int)::Function
```
que devuelve el polinomio de Bernstein $i$-ésimo de grado $l$, definido mediante la fórmula

```math
B_i^l(x) = \binom{l}{i}x^i (1 - x)^{l-i},\qquad i = 0, \ldots, l.
```
Se adopta la convención de que $B_i^l(x) = 0$ para todo $x$ si $i < 0$ o si $i > l$.

Por ejemplo, $B^3_1(x) = 3x^3 - 6x^2 + 3x$:
```julia
julia> p = bernstein_basis(3, 1)
#1 (generic function with 1 method)

julia> p_test = Polynomial([0, 3, -6, 3])
Polynomial(3*x - 6*x^2 + 3*x^3)

julia> sum(abs(p(x) - p_test(x)) for x in rand(1_000))
5.703991186984617e-14
```
Se recomienda corroborar su implementación con los gráficos de la Figura 3.1 de la citada tesis.

Dado un polinomio en la base de potencias
```math
p(x) = \sum_{i=0}^l a_i x^i,
```
su expresión en la base de Bernstein de grado $l$ en el dominio unitario $X = [0, 1]$ es:
```math
p(x) = \sum_{i=0}^l b_i B_i^l(x),
```
con $l + 1$ coeficientes $\{b_i\}$ a determinar. Por ejemplo:
```math
p(x) = -5x^2 + 2x + 3 = 3(1 - 2x+x^2) + 4(2x - 2x^2) = 3 B_0^2(x) + 4B_1^2(x).
```
Así, en este ejemplo los coeficientes en la base de potencias son $(a_0, a_1, a_2) = (3, 2, -5)$ mientras que los coeficientes en la base de Bernstein de grado $l = 2$ son $(b_0, b_1, b_2) = (3, 4, 0)$.

Implementar una función
```julia
bernstein_coefficients(pol::Polynomial)::Vector
```
que permite convertir de la base de potencias a la base de Bernstein. La conversión se puede lograr mediante la siguiente fórmula (ver Teorema (3.2) de la citada tesis para la demostración):
```math
b_i = \sum_{j = 0}^i \dfrac{\binom{i}{j}}{\binom{l}{j}}a_j,\qquad 0 \leq i \leq l.
```
En el ejemplo anterior,
```julia
julia> p = Polynomial([3, 2, -5])
Polynomial(3 + 2*x - 5*x^2)

julia> bernstein_coefficients(p)
[3, 4, 0]
```
Cuando el dominio de interés no es el intervalo unitario, se requiere utilizar una fórmula de transformacion generalizada. Sea $X = [\underline{x}, \bar{x}]$ un dominio (intervalo) arbitrario, $\underline{x} <  \bar{x}$. Implementar una función
```julia
bernstein_coefficients(pol::Polynomial, X::Tuple{Number,Number})::Vector
```
que recibe un polinomio y devuelve en un vector los $l+1$ coeficientes de Bernstein $\{b_i\}$ asociados de grado $l$ en $X$ (representado como una tupla de números). Para ello se utilizará el siguiente resultado (ver ecuación (3.13) de la citada tesis):
```math
b_i = \sum_{j=0}^i \dfrac{\binom{i}{j}}{\binom{l}{j}}(\bar{x} - \underline{x})^j \sum_{k=j}^l \binom{k}{j}\underline{x}^{k-j}a_k,\qquad 0 \leq i \leq l.
```

Una de las propiedades más interesantes de la expansión de Bernstein es que los coeficientes de la expansión contienen información sobre el *rango* del polinomio en el dominio $X$ dado, resultado que se conoce como *Bernstein enclosure*. Concretamente,

```math
\min_{i} \{ b_i \} \leq p(x) \leq \max_{i} \{b_i\},\qquad x \in X. 
```
Implementar una función
```julia
bernstein_enclosure(pol::Polynomial, dom::Tuple{Number,Number})::Tuple{Number,Number}
```
que devuelve una tupla con la estimación del rango de $p(x)$ utilizando el método de Bernstein.

En síntesis, este ejercicio requiere implementar las siguientes funciones:

```julia
bernstein_basis(l::Int, i::Int)::Function
bernstein_coefficients(pol::Polynomial)::Vector
bernstein_coefficients(pol::Polynomial, X::Tuple{Number,Number})::Vector
bernstein_enclosure(pol::Polynomial, dom::Tuple{Number,Number})::Tuple{Number,Number}
```

---

## Entregable 4

!!! warning "Formato de entrega"
    El formato de entrega es análogo al utilizado en los entregables anteriores, ver [Ejercicio 1.2 Creación de un repositorio](https://mforets.github.io/computacion-cientifica-en-julia/dev/Herramientas/Entorno_de_desarrollo/#.2.-Creaci%C3%B3n-de-un-repositorio). En particular, todos los ejercicios entregados deben ser parte de un único módulo llamado `Entregable_4` que define la constante CI asi como también exporta las funciones que se piden en cada ejercicio entregado. **Importante:** Además debe incluir los archivos de proyecto (`Project.toml` y `Manifest.toml`) en su entrega. 

#### 4.1. Método UCB para el problema de k-bandits

En este ejercicio revisitamos el problema de k-bandits trabajado en clase. Se implementará el algoritmo llamado upper-confidence-bound (UCB) que se describe a continuación. Sea $A_t$ la acción seleccionada en el tiempo $t$ para $t = 1, \ldots, N$ pasos de tiempo, y sea $Q_t(a)$ el *promedio* de recompensas recibido de la acción $a$ a tiempo $t$.

El algoritmo UCB utiliza la siguiente lógica:

```math
A_t := \argmax_{a} \left( Q_t(a) + c \sqrt{\dfrac{\ln t}{N_t(a)}} \right),
```
donde $\ln t$ es el logaritmo (natural) del número de jugada actual, $N_t(a)$ es el número de veces que la acción $a$ ha sido seleccionada anteriormente a la jugada $t$-ésima, y la constante $c > 0$ es un parámetro del algoritmo que controla el grado de *exploración*. Si $N_t(a)$ es igual a cero, se considera que $a$ maximiza la expresión. Si hay más de un maximizador, se escoge uno de ellos al azar (de manera uniforme).

La idea del algoritmo es seleccionar aquellas acciones (palancas) de acuerdo a su potencial de ser óptimas, tomando en cuenta tanto el estimado del mejor valor actual, como también la incertidumbre asociada a dicha estimación.

Implementar una función `simular(::Maquina, ::UCB; N::Int=1000)` que implementa el algoritmo anterior. Se utilizará un struct `UCB` asociado al algoritmo que debe almacenar el parámetro de diseño, con un valor por defecto de $c=2$.

#### 4.2. Conjunto alcanzable mediante simulaciones

En este ejercicio construimos sobre el Ejercicio 3.1 combinando las simluaciones con [conjuntos en espacios Euclídeos](https://en.wikipedia.org/wiki/Euclidean_space). Se debe escribir una función `reachable_set(f::Function, ::RK4, t0, T, X0::Box)` que devuelve otro conjunto $Y$ tal que $Y$ es una estimación, obtenida mediante simulación numérica de los estados alcanzables en el tiempo $T$.

Independiente de la implementación de `Box` utilizada, ésta debe admitir un constructor con centro (vector) y radio (escalar), e.g. `Box([1.0, 1.0], 1.0)` que representa el conjunto $\{x \in \mathbb{R}^2: \Vert x \Vert_\infty \leq 1 \}$.

Para la estimación se utilizará el algoritmo RK4 y para el muestreo de $X_0$ se utilizará una secuencia de Sobol, pudiéndose utilizar el paquete [Sobol.jl](https://github.com/stevengj/Sobol.jl) para tal fin. La ventaja que tiene utilizar dichas secuencias es que generan una distribución que cubre "cuasi-regularmente" el conjunto de partida.

#### 4.3. Expansión rápida de Bernstein para polinomios univariados

Revisar la implementación del Ejercicio 3.2 y realizar una evaluación de la performance para distintos casos de uso, variando el grado del polinomio. Implementar una versión optimizada que utilice el resultado de la Sección 9.2.1 de la tesis de A. P. Smith. En consecuencia implementar

```julia
bernstein_coefficients(pol::Polynomial, alg::Algorithm=Fast())::Vector
bernstein_coefficients(pol::Polynomial, X::Tuple{Number,Number}, alg::Algorithm=Fast())::Vector
bernstein_enclosure(pol::Polynomial, dom::Tuple{Number,Number}, alg::Algorithm=Fast())::Tuple{Number,Number}
```
siendo `Fast` un struct que representa el nuevo algoritmo y `Naive` un struct que representa el algoritmo anterior.
