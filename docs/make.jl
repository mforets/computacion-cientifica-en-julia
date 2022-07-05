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
            "Alcance del curso" => "Herramientas/Alcance del curso.md",
            "Entorno de desarrollo" => "Herramientas/Entorno de desarrollo.md",
            "Primeros pasos en Julia" => "Herramientas/Primeros pasos en Julia.md",            
            "Computación numérica" => "Herramientas/Computacion numerica.md",
            "Computación simbólica" => "Herramientas/Computacion simbolica.md"
        ],
        "Fundamentos de Julia" => Any[
            "Tipos de datos básicos" => "Fundamentos/Tipos de datos basicos.md",
            "Reglas de alcance" => "Fundamentos/Reglas de alcance.md",
            "Arreglos" => "Fundamentos/Arreglos.md",
            "Gestor de paquetes" => "Fundamentos/Gestor de paquetes.md",
            "Estructuras de datos" => "Fundamentos/structs.md",
            "Gráficos" => "Fundamentos/graficos.md",
            "Manejo de archivos" => "Fundamentos/archivos.md",
            "Tipos concretos y abstractos" => "Fundamentos/tipos_1.md",
            "Tipos paramétricos" => "Fundamentos/tipos_2.md",
            "Despacho múltiple" => "Fundamentos/dispatch.md",
            "Diseño de funciones" => "Fundamentos/funciones.md",
            "Mecanismos de evaluacion" => "Fundamentos/Mecanismos de evaluacion.md",
            "Interfaces" => "Fundamentos/interfaces.md",
            "Metaprogramación" => "Fundamentos/Metaprogramacion.md"
        ],
        "Patrones de diseño" => Any[
            "Generación de paquetes" => "Patrones/paquetes.md",
            "Patrones para reutilización de código" => "Patrones/reutilizacion.md",
            "Generación de tests" => "Patrones/tests.md",
            "Documentación de código" => "Patrones/docs.md",
            "Integración continua" => "Patrones/ci.md",
            "Patrones para performance" => "Patrones/performance.md",
            "Profiling" => "Patrones/profiling.md",
            "Patrones de robustez" => "Patrones/debugging.md",
            "Programación genérica" => "Patrones/programacion_generica.md",
            "Programación paralela" => "Patrones/programacion_paralela.md",
            "Anti-patrones" => "Patrones/antipatrones.md",
        ],
        "Librerías" => Any[
            "Introducción" => "Ecosistema/intro.md",
            "Gráficos para publicaciones" => "Ecosistema/graficos_pub.md",
            "Optimización con JuMP" => "Ecosistema/jump.md",
            "Modelado y computación científica con SciML" => "Ecosistema/sciml.md",
            "Aprendizaje automático con Flux" => "Ecosistema/flux.md",
        ],
    ],
)

deploydocs(repo = "github.com/mforets/computacion-cientifica-en-julia.git", push_preview = false)
