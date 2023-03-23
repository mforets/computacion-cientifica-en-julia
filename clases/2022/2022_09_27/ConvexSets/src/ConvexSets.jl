module ConvexSets

abstract type ConvexSet end

struct Interval{N}
    a::N
    b::N
    function Interval(a::N, b::N) where {N}
        a ≤ b || throw(ArgumentError("The first argument should be smaller or equal than the second argument."))
        new{N}(a, b)
    end
end

end # module
