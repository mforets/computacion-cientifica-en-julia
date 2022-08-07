# Mecanismos de evaluacion

## Evaluacion en el sitio

## Evaluación perezosa

--

## Ejercicios

#### 6.1. Transcripción revisitada

Considerar nuevamente el ejercicio [2.2 Transcripción de ADN](https://mforets.github.io/computacion-cientifica-en-julia/dev/Herramientas/Primeros_pasos_en_Julia/#.1.-Transcripci%C3%B3n-de-ADN) y realizar los cambios necesarios para definir una nueva función `transcribir!` que actúa in-place.

#### 6.2. Rotación de imágenes

Dada una matriz 2D de tamaño $n \times n$ que representa una imagen, implementar una función `rotar!` que *rota* la matriz 90º en sentido horario. Se requiere en particular que el algoritmo **actúe en el sitio** (in-place).

Por ejemplo, dada la entrada 

```@example
[1 2 3; 4 5 6; 7 8 9]
```
el algoritmo debe producir la salida:
```@example
[7 4 1; 8 5 2; 9 6 3]
```
