!!! warning "Entrega"
    Se debe entregar un archivo .ZIP llamado `Entregable_5` que contenga un archivo de Julia (`.jl`) por cada ejercicio `Ejercicio1.jl`, `Ejercicio2.jl`, etc. Deben entregar solamente *una* parte. Fecha límite de entrega: Viernes 5 de mayo.

## Parte A.


#### 1. Aritmética básica y asignación de variables

En este ejercicio, realizarás operaciones aritméticas básicas y asignarás los resultados a variables.

1. Asigna el valor de 7 a una variable llamada `x`.
2. Asigna el valor de 5 a una variable llamada `y`.
3. Calcula la suma, diferencia, producto y cociente de `x` e `y`, y asigna los resultados a las variables `suma_xy`, `dif_xy`, `prod_xy` y `cociente_xy`, respectivamente.
4. Imprime los valores de estas variables.

Salida esperada:
```
12
2
35
1.4
```

#### 2. Intercambiar variables

En este ejercicio, intercambiarás los valores de dos variables sin usar una tercera variable.

1. Utiliza las mismas variables `x` e `y` que asignaste en el Ejercicio 1.
2. Intercambia los valores de `x` e `y` usando operaciones aritméticas.
3. Imprime los nuevos valores de `x` e `y`.

Salida esperada:
```
5
7
```

#### 3. Conversión de Celsius a Fahrenheit

En este ejercicio, convertirás un valor de temperatura en grados Celsius a grados Fahrenheit.

1. Asigna el valor de 100 a una variable llamada `celsius`.
2. Calcula el valor Fahrenheit correspondiente y asígnalo a una variable llamada `fahrenheit`.
3. Imprime el valor Fahrenheit.

Salida esperada:
```
212.0
```

#### 4. Resolución de una ecuación cuadrática

En este ejercicio, resolverás una ecuación cuadrática de la forma ax^2 + bx + c = 0, donde a, b y c son constantes.

1. Asigna los valores de 1, -3 y 2 a las variables `a`, `b` y `c`, respectivamente.
2. Calcula el discriminante y asigna el resultado a una variable llamada `discriminante`.
3. Calcula las dos soluciones de la ecuación cuadrática usando la fórmula general y asigna los resultados a las variables `x1` y `x2`.
4. Imprime las soluciones.

Salida esperada:
```
2.0
1.0
```

#### 5. Cálculo de interés compuesto

En este ejercicio, calcularás el valor futuro de una inversión utilizando interés compuesto.

1. Asigna el monto principal de 1000 a una variable llamada `principal`.
2. Asigna la tasa de interés anual del 5% (0.05) a una variable llamada `tasa_interes`.
3. Asigna el número de años (10) a una variable llamada `años`.
4. Asigna el número de veces que se compone el interés por año (12) a una variable llamada `compuestos_por_año`.
5. Calcula el valor futuro de la inversión utilizando la fórmula de interés compuesto y asigna el resultado a una variable llamada `valor_futuro`.
6. Imprime el valor futuro.

Salida esperada:
```
1647.0094976907984
```

## Parte B.

#### 1. Conversion a escala de grises

Escribir una función que es capaz de recibir una imagen de entrada y convertirla a escala de grises.

Sugerencia 1: utilizar la biblioteca Images de Julia para leer la imagen en formato PNG. Ver Entregable 4 que contiene código de ejemplo.

Sugerencia 2: Utilizar la función `Gray.(img)` para convertir la imagen a escala de grises si está en formato RGB u otro formato.

#### 2. Cálculo de gradientes

Definir una función `imgradients` que calcula los gradientes de una imagen en escala de grises en ambas direcciones, horizontal (dx) y vertical (dy).

Puede ya sea escribir su propio algoritmo, o seguir el siguiente pseudo-código, que provee una implementación simple que calcula los gradientes
utilizando un método básico de diferencias finitas.

1. Definir una función `imgradients(img)` que tome como entrada una matriz de imagen en escala de grises 2D.
2. Inicializar dos matrices del mismo tamaño que la imagen de entrada, `dx` y `dy`, para almacenar los gradientes horizontales y verticales.
3. Iterar sobre los píxeles de la imagen de entrada, excluyendo los píxeles del borde (comenzar desde la segunda fila y columna y terminar en la penúltima fila y columna):
   a. Para cada píxel (x, y), calcular el gradiente horizontal `dx[y, x]` como la diferencia entre la intensidad del píxel a la derecha y el píxel a la izquierda, dividida por 2: `(img[y, x + 1] - img[y, x - 1]) / 2`.
   b. Para cada píxel (x, y), calcular el gradiente vertical `dy[y, x]` como la diferencia entre la intensidad del píxel debajo y el píxel arriba, dividida por 2: `(img[y + 1, x] - img[y - 1, x]) / 2`.
