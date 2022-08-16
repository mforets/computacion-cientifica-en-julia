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
histogram!(rand(N, 10_000), color = :orange)

N = Normal(1.0, 5.0)
histogram!(rand(N, 10_000), color = :orange)

##
# Entornos
##

# Project.toml
# Manifest.toml

# Archivos de proyecto ("project files")

# Hay un proyecto por defecto que se genera cuando instalo paquetes en Julia.
# Es lo que utiliza el "entorno" por defecto.

# Si abro `julia`
