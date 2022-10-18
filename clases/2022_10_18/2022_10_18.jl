# Type hierarchy
# ===============
abstract type Agent end
abstract type Animal <: Agent end
abstract type Plant <: Agent end

mutable struct Grass <: Plant
    const id::Int
    size::Int
    const max_size::Int
end

Grass(id, m = 10) = Grass(id, rand(1:m), m)

function Base.show(io::IO, g::Grass)
    x = g.size / g.max_size * 100
    print(io, "🌿 #$(g.id) $(round(Int,x))% grown")
end

mutable struct Sheep <: Animal
    id::Int
    energy::Float64
    Δenergy::Float64 # cambio cuando come o se reproduce
    reprprob::Float64
    foodprob::Float64
end

Sheep(id, e = 4.0, Δe = 0.2, pr = 0.8, pf = 0.6) = Sheep(id, e, Δe, pr, pf)

function Base.show(io::IO, s::Sheep)
    e = s.energy
    d = s.Δenergy
    pr = s.reprprob
    pf = s.foodprob
    print(io, "🐑 #$(s.id) E=$e ΔE=$d pr=$pr pf=$pf")
end

#=
id(s::Sheep) = s.id
energy(s::Sheep) = s.energy
Δenergy(s::Sheep) = s.Δenergy
reprprob(s::Sheep) = s.reprprob
foodprob(s::Sheep) = s.foodprob
=#

# TODO: Hacer de manera programatica: pista usar Base.@eval iterando sobre fieldnames.

mutable struct Wolf <: Animal
    id::Int
    energy::Float64
    Δenergy::Float64
    reprprob::Float64
    foodprob::Float64
end

Wolf(id, e = 10.0, Δe = 8.0, pr = 0.1, pf = 0.2) = Wolf(id, e, Δe, pr, pf)

function Base.show(io::IO, s::Wolf)
    e = s.energy
    d = s.Δenergy
    pr = s.reprprob
    pf = s.foodprob
    print(io, "🐺 #$(s.id) E=$e ΔE=$d pr=$pr pf=$pf")
end

mutable struct World{A<:Agent}
    agents::Dict{Int,A}
    max_id::Int
end

function World(agents::Vector{<:Agent})
    max_id = maximum(a.id for a in agents)
    World(Dict(a.id => a for a in agents), max_id)
end

function Base.show(io::IO, w::World)
    println(io, typeof(w))
    for (_, a) in w.agents
        println(io, " $a")
    end
end
