# Entorno de desarrollo

## Instalación de Julia

Para utilizar Julia en el curso recomendamos descargar la ultima version estable para su sistema de la [pagina de descargas](https://julialang.org/downloads/). Luego se deben seguir las indicaciones de acuerdo a su plataforma [como se describe aqui](https://julialang.org/downloads/platform/).

Recomendamos chequear que la instalacion es correcta abriendo el programa `julia` desde la consola.

En cuanto al entorno de desarrollo, recomendamos VSCode. Ver [instrucciones de instalacion aqui](https://www.julia-vscode.org/docs/stable/gettingstarted/). Mas adelante estudiaremos a fondo como utilizar VSCode.

Los contenidos de esta pagina se pueden seguir sin problema desde la terminal, y de hecho es lo que recomendamos, para afianzar el uso del REPL. Para incluir un archivo se utiliza el comando `include`. Por ejemplo, primero creemos el archivo `hola.jl` que solo llama al comando `println` de Julia para imprimir la cadena de caracteres "Hola, mundo!":

```bash
$ echo 'println("Hola, mundo!")' > hola.jl

$ cat hola.jl
println("Hola, mundo!")
```
Para correr el programa en Julia, podemos pasarlo como argumento:

```bash
$ julia hola.jl
Hola, mundo!
$
```
Luego de correr el programa, estamos de nuevo en la linea de comandos. No obstante, podemos cargar el archivo sin cerrar la sesion (REPL) de Julia, primero cargando `julia` y luego utilizando `include` como se muestra a continuacion:

```bash
$ julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.7.2 (2022-02-06)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia> include("hola.jl")
Hola, mundo!
```

### Numeros y aritmetica

Empecemos por utilizar Julia como una calculadora...

```@example
1 + 1
```

## VSCode

### Formato automático

## Control de revisión con git

Git es una herramienta de control de versiones de código de forma distribuida.

Trabaja con ramas (`branches`), que permiten generar proyectos divergentes de un proyecto principal. Git permite fusionar de manera muy eficiente una determinada rama al proyecto principal.

Al trabajar de forma distribuida, los clientes generan una réplica exacta del proyecto en su computadora local. Esto evita la pérdida de avances frente a problemas de conectividad con la red, como sucede en los sistemas centralizados.

### Git y GitHub

Git es una herramienta de código abierto diseñada por Linus Torvald (creador de Linux), sobre el sistema operativo Linux, para el control de versiones de código.

Por otro lado, GitHub (cuyo propietario es Microsoft desde 2018), es una plataforma de desarrollo colaborativo para alojar proyectos utilizando el sistema de control de versiones Git. En particular, Git se puede utilizar sin contar con GitHub, pero no al revés. Sin embargo, usar herramientas como GitHub hacen más sencillo el intercambio de código con otros desarrolladores. GitLab y BitBucket son otras plataformas similares a GitHub.

💾 [Instalación de Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

🚀 [GitHub](https://github.com/)

🐙 [GitKraken Client (interfaz gráfica de Git)](https://www.gitkraken.com/)

### Crear un repositorio local de git

El primer paso para crear un nuevo proyecto, es crear un nuevo repositorio (repo). Para esto, nos movemos a la carpeta donde estamos trabajando:

```
$ cd miproyecto/
```

y ejectuamos el comando [`git init`](https://git-scm.com/docs/git-init):

```
$ git init
```

### Subir un archivo al repo

### Área de `stage` y `commits`

### Agregar un archivo al entorno `stage`

### Crear una nueva `branch` (rama)

### Crear un nuevo repositorio en GitHub

### `push` de la `branch` a GitHub

### `pull request` (PR)

### `merge` un PR

### Traer los cambios de GitHub a nuestra computadora (`pull`)







## Referencias

- [Documentacion de Julia](https://docs.julialang.org/en/v1/)
- [Foro de Julia](https://discourse.julialang.org/)


---

## Ejercicios
