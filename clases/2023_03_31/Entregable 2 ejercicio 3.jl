

function largo_inter_intervalo(A, B)
    I1 = max(A[1], B[1])
    I2 = min(A[2], B[2])
    if I1 < I2
        #print("la interseccion es: (",I1,",",I2,")")
        return I2 - I1
    else
        return 0
    end


end

function area_interseccion(A1, A2, B1, B2)
    return largo_inter_intervalo([A1[1], A2[1]], [B1[1], B2[1]]) * largo_inter_intervalo([A1[2], A2[2]], [B1[2], B2[2]])

end
area_interseccion([0, 0], [5, 5], [1, 1], [6, 6])


function area_union_rectangulos(X1, X2, Y1, Y2)
    area_total = 0
    area_total = ((X2[1] - X1[1]) * (X2[2] - X1[2])) + ((Y2[1] - Y1[1]) * (Y2[2] - Y1[2])) - area_interseccion(X1, X2, Y1, Y2)
    return area_total
end

area_union_rectangulos([0, 0], [5, 5], [1, 1], [6, 6])
