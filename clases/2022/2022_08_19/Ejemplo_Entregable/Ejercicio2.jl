using Distributions

export mi_funcion_2

function mi_funcion_2(x)
    rand(Normal()) * x
end

function mi_function_3(x::A)
    1
end
