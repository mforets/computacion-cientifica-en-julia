# Repasar status Entregable 3
# Fecha de entrega: 24/08

# Ejemplo: dynamic polynomials.
using DynamicPolynomials

@polyvar x y

p = x^2 - 2x * y

monomials(p)
coefficients(p)
powers.(monomials(p))

# Retomar el ejemplo de k-bandits.

using Plots, StatsPlots, Distributions

struct Accion
    distribucion::Normal
end

struct Juego
    acciones::Vector{Accion}
end

function Juego(; k::Int = 10, μ = zeros(k), σ = ones(k))
    vec = [Accion(Normal(μi, σi)) for (μi, σi) in zip(μ, σ)]
    Juego(vec)
end

function jugar(m::Juego, i::Int)
    p = m.acciones[i]
    rand(p.distribucion)
end

m = Juego(k = 2, μ = [1.0, 5.0])
histogram([jugar(m, 1) for _ in 1:1000], color = :blue)
histogram!([jugar(m, 2) for _ in 1:1000], color = :orange)

# ====================
# Algoritmo "greedy":
# ====================
N = 10
proxima = jugar(m, i)


# ============================
# Algoritmo "epsilon-greedy":
# ============================

#=
Inicializar: de a = 1 hasta a = k
    Q(a) <- 0 # recompensas
    N(a) <- 0 # contador

Repetir:
    A <- argmax_{a} Q(a) con prob = 1 - eps
      <- accion aleatoria con prob = eps
    R <- jugar(A)
    N(A) <- N(A) + 1
    Q(A) <- Q(A) + 1/N(A) (R - Q(A))
=#

k = 2
Q = zeros(k)
N = zeros(k)

ε = 0.1
rand(Bernoulli(1 - ε))

# En Julia hay una funcion argmax pero el problema es que me da
# un unico elemento cuando hay empates.
Q = [1, 40, 3, 47]
# Encontrar el maximo (devuelve uno solo incluso si hay empates).
amax = maximum(Q)
# Encontrar el indice de todos los elementos de Q que son maximos.
idx = findall(==(amax), Q)
# Tomar una muestra aleatoria (distribucion uniforme) de todos
# los maximizadores. Observar que si hay un solo idx, me sirve igual.
A = rand(idx)

# jugar
R = jugar(J, A)

N[A] += 1
Q[A] += 1 / N[A] * (R - Q[A])


Base.@kwdef struct EpsilonGreedy
    ε::Float64 = 0.1
end

function simular(J::Juego, alg::EpsilonGreedy; budget::Int = 10)
    # Numero de acciones.
    k = length(J.acciones)

    # Inicializar contadores.
    Q = zeros(k)
    N = zeros(k)
    acciones = Int[]
    recompensas_promedio = Float64[]

    ε = alg.ε
    ber = Bernoulli(1 - ε)
    count = 0
    while count < budget
        p = rand(ber)
        A = if p
            # Accion greedy (explotar).
            idx = findall(==(maximum(Q)), Q)
            rand(idx)
        else
            # Explorar.
            rand(1:k)
        end
        push!(acciones, A)
        R = jugar(J, A)

        # Actualizar contadores.
        N[A] += 1
        Q[A] += 1 / N[A] * (R - Q[A])
        push!(recompensas_promedio, Q[A])
        count += 1
    end
    acciones, recompensas_promedio
end

J = Juego(k = 5, μ = [1, 2, 3, 4, 5.0], σ = ones(10))
alg = EpsilonGreedy(ε = 0.02)
budget = 2000
nsim = 2000
rec_prom = [simular(J, alg, budget = budget)[2] for _ in 1:nsim];

y = [sum(r[i][1] for r in rec_prom) / nsim for i in 1:budget]
plot(1:budget, y, lab = "")

# Ejercicio: Probar que la expresion anterior es correcta.
# Idea: matematicamente se define
# Q_t(a) := (suma de recompensas obtenidas de la accion a) / (numero de veces que elegi a anteriormente a t)

# Profiling / Medidas del desempeno.

