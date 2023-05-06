### A Pluto.jl notebook ###
# v0.19.25

using Markdown
using InteractiveUtils

# ╔═╡ 17180f7c-538e-4a06-9836-49836c7580a7
using DynamicPolynomials

# ╔═╡ 0dfab294-e517-4e76-a4cf-51dbc0367b2c
using TaylorSeries

# ╔═╡ 10bccd56-eba2-11ed-2ddb-b3ec96200e13
md"## Polinomios"

# ╔═╡ 16d3c2ae-79d5-42e0-81dd-9940aaa7fb3b
@polyvar x y

# ╔═╡ 3ba797e7-6793-456b-a4c4-07d86427356c
p(x, y) = (x - y)^2

# ╔═╡ f44eb41d-bfa7-4451-913c-795ee997eb04
g = (x - y)^2

# ╔═╡ c8891d12-31c0-447b-8d76-d75d392b5bf9
p(1, 2)

# ╔═╡ d9c5b7bb-4bfe-41d1-a353-08e417669cc3
p(2, 0)

# ╔═╡ 74401d09-0e40-45ed-8528-f3a9d22b8300
m = monomials(g)

# ╔═╡ 0d63931d-43a8-419a-bb88-8c8c408549b5
exponents(m[1])

# ╔═╡ 89a7238d-11ec-45a9-bb0c-a3e1fb9e169d
coefficients(m[1])

# ╔═╡ a73c03c4-236d-4c08-ae3f-057d721b946a
exponents(m[2])

# ╔═╡ ea8fc105-545c-455c-a8ba-c2c5adccc33d
@polyvar z[1:10]

# ╔═╡ 78cacefb-158c-4ee4-9001-1e864f660485
sum(z)

# ╔═╡ 1a6e407a-2f00-4350-8d94-ac11a6563b69
(1 - prod(z))^3

# ╔═╡ 158e5f6b-9ac8-4701-b0b2-81ffe09685cd
(1 - prod(z))^8

# ╔═╡ 168b25c2-e80b-48ce-998c-20eedc52973f
g

# ╔═╡ 82a1410a-6d41-41b5-93e7-9a2e076b824e
md"## Series de Taylor"

# ╔═╡ d2b5d411-c146-4f2b-a559-dc52727c006f
s = taylor_expand(x -> sin(x) * cos(x)^10 * exp(-x^2), 0, order=10)

# ╔═╡ df6c8171-12de-4267-b5a1-37f0198f09b3
# Define the variables α₁, ..., α₄, β₁, ..., β₄
make_variable(name, index::Int) = string(name, TaylorSeries.subscriptify(index))

# ╔═╡ 205ac376-d17c-48a8-b5e4-f7c3a68f7669
variable_names = [make_variable("α", i) for i in 1:4]

# ╔═╡ 164f36e0-de0e-479e-9e36-7b4be3f13fba
append!(variable_names, [make_variable("β", i) for i in 1:4])

# ╔═╡ d1f12653-5249-4cd4-89db-d81b66f3a995
variable_names

# ╔═╡ 7f2e16e7-78e2-44c6-a26b-04bb4677b5e1
# Create the TaylorN variables (order=4, numvars=8)
a1, a2, a3, a4, b1, b2, b3, b4 = set_variables(variable_names, order=4)

# ╔═╡ 299d34a3-12c9-4958-bf00-64762df1b8f4
cos(a1) * cos(a2)

# ╔═╡ 101a3fe4-9ee3-417a-8fdf-e8595d3ad032
a1

# ╔═╡ febe135d-9ebe-49c8-a230-dd4c134b06b2
begin
	# left-hand side
    lhs1 = a1^2 + a2^2 + a3^2 + a4^2 ;
	lhs2 = b1^2 + b2^2 + b3^2 + b4^2 ;
	lhs = lhs1 * lhs2;

	# right-hand side
    rhs1 = (a1*b1 - a2*b2 - a3*b3 - a4*b4)^2 ;
	rhs2 = (a1*b2 + a2*b1 + a3*b4 - a4*b3)^2 ;
	rhs3 = (a1*b3 - a2*b4 + a3*b1 + a4*b2)^2 ;
	rhs4 = (a1*b4 + a2*b3 - a3*b2 + a4*b1)^2 ;
	rhs = rhs1 + rhs2 + rhs3 + rhs4;
