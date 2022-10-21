# Type hierarchy
# ===============
abstract type Agent end

"""
Each implementation must have the fields `id` and `energy`, where
`id` is the first field.
"""
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
    const id::Int
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
    const id::Int
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

# Dinamica
# ==========

# Consistencia!

function eat!(sheep::Sheep, grass::Grass, w::World)
    sheep.energy += grass.size * sheep.Δenergy
    grass.size = 0
end

function eat!(wolf::Wolf, sheep::Sheep, w::World)
    wolf.energy += sheep.energy * wolf.Δenergy
    kill_agent!(sheep, w)
end

# funcion generica:
kill_agent!(a::Agent, w::World) = delete!(w.agents, a.id)

# Ejemplos:
grass = Grass(1)
sheep = Sheep(2)
wolf = Wolf(3)
world = World([grass, sheep, wolf])

eat!(wolf, sheep, world)

# solucion 1: asumiendo que el campo id de los animales es mutable
#=
function reproduce!(a::Animal, w::World)
    a.energy = a.energy / 2
    new_id = w.max_id + 1
    â = deepcopy(a)
    â.id = new_id
    w.agents[â.id] = â
    w.max_id = new_id
end
=#

# solucion 2: hacer la copia de manera programatica
function reproduce!(a::A, w::World) where {A<:Animal}
    a.energy = a.energy / 2
    a_vals = [getproperty(a, n) for n in fieldnames(A) if n != :id]
    new_id = w.max_id + 1
    â = A(new_id, a_vals...)
    w.agents[â.id] = â
    w.max_id = new_id
end

# Julia style guide:
#
# https://docs.julialang.org/en/v1/manual/style-guide/
# https://github.com/invenia/BlueStyle

s1, s2 = Sheep(1), Sheep(2)
w = World([s1, s2])

reproduce!(s1, w)

function agent_step!(p::Plant, w::World)
    if p.size < p.max_size
        p.size += 1
    end
end

# Concreto -> General
# Solucion 1: funciones especificas:
#=
function find_food(::Wolf, w::World)
    idx = [id for (id, agent) in w.agents if agent isa Sheep]
    isempty(idx) ? nothing : w.agents[rand(idx)]
end

function find_food(::Sheep, w::World)
    idx = [id for (id, agent) in w.agents if agent isa Grass]
    isempty(idx) ? nothing : w.agents[rand(idx)]
end
=#

# Solucion 2: generica
function find_food(a::Animal, w::World)
    idx = [id for (id, agent) in w.agents if eats(a, agent)]
    isempty(idx) ? nothing : w.agents[rand(idx)]
end

eats(::A1, ::A2) where {A1<:Animal,A2<:Agent} = eats(A1, A2)
eats(::Type{Wolf}, ::Type{Sheep}) = true
eats(::Type{Sheep}, ::Type{Grass}) = true
eats(::Type{<:Animal}, ::Type{<:Agent}) = false

# LEER >>> https://docs.julialang.org/en/v1/manual/types/#man-parametric-composite-types

function agent_step!(a::Animal, w::World)
    a.energy -= 1
    if rand() <= a.foodprob
        dinner = find_food(a, w)
        eat!(a, dinner, w)
    end
    if a.energy < 0
        kill_agent!(a, w)
        return
    end
    if rand() <= a.reprob
        reproduce!(a, w)
    end
end


