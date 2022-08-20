println("Hola mundo!")

# SHIFT+ENTER para ejecutar
println("Chau")

# REPL: Read-Evaluate-Print-Loop
function f(x)
    2x + 1
end

# CTRL + SHIFT + P para abrir la ventana de comandos
# Usando Julia como calculadora

# sind

2^3^2 
# precedencia

# `?sin`
π

## Variables
x = 10

y = sin(x)

y = sin(z) # da error

α = 2
β = 3
z = α + β*im

exp(z)

## Vectores

x = [1, 20, 30]

y = [1.0, 20.0, 30.0]

x + x

x + y

# pensarlo como vectores columna

x * y

transpose(x)

transpose(x) * x

x .* x # operacion elemento a elemento

sum(x .* x) # forma alternativa del producto escalar

x[1]

x[2]

x[3]

x[end]

x[1:2]

x[2:3]

[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

r = 1:10 # range en Python
r[1]
collect(r)


x

sin.(x)

f(a) = 2a

# "broadcast"
f.(x)

# elevar al cubo cada componente de x
x.^3

rand(3) # 3 elementos distribucion uniforme

randn(3) # 3 elementos distribucion normal

[1, 2, 3, 4]

collect(0:2:10)

collect(0:0.1:10)

r = range(0, 2π, length=50)
r = collect(r)

r = range(0, 2π, step=0.5)

# Matrices

A = [1 3 7
     4 7 2
     0 1 1]

b = [3, 2, 1]

A * b


inv(A)

A * inv(A)

A

A[1:2, 1:2]

A[3, 3]

#
# A*x = b
#
x = inv(A) * b
A*x - b

y = A \ b


A

f.(A)

sin.(A)








