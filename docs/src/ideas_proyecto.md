# Ideas de proyectos curso 2022

## Expansión de Bernstein implícita

En este proyecto se plantea desarrollar un módulo para el cálculo del rango de polinomios multivariados utilizando la forma de Bernstein implícita, ver [Enclosure Methods for Systems of Polynomial Equations and Inequalities](https://d-nb.info/1028327854/34) de A. P. Smith (2012). Se buscará obtener una performance competitiva respecto del estado del arte. Ver por ejemplo la librería [Kodiak](https://github.com/nasa/Kodiak) de la NASA.

## Reachability para problemas de propagación de ondas

En este proyecto se plantea desarrollar un módulo que permita realizar cálculos de reachability (estados alcanzables) para problemas de propagación de ondas en medios elásticos. El módulo se apoyará en los resultados obtenidos en el artículo de Forets, Freire Caporale, Zerpa (2021), [Combining set propagation with finite element methods for time integration in transient solid mechanics problems](https://dl.acm.org/doi/abs/10.1016/j.compstruc.2021.106699).

## Operaciones con conjuntos no convexos para CPS

La propuesta de este proyecto es contribuir al desarrollo de la librería LazySets con funcionalidades necesarias para trabajar con conjuntos no convexos [1](https://github.com/JuliaReach/LazySets.jl/issues/3047), [2](https://github.com/JuliaReach/LazySets.jl/issues/1895). Se prestará particular atención a métodos necesarios para aplicar LazySets a problemas de control y sistemas ciber-physicos en [3](https://github.com/dionysos-dev/Dionysos.jl), [4](https://github.com/dionysos-dev/Dionysos.jl/issues/171). Como conocimiento previo se requiere [5](https://proceedings.juliacon.org/papers/10.21105/jcon.00097).

## Algoritmo de K-caminos con loops

La propuesta de este proyecto es agregar un algoritmo utilizando la interfaz de [Graphs.jl](https://github.com/JuliaGraphs/Graphs.jl/) que implemente el método de Eppstein para encontrar los K caminos más cortos en un grafo dirigido con pesos. El algoritmo fue publicado en [1](https://www.ics.uci.edu/~eppstein/pubs/Epp-SJC-98.pdf); ver también [2](https://codeforces.com/blog/entry/102085) para un enfoque más incremental en la metodología.
