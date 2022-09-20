# Dudas del entregable 6?
# ----------------------------
using Graphs, GraphRecipes, Plots

g = path_graph(3)
graphplot(g, nodeshape = :circle)

g.fadjlist # [2], [1, 3], [2]

g = path_digraph(3)
graphplot(g, nodeshape = :circle)
g.fadjlist # [2], [3], []

# Como ver los campos de un struct:
# .<TAB>
# fieldnames(typeof(g))
# dump(..)

#=
julia> fieldnames(typeof(g))
(:ne, :fadjlist)

julia> dump(g)
SimpleGraph{Int64}
  ne: Int64 2
  fadjlist: Array{Vector{Int64}}((3,))
    1: Array{Int64}((1,)) [2]
    2: Array{Int64}((2,)) [1, 3]
    3: Array{Int64}((1,)) [2]
=#

# Creacion de paquetes

# Documentacion, Tests

# Dependencias

# CI (integracion continua)

# Plot recipes
