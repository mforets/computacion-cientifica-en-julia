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

## Referencias

- [Documentacion de Julia](https://docs.julialang.org/en/v1/)
- [Foro de Julia](https://discourse.julialang.org/)


---

## Ejercicios
