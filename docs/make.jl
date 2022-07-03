using Documenter, ComputacionCientificaEnJulia

DocMeta.setdocmeta!(
    ComputacionCientificaEnJulia,
    :DocTestSetup,
    :(using ComputacionCientificaEnJulia);
    recursive = true,
)


makedocs(
    format = Documenter.HTML(
        prettyurls = haskey(ENV, "GITHUB_ACTIONS"),
        collapselevel = 1,
        assets = ["assets/aligned.css"],
    ),
    sitename = "Computación Científica en Julia",
    doctest = false,
    strict = false,
    pages = [
        "Generalidades" => "index.md",
        "Herramientas básicas" => Any[
            "Alcance" => "basics/alcance.md",
            "Lenguajes de programación" => "basics/lenguajes.md",
            "Punto flotante" => "basics/punto_flotante.md",
            "Conceptos básicos de Julia" => "basics/conceptos_julia_1.md",
            "Entornos de desarrollo" => "basics/conceptos_julia_2.md",
            "Git" => "basics/git.md",
            "Open source" => "basics/open_source.md",
            "Patrones de diseño" => "basics/patrones.md",
        ],
        "Fundamentos de Julia" => Any[
            "Tipos de datos básicos" => "fundamentos/tipos_basicos.md",
            "Variables" => "fundamentos/variables.md",
            "Arreglos" => "fundamentos/arreglos.md",
            "Módulos" => "fundamentos/modulos.md",
            "Gestor de paquetes" => "fundamentos/pkg.md",
            "Estructuras de datos" => "fundamentos/structs.md",
            "Gráficos" => "fundamentos/graficos.md",
            "Manejo de archivos" => "fundamentos/archivos.md",
            "Tipos concretos y abstractos" => "fundamentos/tipos_1.md",
            "Tipos paramétricos" => "fundamentos/tipos_2.md",
            "Despacho múltiple" => "fundamentos/dispatch.md",
            "Diseño de funciones" => "fundamentos/funciones.md",
            "Evaluación en el sitio" => "fundamentos/evaluacion_1.md",
            "Evaluación perezosa" => "fundamentos/evaluacion_2.md",
            "Interfaces" => "fundamentos/interfaces.md",
            "Macros" => "fundamentos/macros.md",
            "Metaprogramación" => "fundamentos/metaprogramacion.md",
            "Lenguajes específicos de dominio (DSL)" => "fundamentos/dsl.md",
        ],
        "Patrones de diseño" => Any[
            "Generación de paquetes" => "patrones/paquetes.md",
            "Patrones para reutilización de código" => "patrones/reutilizacion.md",
            "Generación de tests" => "patrones/tests.md",
            "Documentación de código" => "patrones/docs.md",
            "Integración continua" => "patrones/ci.md",
            "Patrones para performance" => "patrones/performance.md",
            "Profiling" => "patrones/profiling.md",
            "Patrones de robustez" => "patrones/debugging.md",
            "Programación genérica" => "patrones/programacion_generica.md",
            "Programación paralela" => "patrones/programacion_paralela.md",
            "Anti-patrones" => "patrones/antipatrones.md",
        ],
        "Librerías" => Any[
            "Introducción" => "ecosistema/intro.md",
            "Gráficos para publicaciones" => "ecosistema/graficos_pub.md",
            "Optimización con JuMP" => "ecosistema/jump.md",
            "Modelado y computación científica con SciML" => "ecosistema/sciml.md",
            "Aprendizaje automático con Flux" => "ecosistema/flux.md",
        ],
    ],
)

deploydocs(repo = "github.com/mforets/computacion-cientifica-en-julia.git", push_preview = false)
