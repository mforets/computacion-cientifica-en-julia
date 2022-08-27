using Test, DifferentialEquations, Plots, Polynomials

include("Entregable_3.jl")
using .Entregable_3

# ===================
# Ejercicio 3_1
# ===================
function lotkavolterra(x, t)
    α, β, γ, δ = 1.5, 1.0, 3.0, 1.0
    [α * x[1] - β * x[1] * x[2], δ * x[1] * x[2] - γ * x[2]]
end

T = 3.5
x, t = Entregable_3.integrate(lotkavolterra, Entregable_3.RK4(h = 0.01), 0.0, T, ones(2))

function lotkavolterra!(dx, x, p, t)
    α, β, γ, δ = 1.5, 1.0, 3.0, 1.0
    dx[1] = α * x[1] - β * x[1] * x[2]
    dx[2] = δ * x[1] * x[2] - γ * x[2]
end

prob = ODEProblem(lotkavolterra!, ones(2), (0.0, T))
sol_prob = solve(prob)

fig = plot(sol_prob, idxs = (1, 2), lab = "DiffEq")
plot!(fig, getindex.(x, 1), getindex.(x, 2), ls = :dash, lc = :red, lab = "RK4")
savefig(fig, joinpath(dirname(@__FILE__), "lotkavolterra.png"))

# ===================
# Ejercicio 3_2
# ===================

p = Polynomial([3, 2, -5])
@show bernstein_coefficients(p)
@show bernstein_coefficients(p, (0, 1))
@show bernstein_coefficients(p, (1, 2))
