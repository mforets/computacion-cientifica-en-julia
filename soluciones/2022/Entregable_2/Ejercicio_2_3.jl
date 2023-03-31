export estimar_pi

Base.@kwdef struct Buffon
    D::Float64 = 10
    L::Float64 = 8
end

function estimar_pi(alg::Buffon, N=1000)
    D, L = alg.D, alg.L
    count = 0
    for i in 1:N
        y = rand() * D
        θ = rand() * 180
        δy = L / 2 * sind(θ)
        if (δy ≥ y) || (δy ≥ D - y)
            count += 1
        end
    end
    f = count / N
    2 * L / (f * D)
end