end

# ╔═╡ 04e3a4a6-a9b6-41a5-a02a-8bebde9de03e
lhs == rhs

# ╔═╡ 74130896-9102-4e87-aeb0-3918ece82106
lhs

# ╔═╡ d6b59e5f-5ff2-4f20-9178-a050e9893c5f
rhs

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DynamicPolynomials = "7c1d4256-1411-5781-91ec-d7bc3513ac07"
TaylorSeries = "6aa5eb33-94cf-58f4-a9d0-e4b2c4fc25ea"

[compat]
DynamicPolynomials = "~0.4.6"
TaylorSeries = "~0.14.0"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "7b25b773426082fea05798500adcb2e5bb441b8d"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.CRlibm]]
deps = ["CRlibm_jll"]
git-tree-sha1 = "32abd86e3c2025db5172aa182b982debed519834"
uuid = "96374032-68de-5a5b-8d9e-752f78720389"
version = "1.0.1"

[[deps.CRlibm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e329286945d0cfc04456972ea732551869af1cfc"
uuid = "4e9b3aee-d8a1-5a3d-ad8b-7d824db253f0"
version = "1.0.1+0"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "c6d890a52d2c4d55d326439580c3b8d0875a77d9"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.15.7"

[[deps.Compat]]
deps = ["Dates", "LinearAlgebra", "UUIDs"]
git-tree-sha1 = "7a60c856b9fa189eb34f5f8a6f6b5529b7942957"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.6.1"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.1+0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "d1fff3a548102f48987a52a2e0d114fa97d730f0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.13"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.DynamicPolynomials]]
deps = ["DataStructures", "Future", "LinearAlgebra", "MultivariatePolynomials", "MutableArithmetics", "Pkg", "Reexport", "Test"]
git-tree-sha1 = "8b84876e31fa39479050e2d3395c4b3b210db8b0"
uuid = "7c1d4256-1411-5781-91ec-d7bc3513ac07"
version = "0.4.6"

[[deps.ErrorfreeArithmetic]]
git-tree-sha1 = "d6863c556f1142a061532e79f611aa46be201686"
uuid = "90fa49ef-747e-5e6f-a989-263ba693cf1a"
version = "0.5.2"

[[deps.FastRounding]]
deps = ["ErrorfreeArithmetic", "LinearAlgebra"]
git-tree-sha1 = "6344aa18f654196be82e62816935225b3b9abe44"
uuid = "fa42c844-2597-5d31-933b-ebd51ab2693f"
version = "0.3.1"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.IntervalArithmetic]]
deps = ["CRlibm", "FastRounding", "LinearAlgebra", "Markdown", "Random", "RecipesBase", "RoundingEmulator", "SetRounding", "StaticArrays"]
git-tree-sha1 = "c1c88395d09366dae431556bcb598ad08fa1392b"
uuid = "d1acc4aa-44c8-5952-acd4-ba5d80a2a253"
version = "0.20.8"

