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
- Estados:

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
	
	caracteres = Dict(Vacio => "", Cruz =>"x", Circulo => "o")

	# Funcion para mostrar el tablero.
	function Base.show(io::IO, ::MIME"text/plain", t::Tablero)
		# TODO Arreglarlo para que los palos queden siempre en el mismo lugar.
		M = t.mat
		palo = "  |  "
		l1 = caracteres[M[1, 1]] * palo * caracteres[M[1, 2]] * palo * caracteres[M[1, 3]]
		l2 = caracteres[M[2, 1]] * palo * caracteres[M[2, 2]] * palo * caracteres[M[2, 3]]
		l3 = caracteres[M[3, 1]] * palo * caracteres[M[3, 2]] * palo * caracteres[M[3, 3]]
		println(l1)
		println("----------")
		println(l2)
		println("----------")
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

	function condicion_ganador(t::Tablero)::Tuple{Bool, Valor}
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

# ╔═╡ de44f512-2ca7-4883-958b-656ca2807164
begin
   t = Tablero()
   @show jugar!(t, 1, 1, Cruz)
   @show jugar!(t, 1, 2, Cruz)
   @show jugar!(t, 1, 3, Cruz)
   # @jugar!(t, 2, 1, Cruz)
   #jugar!(t, 2, 2, Circulo)
   #jugar!(t, 2, 3, Circulo)
   #jugar!(t, 3, 1, Cruz)
   #jugar!(t, 3, 2, Circulo)
   t
end

# ╔═╡ 5671189d-23cd-4c69-bede-50f6c5805472


# ╔═╡ Cell order:
# ╟─eb565804-f5c7-11ed-20ff-ef267c088c93
# ╟─c1864ffd-0dd9-4821-b3ee-ff5751b61b49
# ╠═1aa4dad0-f242-436e-adf6-85dc1edae6a8
# ╠═de44f512-2ca7-4883-958b-656ca2807164
# ╠═5671189d-23cd-4c69-bede-50f6c5805472
