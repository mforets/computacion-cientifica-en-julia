## Comentarios adicionales sobre arrays

x = [1, 2, 3]

x = Vector{Int}()

push!(x, 1)
push!(x, 123)
x
for i in 1:2:10
    push!(x, i)
end


struct Ropa
    talle::Int
    color::String
end

R = Vector{Ropa}()

# agrego elementos al final
push!(R, Ropa(36, "naranja"))
push!(R, Ropa(38, "rojo"))


y = [1, 2, 3]

function sumar_uno!(x::Vector)
    x .+= 1
end
function sumar_uno(x::Vector)
    sumar_uno!(copy(x))
end

# otra forma de hacer x .+= 1
for i in eachindex(x)
    x[i] += 1
end

f(y)
y[1]

## Bubblesort

## Integracion por el metodo de Euler

## Integracion por el metodo de Runge-Kutta