[[deps.JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "abc9885a7ca2052a736a600f7fa66209f96506e1"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.4.1"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[deps.MultivariatePolynomials]]
deps = ["ChainRulesCore", "DataStructures", "LinearAlgebra", "MutableArithmetics"]
git-tree-sha1 = "eaa98afe2033ffc0629f9d0d83961d66a021dfcc"
uuid = "102ac46a-7ee4-5c85-9060-abc95bfdeaa3"
version = "0.4.7"

[[deps.MutableArithmetics]]
deps = ["LinearAlgebra", "SparseArrays", "Test"]
git-tree-sha1 = "964cb1a7069723727025ae295408747a0b36a854"
uuid = "d8a4904e-b15c-11e9-3269-09a3773c0cb0"
version = "1.3.0"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "d321bf2de576bf25ec4d3e4360faca399afca282"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.6.0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "d0984cc886c48e5a165705ce65236dc2ec467b91"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.1.0"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "7eb1686b4f04b82f96ed7a4ea5890a4f0c7a09f1"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.RecipesBase]]
deps = ["PrecompileTools"]
git-tree-sha1 = "5c3d09cc4f31f5fc6af001c250bf1278733100ff"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.3.4"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.RoundingEmulator]]
git-tree-sha1 = "40b9edad2e5287e05bd413a38f61a8ff55b9557b"
uuid = "5eaf0fd0-dfba-4ccb-bf02-d820a40db705"
version = "0.2.1"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SetRounding]]
git-tree-sha1 = "d7a25e439d07a17b7cdf97eecee504c50fedf5f6"
uuid = "3cc68bcd-71a2-5612-b932-767ffbe40ab0"
version = "0.2.1"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "Random", "StaticArraysCore", "Statistics"]
git-tree-sha1 = "c262c8e978048c2b095be1672c9bee55b4619521"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.5.24"

[[deps.StaticArraysCore]]
git-tree-sha1 = "6b7ba252635a5eff6a0b0664a41ee140a1c9e72a"
uuid = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
version = "1.4.0"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.1"

[[deps.TaylorSeries]]
deps = ["IntervalArithmetic", "LinearAlgebra", "Markdown", "Requires", "SparseArrays"]
git-tree-sha1 = "b123e0614b0f366e2073c4da7b1367cebda3f579"
uuid = "6aa5eb33-94cf-58f4-a9d0-e4b2c4fc25ea"
version = "0.14.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.12+3"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

# ╔═╡ Cell order:
# ╟─10bccd56-eba2-11ed-2ddb-b3ec96200e13
# ╠═17180f7c-538e-4a06-9836-49836c7580a7
# ╠═16d3c2ae-79d5-42e0-81dd-9940aaa7fb3b
# ╠═3ba797e7-6793-456b-a4c4-07d86427356c
# ╠═f44eb41d-bfa7-4451-913c-795ee997eb04
# ╠═c8891d12-31c0-447b-8d76-d75d392b5bf9
# ╠═d9c5b7bb-4bfe-41d1-a353-08e417669cc3
# ╠═74401d09-0e40-45ed-8528-f3a9d22b8300
# ╠═0d63931d-43a8-419a-bb88-8c8c408549b5
# ╠═89a7238d-11ec-45a9-bb0c-a3e1fb9e169d
# ╠═a73c03c4-236d-4c08-ae3f-057d721b946a
# ╠═ea8fc105-545c-455c-a8ba-c2c5adccc33d
# ╠═78cacefb-158c-4ee4-9001-1e864f660485
# ╠═1a6e407a-2f00-4350-8d94-ac11a6563b69
# ╠═158e5f6b-9ac8-4701-b0b2-81ffe09685cd
# ╠═168b25c2-e80b-48ce-998c-20eedc52973f
# ╟─82a1410a-6d41-41b5-93e7-9a2e076b824e
# ╠═0dfab294-e517-4e76-a4cf-51dbc0367b2c
# ╠═d2b5d411-c146-4f2b-a559-dc52727c006f
# ╠═df6c8171-12de-4267-b5a1-37f0198f09b3
# ╠═205ac376-d17c-48a8-b5e4-f7c3a68f7669
# ╠═164f36e0-de0e-479e-9e36-7b4be3f13fba
# ╠═d1f12653-5249-4cd4-89db-d81b66f3a995
# ╠═7f2e16e7-78e2-44c6-a26b-04bb4677b5e1
# ╠═299d34a3-12c9-4958-bf00-64762df1b8f4
# ╠═101a3fe4-9ee3-417a-8fdf-e8595d3ad032
# ╠═febe135d-9ebe-49c8-a230-dd4c134b06b2
# ╠═04e3a4a6-a9b6-41a5-a02a-8bebde9de03e
# ╠═74130896-9102-4e87-aeb0-3918ece82106
# ╠═d6b59e5f-5ff2-4f20-9178-a050e9893c5f
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
