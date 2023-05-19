### A Pluto.jl notebook ###
# v0.19.26

using Markdown
using InteractiveUtils

# ╔═╡ eb565804-f5c7-11ed-20ff-ef267c088c93
md"## Ta-te-ti"

# ╔═╡ c1864ffd-0dd9-4821-b3ee-ff5751b61b49
md"""
Consideraciones:

- Quienes / como jugar? Jugador vs maquina?
- Tablero: como representarlo? <-- matriz
- Estados.

o : jugador circulo
x : jugador cruz
m : jugador 
"""

# ╔═╡ 1aa4dad0-f242-436e-adf6-85dc1edae6a8
begin
    @enum Valor Vacio Circulo Cruz

    struct Tablero
        mat::Matrix{Valor}
    end
    Tablero() = Tablero(fill(Vacio, 3, 3))

    caracteres = Dict(Vacio => " ", Cruz => "x", Circulo => "o")

    # Funcion para mostrar el tablero.
    function Base.show(io::IO, ::MIME"text/plain", t::Tablero)
        # TODO Arreglarlo para que los palos queden siempre en el mismo lugar.
        M = t.mat
        palo = "  |  "
        l1 = " " * caracteres[M[1, 1]] * palo * caracteres[M[1, 2]] * palo * caracteres[M[1, 3]]
        l2 = " " * caracteres[M[2, 1]] * palo * caracteres[M[2, 2]] * palo * caracteres[M[2, 3]]
        l3 = " " * caracteres[M[3, 1]] * palo * caracteres[M[3, 2]] * palo * caracteres[M[3, 3]]
        println(l1)
        println("---------------")
        println(l2)
        println("---------------")
        println(l3)
    end

    function condicion_ganador(M::Matrix, val::Valor)::Bool
        linea = fill(val, 3)
        diag_mayor = [M[1, 1], M[2, 2], M[3, 3]]
        diag_menor = [M[1, 3], M[2, 2], M[3, 1]]

        condicion_fila = any(==(linea), eachrow(M))
        condicion_columna = any(==(linea), eachcol(M))
        condicion_diagonal = any(==(linea), diag_mayor) || any(==(linea), diag_menor)

        condicion_fila || condicion_columna || condicion_diagonal
    end

    function condicion_ganador(t::Tablero)::Tuple{Bool,Valor}
        M = t.mat
        if condicion_ganador(M, Cruz)
            (true, Cruz)
        elseif condicion_ganador(M, Circulo)
            (true, Circulo)
        else
            (false, Vacio)
        end
    end

    function tablero_lleno(t::Tablero)::Bool
        all(x -> x != Vacio, t.mat)
    end

    @enum Resultado Error GanaCruz GanaCirculo Empate JuegoSigue

    function jugar!(t::Tablero, i::Int64, j::Int64, val::Valor)::Resultado
        M = t.mat
        if !(1 <= i <= 3 && 1 <= j <= 3) || (t.mat[i, j] != Vacio)
            # La casilla debe estar vacia.
            return Error
        end

        # Insertar jugada.
        M[i, j] = val

        # Chequear si hay ganador o si hay empate.
        cond = condicion_ganador(t)
        if first(cond)
            last(cond) == Cruz ? GanaCruz : GanaCirculo
        elseif tablero_lleno(t)
            Empate
        else
            JuegoSigue
        end
    end
end

# ╔═╡ 7bdccd4e-50f7-4818-8150-6cf4d08ed2b8
begin
	mutable struct Juego
		tab::Tablero
		jugador::Valor
		maquina::Valor
		estado::Resultado
	end

	function Juego(jugador::Valor)
		T = Tablero()
		if jugador == Cruz
			Juego(T, Cruz, Circulo, JuegoSigue)
		elseif jugador == Circulo
			Juego(T, Circulo, Cruz, JuegoSigue)
		end
	end

	function Base.show(io::IO, ::MIME"text/plain", J::Juego)
		show(io, MIME("text/plain"), J.tab)
	end

	function jugar!(J::Juego, i::Int64, j::Int64)
		# Chequear que el estado actual me permite seguir jugando.
		if J.estado != JuegoSigue
			return J
		end

		# Primero juega el jugador.
		nuevo_estado = jugar!(J.tab, i, j, J.jugador)
		J.estado = nuevo_estado

		# Si el nuevo estado no me permite seguir jugando, devolver el juego.
		if nuevo_estado != JuegoSigue
			return J
		end

		# Luego juega la maquina.
		# Por ahora algo sencillo: elegir un lugar vacio cualquiera.
		lugares_vacios = findall(==(Vacio), J.tab.mat)
		lugar = rand(lugares_vacios)
		imaquina = lugar[1]
		jmaquina = lugar[2]
		nuevo_estado = jugar!(J.tab, imaquina, jmaquina, J.maquina)
		J.estado = nuevo_estado

		return J
	end
end

# ╔═╡ de44f512-2ca7-4883-958b-656ca2807164
begin
    t = Tablero()
    jugar!(t, 1, 1, Circulo)
    jugar!(t, 1, 2, Circulo)
    jugar!(t, 1, 3, Cruz)
    jugar!(t, 2, 1, Cruz)
    jugar!(t, 2, 2, Cruz)
    jugar!(t, 2, 3, Cruz)
    #jugar!(t, 3, 1, Cruz)
    #jugar!(t, 3, 2, Circulo)
    t
end

# ╔═╡ 384740d3-1e6b-4d51-bcf5-cf2496081751
#=
Empezar un juego nuevo. Yo juego con Cruz.
Supongamos por ahora (para simplificar) que siempre empiezo yo.
=#
J = Juego(Circulo)

# ╔═╡ 1653260a-2c53-44bf-9a02-efa19798757d
jugar!(J, 2, 2)

# ╔═╡ 16772578-3871-4805-8985-bb6135a03af8
# jugar!(J, 1, 3)

# ╔═╡ fc06794b-7b96-488c-a2b9-e3045ecd5128
# jugar!(J, 2, 3)

# ╔═╡ d3ec2c33-318a-4e22-a284-5337576ee90a
# jugar!(J, 3, 3)

# ╔═╡ 2267ed02-ce64-4ba3-833f-9e7fb5ad750e
# J.estado

# ╔═╡ 1da20553-5985-407f-a8de-2f306046363e
# jugar!(J, 1, 2)

# ╔═╡ 4df8a2c9-a625-4059-a507-599fbc43c94d
# J.estado

# ╔═╡ Cell order:
# ╟─eb565804-f5c7-11ed-20ff-ef267c088c93
# ╟─c1864ffd-0dd9-4821-b3ee-ff5751b61b49
# ╠═1aa4dad0-f242-436e-adf6-85dc1edae6a8
# ╠═de44f512-2ca7-4883-958b-656ca2807164
# ╠═7bdccd4e-50f7-4818-8150-6cf4d08ed2b8
# ╠═384740d3-1e6b-4d51-bcf5-cf2496081751
# ╠═1653260a-2c53-44bf-9a02-efa19798757d
# ╠═16772578-3871-4805-8985-bb6135a03af8
# ╠═fc06794b-7b96-488c-a2b9-e3045ecd5128
# ╠═d3ec2c33-318a-4e22-a284-5337576ee90a
# ╠═2267ed02-ce64-4ba3-833f-9e7fb5ad750e
# ╠═1da20553-5985-407f-a8de-2f306046363e
# ╠═4df8a2c9-a625-4059-a507-599fbc43c94d
