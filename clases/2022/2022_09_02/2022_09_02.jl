# ------------------
# Preguntas
# ------------------

# Escribir una funcion `f` que recibe un Float64 y devuelve 1
f(::Float64) = 1

# Como no uso el valor del argumento en el cuerpo de la funcion, sino solo su tipo
# puedo simplemente omitir bautizar / darle nombre a la variable.
g(x::Float64) = 1

# ------------------
# Array interface
# ------------------

#=
julia> using AbstractTrees

julia> AbstractTrees.children(t::Type) = subtypes(t)

julia> print_tree(AbstractVector)
AbstractVector
├─ AbstractRange
│  ├─ LinRange
│  ├─ OrdinalRange
│  │  ├─ AbstractUnitRange
│  │  │  ├─ IdentityUnitRange
│  │  │  ├─ OneTo
│  │  │  ├─ Slice
│  │  │  └─ UnitRange
│  │  └─ StepRange
│  └─ StepRangeLen
├─ ExceptionStack
├─ LogicalIndex
├─ MethodList
├─ ReinterpretArray{T, 1, S} where {T, S}
├─ ReshapedArray{T, 1} where T
├─ BitVector
├─ CartesianIndices{1, R} where R<:Tuple{OrdinalRange{Int64, Int64}}
├─ AbstractRange
│  ├─ LinRange
│  ├─ OrdinalRange
│  │  ├─ AbstractUnitRange
│  │  │  ├─ IdentityUnitRange
│  │  │  ├─ OneTo
│  │  │  ├─ Slice
│  │  │  ├─ StmtRange
│  │  │  └─ UnitRange
│  │  └─ StepRange
│  └─ StepRangeLen
├─ BitArray{1}
├─ ExceptionStack
├─ LinearIndices{1, R} where R<:Tuple{AbstractUnitRange{Int64}}
├─ MethodList
├─ DenseVector
│  ├─ CodeUnits
│  ├─ Const{T, 1} where T
│  ├─ UnsafeView
│  ├─ SharedVector
│  └─ Vector
├─ LinearIndices{1, R} where R<:Tuple{AbstractUnitRange{Int64}}
├─ PermutedDimsArray{T, 1} where T
├─ AbstractSparseVector
│  └─ SparseVector
├─ SubArray{T, 1} where T
├─ GenericArray{T, 1} where T
└─ PushVector
=#

# ------------------
# Iterator interface
# ------------------

# Cuenta los cuadrados hasta `count`.
struct Square
    count::Int
end

Square(7)

Base.iterate(S::Square, state = 1) = state > S.count ? nothing : (state * state, state + 1)

# Equivalente:
function Base.iterate(S::Square, state = 1)
    if state > S.count
        return nothing
    else
        return (state * state, state + 1)
    end
end

# Equivalente 2
function Base.iterate(S::Square, state = 1)
    if state > S.count
        nothing
    else
        (state * state, state + 1)
    end
end

# ifelse(f, a, b)

@edit sum(Square(4))

# Otro ejemplo: ver mapreduce

for item in Square(7)
    println(item)
end

[i^2 for i in Square(5)]

Base.length(S::Square) = S.count
map(x -> sqrt(x), Square(4))

#=
X = Vector{Vector{...}}
for i in 1:N
    next!(s, X[i])
end
=#

# Otras definiciones ("opcionales")
Base.eltype(::Type{Square}) = Int

#=
julia> eltype(Square)
Int64

julia> eltype(typeof(Square(6)))
Int64
=#

collect(Square(5))

using BenchmarkTools

s = Square(500)
@btime sum($s) # $s se dice que "interpola" la variable "s"
# @btime sum($s) # $s se dice que "interpola" la variable "s"

Base.sum(S::Square) = (n = S.count; return n * (n + 1) * (2n + 1) ÷ 6)
@btime sum($s)


s = Square(5)

# Como hacer para que anden estos comandos?

#=
julia> s[1]
ERROR: MethodError: no method matching getindex(::Square, ::Int64)
Stacktrace:
 [1] top-level scope
   @ REPL[87]:1

julia> s[1] + s[1]
ERROR: MethodError: no method matching getindex(::Square, ::Int64)
Stacktrace:
 [1] top-level scope
   @ REPL[89]:1

julia> s[1:2]
ERROR: MethodError: no method matching getindex(::Square, ::UnitRange{Int64})
Stacktrace:
 [1] top-level scope
   @ REPL[90]:1

julia> s[2:end]
ERROR: MethodError: no method matching lastindex(::Square)
Closest candidates are:
  lastindex(::Any, ::Any) at ~/Tools/julia-1.7.3-linux-x86_64/julia-1.7.3/share/julia/base/abstractarray.jl:373
  lastindex(::NamedTuple) at ~/Tools/julia-1.7.3-linux-x86_64/julia-1.7.3/share/julia/base/namedtuple.jl:125
  lastindex(::AbstractArray) at ~/Tools/julia-1.7.3-linux-x86_64/julia-1.7.3/share/julia/base/abstractarray.jl:372
  ...
Stacktrace:
 [1] top-level scope
   @ REPL[91]:1
   =#

# &&
function Base.getindex(S::Square, i::Int)
    1 <= i <= S.count || throw(BoundsError(S, i))
    i * i
end

# Otras maneras:
if !(1 <= i <= S.count)
    throw(BoundsError(S, i))
end

# Para ver:
# Base.firstindex
# Base.lastindex


# ------------------
# Mas ejemplos de definicion de structs
# ------------------

# ------------------
# Creacion de un "package"
# ------------------

# ------------------
# Abstract types algunos ejemplos en librerias (eg. LazySets.jl)
# ------------------
