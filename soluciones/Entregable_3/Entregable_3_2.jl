using Polynomials, Plots

export bernstein_basis, bernstein_coefficients, bernstein_enclosure

function bernstein_basis(l::Int, i::Int)
    x -> binomial(l, i) * x^i * (1 - x)^(l - i)
end

function bernstein_coefficients(p::Polynomial)
    a = coeffs(p)
    l = length(a) - 1
    out = zeros(eltype(a), l + 1)
    for i in 0:l
        for j in 0:i
            out[i + 1] += binomial(i, j) / binomial(l, j) * a[j + 1]
        end
    end
    return out
end

function bernstein_coefficients(p::Polynomial, X::Tuple{Number,Number})
    a = coeffs(p)
    l = length(a) - 1
    x̲, x̄ = X
    h = x̄ - x̲
    out = zeros(eltype(a), l + 1)
    for i in 0:l
        for j in 0:i
            w = zero(eltype(a))
            for k in j:l
                w += binomial(k, j) * x̲^(k - j) * a[k + 1]
            end
            out[i + 1] += binomial(i, j) / binomial(l, j) * h^j * w
        end
    end
    return out
end

function bernstein_enclosure(p::Polynomial, X::Tuple{Number,Number})
    coeffs = bernstein_coefficients(p, X)
    extrema(coeffs)
end

