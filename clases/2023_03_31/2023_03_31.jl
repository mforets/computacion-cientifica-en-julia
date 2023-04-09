using LazySets, Plots
using LazySets: center

H = Hyperrectangle(zeros(2), 3 * ones(2))

# Es lo mismo que:
# H = Hyperrectangle([0.0, 0.0], [3.0, 3.0])
# H = Hyperrectangle([0, 0], [3, 3])

B = rand(Ball2)

plot(H)
plot!(B, ratio = 1, alpha = 1.0, linewidth = 2.0)
plot!(Singleton(center(B)))
#
# {1}, {"a"}
#
R = radius(B)

A = π * R^2

S = split(H, [8, 8])
h² = area(S[1]) # area de un rectangulo

#=
α   \alpha[TAB]
β   \beta[TAB]
γ   \gamma[TAB]
δ   \delta[TAB]
ϵ   \epsilon[TAB]
=#

length(S)

plot!(S)

#=
P = tovrep(overapproximate(B, HPolygon, 0.1))
plot(P, ratio = 1.0)
plot!(B)
=#

#=
Input: H hyperrectangulo exterior y B circulo contenido en H.
       Tambien damos p particion [p, p] de H.
Output: Nint numero de rectangulos interiores contenidos en B.

Algoritmo:

Nint <- 0

Para cada Hi en split(H, [p, p])
    si Hi esta contenido en B
        Nint <- Nint + 1

Devolver Nint
=#
function contar_int(H::Hyperrectangle, B::Ball2, p::Int)
    Nint = 0
    for Hi in split(H, [p, p])
        if contenido(Hi, B)
            Nint = Nint + 1
        end
    end
    return Nint
end

#=
Input: Hi hyperrectangulo, B circulo.
Output: verdadero si Hi esta dentro de la bola B y falso en caso contrario.
Algoritmo:

Para cada vertice p de Hi
    Si p no pertenece a B
        Devolver falso
Devolver verdadero
=#
function contenido(Hi::Hyperrectangle, B::Ball2)
    for p in vertices(Hi)
        if !pertenece(p, B)
            return false
        end
    end
    return true
end


B
radius(B)
p = [0.0, -2.0]
c = center(B)

# (x, y) ∈ B  <-> (x - c[1])^2 + (y - c[2])^2 ≤ R^2

(p[1] - c[1])^2 + (p[2] - c[2])^2

plot!(Singleton(p))

R^2

(p[1] - c[1])^2 + (p[2] - c[2])^2 ≤ R^2

function pertenece(p::Vector, B::Ball2)
    c = center(B)
    R = radius(B)
    (p[1] - c[1])^2 + (p[2] - c[2])^2 ≤ R^2
end

plot(B, ratio = 1)

rand()

plot(LineSegment([0.0, -0.5], [1.0, 1.0]), lw = 2.0)

α = (1 - (-0.5)) / (1 - 0)
# y = -0.5 + α * (x - 0)
xrand = [-0.5 + α * rand() for _ in 1:500]

# -0.8 ... 0.3
plot(LineSegment([0.0, -0.8], [1.0, 0.3]), lw = 2.0)
β = (0.3 - (-0.8)) / (1 - 0)
# y = -0.8 + β * (x - 0)
yrand = [-0.8 + β * rand() for _ in 1:500]

plot(B, ratio = 1)

nube = [Singleton(xi, yi) for (xi, yi) in zip(xrand, yrand)]

plot!(nube)

interiores = [p for p in nube if pertenece(element(p), B)]

plot!(interiores, color = :green)

p = 2000

Nint = contar_int(H, B, p)

L = 2 * radius_hyperrectangle(H)[1]
h = L / p

@show Nint * h^2

R = radius(B)
A = π * R^2

@show A


# Iteracion con enumerate:

V = rand(VPolygon)
plot(V)

for p in vertices(V)
    println(p)
end

for (i, p) in enumerate(vertices(V))
    println(i, " ", p)
end

# Encontrar el indice de todos los vertices que cumplen cierta
# condicion, por ejemplo la coordenada x es mayor que cero.
#
# Ver tambien: findfirst, findall, filter, etc. funciones de Julia.
#
