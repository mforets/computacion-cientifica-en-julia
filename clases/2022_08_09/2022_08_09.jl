## Cadenas de caracteres

x = "Hola"

apropos("replace")
methods(typeof(x)) # constructores
methodswith(typeof(x)) # metodos que se aplican

a = 2π
"Valor de pi: $a" # interpolar el valor numerico de a en la cadena

## Funciones

### Funciones con nombre

function f(x, y) # "firma" / "signature"
    return x + y # "cuerpo" / "body"
end

function f(x, y)
    x + y
end

f(x, y) = x + y

### Funciones anonimas

h = x -> x^2 + 1

### Argumentos posicionales

f(x, y)

# valor por defecto
function g(x=10, y=5)
    x + y
end

### Argumentos con clave

function f2(; x=10, y=5)
    x + y
end


function g2(x=10, y=5)
    x + y
end

### Argumentos opcionales

# usando todo:
function f3(x, y=7; z, r=6)
    x + y + z + r
end

### Sobrecarga de funciones

f5(x) = x + 1
f5(x, y) = x + y + 1




# - vimos el ejemplo de Punto

# ---

## Diccionario

x = Dict()

x[3] = 4
x[p] = "chau"
x

# ---

## Ejemplo: algoritmo de ordenamiento de burbuja

x = [4, 6, 2, 10]

# i = 1
[4, 6, 2, 10] # j = 2
[2, 6, 4, 10] # j = 3
[2, 6, 4, 10] # j = 4

# i = 2
[2, 6, 4, 10] # j = 3
[2, 4, 6, 10] # j = 4

# i = 3
[2, 4, 6, 10] # j = 4




