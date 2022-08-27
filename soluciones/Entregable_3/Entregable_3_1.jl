using UnPack
import Polynomials: integrate # para no tener conflictos

Base.@kwdef struct RK4
    h::Float64
end

function step!(f, x, k, t, h)
    k₁ = f(x[k], t[k])
    k₂ = f(x[k] + h * k₁ / 2, t[k] + h / 2)
    k₃ = f(x[k] + h * k₂ / 2, t[k] + h / 2)
    k₄ = f(x[k] + h * k₃, t[k] + h)

    x[k + 1] = x[k] + (h / 6) * (k₁ + 2k₂ + 2k₃ + k₄)
    t[k + 1] = t[k] + h
end

function integrate(f::Function, alg::RK4, t0, T, x0)
    @unpack h = alg
    N = round(Int, (T - t0) / h)
    t = Vector{Float64}(undef, N)
    x = Vector{typeof(x0)}(undef, N)
    x[1] = x0
    t[1] = t0

    for k in 1:(N - 1)
        step!(f, x, k, t, h)
    end
    x, t
end
