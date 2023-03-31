using LazySets, Plots

H = Hyperrectangle(zeros(2), 3 * ones(2))

# Es lo mismo que:
# H = Hyperrectangle([0.0, 0.0], [3.0, 3.0])
Hint = Hyperrectangle([0, 0], [3, 3])

B = rand(Ball2)

plot(H)
plot!(B, ratio = 1, alpha = 1.0, linewidth = 2.0)
plot!(Singleton(LazySets.center(B)))
#
# {1}, {"a"}
#
R = radius(B)^2

A = π * R^2

S = split(H, [8, 8])
h2 = area(S[1]) # area de un rectangulo
length(S)

plot!(S)

#=
P = tovrep(overapproximate(B, HPolygon, 0.1))
plot(P, ratio = 1.0)
plot!(B)
=#

#=
Input: H hyperrectangulo exterior y B circulo contenido en H. Tambien damos p particion [p, p] de H.
Output: Nint numero de rectangulos interiores contenidos en B.
Algoritmo:

Nint <- 0

Para cada Hi en split(H, [p, p])
    si Hi esta contenido en B
        Nint <- Nint + 1

Devolver Nint
=#
function contar_int(H, B, p)
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
        if !pertence(p, B)
            return false
        end
    end
    return true
end

pertence(p, B) = p ∈ B

p = 1000
Nint = contar_int(H, B, p)

L = 2 * radius_hyperrectangle(H)[1]
h = L / p
@show Nint * h^2
@show A
