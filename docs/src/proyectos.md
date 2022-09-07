# Proyectos Curso 2022

|Nombre|Título (tentativo)|
|------|------------------|
|Federico Bliman|Patrones de fallas en AEGs|
|Rodrigo Perdomo|x|
|Joaquin Viera|x|
|Mauricio Vanzulli|x|
|Daniel Gomez|x|
|Gerardo Vitale|Modelo numérico de un Muro Trombe|
|Juan Pedro Tarigo|x|

## Idea de proyecto: Expansión de Bernstein implícita

En este proyecto se plantea desarrollar un módulo para el cálculo del rango de polinomios multivariados utilizando la forma de Bernstein implícita, ver [Enclosure Methods for Systems of Polynomial Equations and Inequalities](https://d-nb.info/1028327854/34) de A. P. Smith (2012). Se buscará obtener una performance competitiva respecto del estado del arte. Ver por ejemplo la librería [Kodiak](https://github.com/nasa/Kodiak) de la NASA.

## Idea de proyecto: Reachability para problemas de propagación de ondas

En este proyecto se plantea desarrollar un módulo que permita realizar cálculos de reachability (estados alcanzables) para problemas de propagación de ondas en medios elásticos. El módulo se apoyará en los resultados obtenidos en el artículo de Forets, Freire Caporale, Zerpa (2021), [Combining set propagation with finite element methods for time integration in transient solid mechanics problems](https://dl.acm.org/doi/abs/10.1016/j.compstruc.2021.106699).

## Idea de proyecto: Operaciones con conjuntos no convexos para CPS

La propuesta de este proyecto es contribuir al desarrollo de la librería LazySets con funcionalidades necesarias para trabajar con conjuntos no convexos [1](https://github.com/JuliaReach/LazySets.jl/issues/3047), [2](https://github.com/JuliaReach/LazySets.jl/issues/1895). Se prestará particular atención a métodos necesarios para aplicar LazySets a problemas de control y sistemas ciber-physicos en [3](https://github.com/dionysos-dev/Dionysos.jl), [4](https://github.com/dionysos-dev/Dionysos.jl/issues/171). Como conocimiento previo se requiere [5](https://proceedings.juliacon.org/papers/10.21105/jcon.00097).
