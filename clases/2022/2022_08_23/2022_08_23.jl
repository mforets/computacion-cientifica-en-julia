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

    # similar(N)
    # Vector{Int64}(undef, k)
    # similar(N)
    # Int[]
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
alg = EpsilonGreedy(ε = 0.2)
budget = 500
acc, rec = simular(J, alg; budget = budget)
plot(1:budget, acc, lab = "")

budget = 2000
nsim = 2000
rec_prom = [simular(J, alg, budget = budget)[2] for _ in 1:nsim];
y = [sum(r[i] for r in rec_prom) / nsim for i in 1:budget]
plot(1:budget, y, lab = "")

# Ejercicio: implementar la simulacion para muchas corridas de forma eficiente.

# Mostrar como se puede definir una familia de acciones (tipo parametrico) para cualquier distribucion.

# Medida de tiempos.
J = Juego(k = 5, μ = [1, 2, 3, 4, 5.0], σ = ones(10))
alg = EpsilonGreedy(ε = 0.2)
budget = 2000

# vienen en Base:
@time simular(J, alg; budget = budget);
@elapsed simular(J, alg; budget = budget)
@timed simular(J, alg; budget = budget)
@timev simular(J, alg; budget = budget)

using BenchmarkTools

@benchmark simular($J, $alg; budget = $budget)

@btime simular($J, $alg; budget = $budget);

function foo()
    J = Juego(k = 5, μ = [1, 2, 3, 4, 5.0], σ = ones(10))
    alg = EpsilonGreedy(ε = 0.2)
    budget = 10_000
    simular(J, alg; budget = budget)
end

@profview foo()

function profile_test(n)
    for i in 1:n
        A = randn(100, 100, 20)
        m = maximum(A)
        Am = mapslices(sum, A; dims = 2)
        B = A[:, :, 5]
        Bsort = mapslices(sort, B; dims = 1)
        b = rand(100)
        C = B .* b
    end
end

# compilation
@profview profile_test(1)
# pure runtime
@profview profile_test(100)

# Tipos parametricos:
struct Accion2{T}
    distribucion::T
end

Accion2(Normal())

#-

p(x) = -5 * x^2 + 2 * x + 3


@polyvar x
p = -5 * x^2 + 2 * x + 3
typeof(p)


# hecha
function foo(pol::DynamicPolynomials.Polynomial)
    x
end

foo(pol::Polynomials.Polynomial) = foo(convert(DynamicPolynomials.Polynomias, pol))
function Base.convert(::Type{DynamicPolynomials.Polynomial}, pol::Polynomials.Polynomial)
    @polyvar x
    sum(x^(i - 1) * p for (i, p) in enumerate(pol.coeffs))
end

# Box([1.0, 1.0], 1.0)
# la caja: (1-1, 1-1)  (1+!)

# ∥x - c∥∞​
