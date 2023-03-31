export transcribir

struct ADN
    dat::String
end
struct ARN
    dat::String
end

function transcribir(seq::ADN)
    ARN(reverse(replace(seq.dat, "T" => "U")))
end
