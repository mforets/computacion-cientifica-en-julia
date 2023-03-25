# libreria para trabajar con figuras geometricas: LazySets.jl
using LazySets
using Plots

# articulo:
# https://proceedings.juliacon.org/papers/10.21105/jcon.00097

p = VPolygon([[0.0, 0.0], [1.0, 0.0], [0.0, 1.0], [1.0, 1.0]])

plot(p)

v = VPolygon([[0.0, 0.0], [1.0, 0.0], [0.5, 1.0]])

plot!(v)

# ||.||_2 
b = Ball2([0.0, 0.0], 1.0)

plot(b, ratio = 1.0)

