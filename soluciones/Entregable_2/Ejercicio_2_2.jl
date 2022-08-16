export traducir

struct Aminoacido
    dat::String
end
struct CadenaProteica
    dat::Vector{Aminoacido}
end

function tabla_aminoacidos()
    T = Dict((("GUU", "GUC", "GUA", "GUG") .=> "Val")...,
        (("GCU", "GCC", "GCA", "GCG") .=> "Ala")...,
        (("GAU", "GAC", "GAA", "GAG") .=> "Asp")...,
        (("GGU", "GGC", "GGA", "GGG") .=> "Gly")...,
        (("UUU", "UUC") .=> "Phe")...,
        (("UUA", "UUG") .=> "Leu")...,
        (("UCU", "UCC", "UCA", "UCG") .=> "Ser")...,
        (("UAU", "UAC") .=> "Tyr")...,
        (("UGU", "UGC") .=> "Cys")...,
        "UGG" => "Trp",
        (("CUU", "CUC", "CUA", "CUG") .=> "Leu")...,
        (("CCU", "CCC", "CCA", "CCG") .=> "Pro")...,
        (("CAU", "CAC") .=> "His")...,
        (("CAA", "CAG") .=> "Gln")...,
        (("CGU", "CGC", "CGA", "CGG", "AGG", "AGA") .=> "Arg")...,
        (("AUU", "AUC", "AUA") .=> "Ile")...,
        "AUG" => "Met", # Start
        (("ACU", "ACC", "ACA", "ACG") .=> "Thr")...,
        (("AAU", "AAC") .=> "Asn")...,
        (("AAA", "AAG") .=> "Lys")...,
        (("CGU", "CGC") .=> "Ser")...,
        (("CGA", "CGG") .=> "Arg")...)

    return Dict(a => Aminoacido(b) for (a, b) in T)
end

const CODON_TERMINACION = ["UAA", "UAG", "UGA"]
const AMINOACIDOS = tabla_aminoacidos()

function traducir(seq::ARN)
    # Dividir en grupos de a tres (aminoacidos).
    vec = [seq.dat[i:(i+2)] for i in 1:3:length(seq.dat)]
    result = CadenaProteica(Aminoacido[])
    for v in vec
        v ∈ CODON_TERMINACION && break
        push!(result.dat, AMINOACIDOS[v])
    end
    return result
end
