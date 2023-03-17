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

## Markdown

Markdown es otro lenguaje que utilizaremos a menudo para escribir notas y documentación. Además, la plataforma Zulip que utilizaremos para comunicarnos
también soporta Markdown. Recomendamos seguir [este tutorial](https://docs.github.com/es/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#lists) para familiarizarse com el formato.

## VSCode

Se puede descargar VSCode para distintos sistemas [aqui](https://code.visualstudio.com/download). 

!!! note "Alternativa: VSCodium"
    Existe una version del software llamada [VSCodium](https://vscodium.com/), donde el archivo binario se desarrolla de manera abierta, otorgando asi un mayor control a los usuarios relativo a la telemetria / uso de datos.

Instrucciones sobre la extension de Julia para VSCode se encuentran [aqui](https://www.julia-vscode.org/), en particular ver la documentacion de [Julia in VSCode](https://www.julia-vscode.org/docs/stable/).

## Control de revisión con git

Git es una herramienta de control de versiones de código de forma distribuida.

Trabaja con ramas (`branches`), que permiten generar proyectos divergentes de un proyecto principal. Git permite fusionar de manera muy eficiente una determinada rama al proyecto principal.

Al trabajar de forma distribuida, los clientes generan una réplica exacta del proyecto en su computadora local. Esto evita la pérdida de avances frente a problemas de conectividad con la red, como sucede en los sistemas centralizados.

Además, permite la reproducibilidad del paquete desarrollado, para proporcionar su versión exacta en publicaciones y poder así reproducir los resultados reportados, o si se detectaron bugs, detectar cuándo fueron introducidas.

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

### Agregar un archivo al repo

Si agregamos un archivo llamado `<nombre_del_archivo>` a la carpeta y hacemos:

```
$ git status
```

veremos git reconoce que se han hecho cambios. Un mensaje del estilo "Untracked files..." nos dice que git detectó que se ha creado un nuevo archivo pero, a menos que ejecutemos `git add`, git no hará nada con dicho archivo.

### Área/Entorno de `stage` y `commits`

Un `commit` es un registro de todos los cambios realizados desde el último `commit` que se hizo. Se puede recuperar el estado del proyecto al punto de cualquier `commit`.

Las modificaciones del repo que incluimos en un `commit` son todos aquellos que fueron colocados previamente en el área de `stage`.

Para agregar un archivo a un `commit`, debemos hacer:

```
$ git add <nombre_del_archivo>
```

Una vez agregados todos los archivos que se quiera al área de `stage`, se le puede pedir a git qeue los agregue a un `commit`.

### Agregar un archivo al entorno `stage`

Una vez que se agregó el archivo `<nombre_del_archivo>` al `stage`, se pueden ver los cambios con el comando `$ git status`. Sin embargo, estos cambios aún **no** han sido agregados al `commit`.

### Crear un `commit`

Un `commit` se crea con la siguiente instrucción:

```
$ git commit -m "mensaje"
```

El `"mensaje"` debe ser una breve y representativa descripción del contenido del `commit`. Esto es muy importante, ya que el registro de `commits` perdura por siempre (a menos de que haya una razón clara de por qué eliminar un `commit`).

### Crear una nueva `branch` (rama)

A menos de que se trate de un repo personal, no colaborativo, y que estemos completamente seguros de que queremos incluir modificaciones sobre su contenido, es crucial trabajar en una nueva `branch` (rama). Por ejemplo, si estamos explorando el desarrollo de una feature del paquete de software, pero no queremos modificar el paquete principal o tememos "romperlo" con estos cambios, podemos hacerlo trabajando en una nueva `branch`.

Una vez desarrollada la nueva feature, podemos fusionar nuestra `branch` de trabajo con la rama principal u "oficial" del repo (`master branch`). Esto se hace con el comando `merge`.

El siguiente comando crea una nueva `branch` llamada `<nombre_de_la_nueva_branch>` y además nos posiciona en ella:

```
$ git checkout -b <nombre_de_la_nueva_branch>
```

Se ejecuta el comando `$ git branch`, podrá ver la lista de `branches` creadas y verificar que se creó la nueva `branch`. Verá que la `branch` en la que está posicionado está señalada con un asterisco ($^*$`nombre_de_la_nueva_branch`).

Apuntamos que, estrictamente, Git trata a todas las `branches` por igual. Sin embargo, siempre existe una `branch` principal u "oficial", que, aunque se puede [renombrar](https://github.com/github/renaming), se llama `master`.

Mientras no hallamos hecho `merge` de los cambios en nuestra `branch`, si nos movemos a la princial, haciendo

```
$ git checkout master
```

allí no veremos ninguno de dichos cambios.

### Crear un nuevo repositorio en GitHub

GitHub nos permite trabajar en un proyecto de manera colaborativa. Para comenzar, debemos generar un nuevo repo en GitHub. Esto se hace, una vez loggeados, debajo del menú denotado con el símbolo `+` arriba a la derecha, donde dice `New repository`.

GitHub nos dará la opción de crear un nuevo repo desde cero (from scratch) o subir lo que ya creamos localmente hasta ahora, en nuestra computadora. Para hacer esto último, debemos ir a la sección "…or push an existing repository from the command line" y seguir las instrucciones que figuran. Estas son, desde la carpeta principal de nuestro proyecto local:

```
$ git remote add origin <https://github.com/mi_nombre_de_usuario_en_GitHub/nombre_del_repo_creado_en_GitHub.git>
$ git push -u origin master
```

En este punto, el repo de GitHub contiene nuestra `branch` principal (`master`), pero queremos además subir el `commit` que habíamos creado en la `branch` `<nombre_de_la_nueva_branch>`.

### `push` de la `branch` a GitHub

Para permitir que otras personas puedan visualizar los cambios hechos en una `branch` y que, eventualmente, le hagan `merge` a la `branch` principal, se debe ejecutar el siguiente comando:

```
$ git push origin <nombre_de_la_nueva_branch>
```

De esta manera, GitHub creará automáticamente la `branch` `<nombre_de_la_nueva_branch>` en el repo remoto, con todos los cambios incluidos en el `commit` que habíamos generado.

La palabra `origin` es un alias que Git creó y que contiene la URL del repo remoto, es decir, `https://github.com/mi_nombre_de_usuario_en_GitHub/nombre_del_repo_creado_en_GitHub.git`.

El paso siguiente es acceder a la página de GitHub y veremos un anuncio que nos da la opción `Compare & pull request`.

### `pull request` (PR)

Un `pull request` (`PR`) es la forma de alertar a los propietarios del repo de que deseamos hacer cambios sobre él. Le asignamos un nombre y una breve descripción al `PR` y vamos a `Create pull request`.

Si vamos al `PR`, veremos que tenemos la opción `Merge pull request`, que significa que hacemos el `merge` de los cambios en la `branch` a `master`. Si somos propietarios o co-propietarios de un repo, no es necesario crear un `PR` antes de hacer `merge` de nuestra `branch`, aunque siempre es una buena práctica crear un `PR` para tener mejor seguimiento de la evolución del repo.

### `merge` un PR

Si clickeamos en `Merge pull request`, los cambios de nuestra `branch` serán fusionados en `master` y, luego, es una práctica eliminar la `branch` en la que estaba trabajando. Cuando hay demasiadas `branches`, el repo se vuelve algo "caótico". En la misma página en la que hicimos el `merge`, veremos un botón que dice `Delete branch`.

Para verificar que nuestros cambios se han incluido en `master`, podemos ir a la pestaña `Commits` y veremos que "Merge pull request #n" es el que aparece primero (donde n es el número del `PR` que hicimos `merge`).

Además, en la misma pestaña `Commits` veremos, junto a cada `commit`, su `hash code`. Este `hash` es un identificador que es único para cada `commit`. Por ejemplo, si deseamos deshacer cambios y recuperar el estado del proyecto hasta un determinado `PR`, cuyo `hash` es `código_hash`, debemos ejecutar:

```
$ git revert <código_hash>
```

### Traer los cambios de GitHub a nuestra computadora (`pull`)

Luego de realizar los cambios explicados hasta ahora, veremos que nuestro repo local es diferente al remoto, ya que hay cambios a los que se les hicieron `merge` a `master`. Para traer esos cambios, así como los de cualquier otro usiario, a nuestro repo local, debemos usar el comando `pull`:

```
$ git pull origin master
```

Al ejecutar esta instrucción, veremos la lista cambios realizados respecto a nuestra previa versión del repo.

Para ver la lista de los `commits` nuevos, podemos ejecutar:

```
$ git log
```

y los veremos ordenados según la fecha de modificación (primero los más recientes).

(Previamente nos debimos haber movido a la `branch` `master`: `$ git checkout master`).

Con el siguiente comando creamos un alias para la instrucción que nos permite visualizar el grafo de modificaciones en el repo:

```
$ git config --global alias.graph "log --all --graph --decorate --oneline"
```

Ahora, haciendo `$ git graph`, tendremos una representación de la estructura de `branches` o grafo del repo, y junto a cada `commit` se muestra una abreviación del `hash` correspondiente (7 caracteres en lugar del total de 40 caracteres).

### Resolución de colisiones

Las colisiones o conflictos se generan cuando una misma porción de código se intenta modificar desde dos `branches` diferentes, es decir, se desea hacer `git merge`. La resolución de estas colisiones consiste en especificarle a Git qué versión debe mantener.

Cree un archivo `materiales.txt` en la rama principal de su repo (`master`), con el siguiente contenido:

```plaintext
- mochila
- cuaderno
```

Cree dos `branches`: una llamada `quiero_lapiz` y otra llamada `quiero_lapicera`:

```bash
$ git branch quiero_lapiz
$ git branch quiero_lapicera
```

En cada `branch` haremos un cambio diferente del mismo archivo. En la rama `quiero_lapiz` agregue el material "lapiz" a la lista de materiales. Por otro lado, el la lista `quiero_lapicera`, en lugar de agregar "lapiz", agregue "lapicera" (recuerde que en cada caso debe hacer `$ git add <nombre_del_archivo>` y `$ git commit -m "<mensaje>"`). Una vez hechos los cambios, compruebe las diferencias con `master`:

```bash
$ git diff master quiero_lapiz
$ git diff master quiero_lapicera
```

Supongamos que ahora queremos incorporar los cambios en `quiero_lapiz` a `master`:

```bash
$ git checkout master
$ git status
$ git merge quiero_lapiz
```

Supongamos ahora que queremos agregar los cambios de `quiero_lapicera` al nuevo estado de `master`:

```bash
$ git merge quiero_lapicera
```

Veremos que Git ha encontrado un conflicto (de lo contrario, hubiese creado un `merge commit` automáticamente):

```bash
$ git status
```

Git no va a tomar ninguna decisión, sino que es el usuario quién debe hacerlo. Sin embargo, Git nos da claras instrucciones sobre cómo hacerlo. Abra el archivo conflictivo (`materiales.txt`), por ej.:

```bash
$ cat materiales.txt
```

También puede ver las especificaciones de los conflictos con:

```bash
$ git diff
```

aunque `git diff` solo muestra los fragmentos conflictivos.

Git inserta los identificadores `<<<<<<<` para el estado actual y `>>>>>>>` para los cambios propuestos (además, `=======` oficia de separador).

En este momento, pueden darse dos situaciones: (a) deseamos abortar el `merge`, o (b) deseamos resolver el conflicto.

#### (a) Abortar el `merge`

Puede suceder que no podamos resolver el conflicto hasta comunicarnos con algún colega. En ese caso, podemos abortar el `merge` y restaurar el repo a `HEAD` (estado que tenía en el último `commit`):

```bash
$ git merge --abort
```

#### (b) Resolución del conflicto de forma manual

Veamos cómo resolver el conflicto de forma manual (en la práctica, podremos también hacerlo con herramientas como VSCode o GirtKraken). Los pasos son los siguientes (puede ayudarse de `$ git graph` para ver la estrucutra de ramas en cada etapa):

- Ver el status del repo con `$ git status` y `$ git diff`.
- Editar el archivo (`materiales.txt`) y editarlo con las modificaciones que se deseen (incluso pueden mantenerse los cambios propuestos en ambas `branches` o hasta eliminar ambos). Se deben quitar los identificadores (`<<<<<<<`, `>>>>>>>` y `=======`).
- Repetir el primer paso para revisar el nuevo status del repo: `$ git status` y `$ git diff`.
- Indicar a Git que ya hemos resuelto el conflicto: `$ git add materiales.txt`.
- Volver a inspeccionar el status del repo: `$ git status`.
- Realizar el `commit` del merge. Alcanza ejecutar `$ git commit`.


### Preguntas:

- ¿Qué sucede con el conflicto detectado si en las dos `branches` se hubiesen hecho los mismos cambios?
- Suponga que desde la `branch` `quiero_lapiz` hace el `commit` de sus cambios y luego, *desde esa misma* `branch` crea una nueva `branch` que llama `quiero_lapicera`. Luego, desde `quiero_lapicera` agrega nuevos cambios y procede a hacer su `commit`. Si ahora hace `merge` de ambas `branches`, ¿qué conflicto detecta?

### Comandos útiles

Una lista de los comandos básicos de git se puede encontrar en [este link](https://es.wikipedia.org/wiki/Git#%C3%93rdenes_b%C3%A1sicas).

## Referencias

- [Documentacion de Julia](https://docs.julialang.org/en/v1/)
- [Foro de Julia](https://discourse.julialang.org/)
- [Introduction to version control with Git](https://coderefinery.github.io/git-intro/)

---

## Entregable 1

!!! warning "Entrega"
    Se debe entregar un archivo .ZIP llamado `Entregable_1` que contenga un archivo de Julia (`.jl`) por cada ejercicio `Ejercicio1.jl`, `Ejercicio2.jl`, etc. Fecha límite de entrega: Jueves 23 de marzo.

#### 1.

Escribir un programa que imprima en pantalla:

- Los enteros de 1 hasta 100.
- Los multiplos de 2 entre 1 y 100.
- Los multiplos de 5 entre 1024 y 1200.

#### 2. 

Alberto vende cursos de programación online y los promociona con un gasto fijo de 200usd en publicidad. Por cada alumno que compra un curso Alberto gana U$S12. Escribir una función `f(x)` que modele los ingresos de alberto si `x` es la cantidad de alumnos que compran su curso.

#### 3.

Escribir un programa que dada una cadena de caracteres (`String`) imprima todas las combinaciones posibles de tres letras. Por ejemplo para la palabra "sol" el output seria:

```julia
julia> combinaciones("sol")
6-element Vector{String}:
 "sol"
 "slo"
 "osl"
 "ols"
 "lso"
 "los"
```

#### 4. 

Dado un angulo $\theta$ escribir su respectiva matriz de rotación (2x2). Calcular la imagen del vector `[1, 0]` cuando teta toma valores entre [0, pi/2, pi, 1]`.

#### 5. 

Al comienzo de 2023 Juana deposita $C$ pesos en un banco con una taza de interés $r$ (entre $0$ y $1$).La capitalizacion es continua. Escribir una funcion $g(C,r,x)$ que modele el interés. ¿Si $C = 100000$ y $r = 0.05$, cuánto es el capital de Juana pasados 18 meses?