4. Devolver las matrices de gradientes horizontales y verticales `dx` y `dy`.

#### 3. Detección de puntos con el método de Harris

En el procesamiento digital de imágenes, una esquina es un punto de interés donde la intensidad de los píxeles varía significativamente en múltiples direcciones. El algoritmo de detección de esquinas de Harris es un método popular para detectar esquinas en imágenes. Funciona analizando la estructura local de la imagen e identificando regiones donde el cambio en la intensidad es significativo a lo largo de diferentes ejes. El algoritmo es particularmente útil en aplicaciones de visión por computadora, como detección de características, unión de imágenes y reconocimiento de objetos.

Se sugiere seguir el siguiente pseudocódigo de alto nivel para la implementación del algoritmo de detección de esquinas de Harris:

1. Cargar la imagen de entrada y convertirla a escala de grises.
2. Calcular los gradientes de la imagen en escala de grises en ambas direcciones, horizontal (dx) y vertical (dy).
3. Calcular los productos de los gradientes `(Ix2, Iy2 e Ixy)` en cada píxel.
4. Para cada píxel (x, y) en la imagen:
   a. Inicializar una matriz M de 2x2 en ceros.
   b. Iterar a través de una ventana (vecindario) centrada en el píxel `(x, y)`:
      i. Acumular los productos de los gradientes `(Ix2, Iy2 e Ixy)` dentro de la ventana en la matriz M.
   c. Calcular la respuesta de esquina R para el píxel (x, y) usando el determinante y la traza de la matriz M: `R = det(M) - k * (tr(M) ^ 2)`, donde k es un factor de sensibilidad (típicamente 0.04-0.06).
   d. Si R es mayor que un umbral predefinido, marcar el píxel `(x, y)` como una esquina.
5. Extraer las coordenadas de las esquinas detectadas y devolverlas como una lista de puntos.

Este pseudocódigo  describe los pasos principales del algoritmo de detección de esquinas de Harris, desde cargar la imagen de entrada hasta extraer las coordenadas de las esquinas detectadas. Esta es una implementación básica y se pueden aplicar optimizaciones de rendimiento para mejorar la eficiencia del algoritmo en la práctica.

A continuación se proveen algunas sugerencias para los pasos del pseudo-código:

1. Cargar la imagen de entrada y convertirla a escala de grises. Ver Ejercicio 1.

2. Calcular los gradientes de la imagen en escala de grises en ambas direcciones, horizontal (dx) y vertical (dy). Ver Ejercicio 2.

3. Calcular los productos de los gradientes (Ix2, Iy2 e Ixy) en cada píxel.
   - Pista 1: Calcular Ix2 como el producto de `dx * dx`, Iy2 como el producto de `dy * dy`, e `Ixy` como el producto de `dx * dy`.
   - Pista 2: Utilizar operaciones de matriz (elemento por elemento) para un cálculo eficiente.

4. Para cada píxel `(x, y)` en la imagen: (...)
   - Pista 1: Utilizar bucles anidados `for` para iterar sobre todos los píxeles de la imagen, excluyendo los bordes si es necesario.
   - Pista 2: Inicializar la matriz `M` en ceros y acumular los productos de gradientes dentro de la ventana utilizando bucles adicionales `for`.

5. Extraer las coordenadas de las esquinas detectadas y devolverlas como una lista de puntos.
   - Pista 1: Utilizar la función `findall(corners .> threshold)` para obtener las coordenadas de los píxeles con valores de respuesta de esquina mayores que el umbral.
   - Pista 2: Convertir las coordenadas obtenidas en una lista de puntos (tuplas) utilizando la función `map` de Julia.

---

*Nota: Partes de este entregable fueron desarrolladas con la asistencia de OpenAI's ChatGPT, un modelo de lenguaje natural de gran escala. Ver Radford, A., Narasimhan, K., Salimans, T., & Sutskever, I. (2018). Improving Language Understanding by Generative Pre-Training."*
