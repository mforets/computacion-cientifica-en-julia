## k-bandit problem (reinforcement learning)

# maquina con k palancas
# tengo N jugadas

# cada vez que juego obtengo una recompensa, dicho valor
# esta dado por una distribucion normal (mu_i, sigma_i)
# i = 1, ..., k

# objetivo: maximizar la recompensa

# explorar vs explotar (utilizar)

# Idea : resolver un caso sencillo

using Plots
using StatsPlots

rand()
histogram(rand(10_000))

randn()
histogram(randn(10_000))

using Distributions

N = Normal(0.0, 1.0)
histogram(rand(N, 10_000), color = :orange)

N = Normal(10.0, 5.0)
histogram!(rand(N, 10_000), color = :red)

struct Palanca
    distribucion::Normal
end

struct Maquina
    palancas::Vector{Palanca}
end

function Maquina(; k::Int = 10, μ = zeros(k), σ = ones(k))
    vec = [Palanca(Normal(μi, σi)) for (μi, σi) in zip(μ, σ)]
    Maquina(vec)
end

function jugar(m::Maquina, i::Int)
    p = m.palancas[i]
    rand(p.distribucion)
end


m = Maquina(k = 2, μ = [1.0, 5.0])
histogram([jugar(m, 1) for _ in 1:1000], color = :blue)
histogram!([jugar(m, 2) for _ in 1:1000], color = :orange)

# Algoritmo 1:
N = 1000
proxima = jugar(m, i)

##
# Entornos
##

# Project.toml
# Manifest.toml

# Archivos de proyecto ("project files")

# Hay un proyecto por defecto que se genera cuando instalo paquetes en Julia.
# Es lo que utiliza el "entorno" por defecto.

# Si abro `julia`

# major.minor.patch

# packages

# ----------------------


