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
        "Proyectos" => "proyectos.md",
        "Entregables" => Any["Entregable 1" => "Entregable1.md"],
        "Herramientas básicas" => Any[
            "Alcance del curso" => "Herramientas/Alcance_del_curso.md",
            "Entorno de desarrollo" => "Herramientas/Entorno_de_desarrollo.md",
            "Primeros pasos en Julia" => "Herramientas/Primeros_pasos_en_Julia.md",
            "Computación numérica" => "Herramientas/Computacion_numerica.md",
            "Computación simbólica" => "Herramientas/Computacion_simbolica.md",
        ],
        "Fundamentos de Julia" => Any[
            "Tipos de datos básicos" => "Fundamentos/Tipos de datos basicos.md",
            "Reglas de alcance" => "Fundamentos/Reglas de alcance.md",
            "Arreglos" => "Fundamentos/Arreglos.md",
            "Gestor de paquetes" => "Fundamentos/Gestor de paquetes.md",
            "Estructuras de datos" => "Fundamentos/Estructuras de datos.md",
            "Funciones" => "Fundamentos/Funciones.md",
            "Mecanismos de evaluacion" => "Fundamentos/Mecanismos de evaluacion.md",
            "Metaprogramación" => "Fundamentos/Metaprogramacion.md",
        ],
        "Patrones de diseño" => Any[
            "Generación de paquetes" => "Patrones/paquetes.md",
            "Patrones para reutilización de código" => "Patrones/reutilizacion.md",
            "Documentación de código" => "Patrones/docs.md",
            "Patrones para performance" => "Patrones/performance.md",
            "Patrones de robustez" => "Patrones/debugging.md",
            "Programación genérica" => "Patrones/programacion_generica.md",
            "Programación paralela" => "Patrones/programacion_paralela.md",
            "Anti-patrones" => "Patrones/antipatrones.md",
        ],
        "Librerías" => Any[
            "Gráficos para publicaciones" => "Ecosistema/graficos_pub.md",
            "Optimización" => "Ecosistema/jump.md",
            "Modelado y simulaciones numericas" => "Ecosistema/sciml.md",
            "Aprendizaje automático" => "Ecosistema/flux.md",
        ],
    ],
)

deploydocs(repo = "github.com/mforets/computacion-cientifica-en-julia.git", push_preview = false)
