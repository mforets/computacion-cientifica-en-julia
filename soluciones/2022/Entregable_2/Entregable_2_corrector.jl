using Test

function testall(src = pwd())
    for (root, dirs, files) in walkdir(src)
        isempty(files) && continue
        idx = findfirst(==("Entregable_2.jl"), files)
        isnothing(idx) && continue

        file = joinpath(root, files[idx])

        header = [
            :(include($file)),
            :(using Test, .Entregable_2),
            :(using .Entregable_2: ADN, ARN, Buffon, CadenaProteica, Aminoacido, estimar_pi, transcribir),
        ]
        defs = [:(Base.:(==)(a::CadenaProteica, b::CadenaProteica) = a.dat == b.dat)]
        body = [
            :(
                function test()
                    @testset "Ejercicio 2.1" begin
                        @test transcribir(ADN("CCTAGGACCAGGTT")) == ARN("UUGGACCAGGAUCC")
                    end

                    @testset "Ejerecicio 2.2" begin
                        @test traducir(ARN("CCU")) == CadenaProteica(Aminoacido[Aminoacido("Pro")])
                        @test traducir(ARN("AUGCCAAAGGGUUGA")) == CadenaProteica(
                            Aminoacido[Aminoacido("Met"), Aminoacido("Pro"), Aminoacido("Lys"), Aminoacido("Gly")],
                        )
                        @test traducir(ARN("GCAAGAGAUAAUUGU")) == CadenaProteica(
                            Aminoacido[
                                Aminoacido("Ala"),
                                Aminoacido("Arg"),
                                Aminoacido("Asp"),
                                Aminoacido("Asn"),
                                Aminoacido("Cys"),
                            ],
                        )
                    end

                    @testset "Ejercicio 2.3" begin
                        @test estimar_pi(Buffon(), 10_000) ≈ π atol = 0.1
                        @test estimar_pi(Buffon(D = 10, L = 8), 10_000) ≈ π atol = 0.1
                        @test estimar_pi(Buffon(D = 4, L = 1), 10_000) ≈ π atol = 0.1
                    end

                end
            ),
        ]

        exs = vcat(header, defs, body)
        name = "E" * string(rand(1:100))
        m = eval(Expr(:toplevel, :(module $(Symbol(name))
        $(exs...)
        end)))

        Base.invokelatest(m.test)
    end
end

testall()

