
## Function to apply "map"
function Cuadrado(A)

    return A^2

end

function Compare(A,numero)

    return A>=numero

end

## Equivalence with R functions
function colSums(m)

    columns = size(m)[2]
    count = zeros(columns)
    for i in 1:columns
        count[i] = sum(m[:,i])
    end
    return count
end

## Equivalence with R functions
function rowSums(m)

    rows = size(m)[1]
    count = zeros(rows)
    for i in 1:rows
        count[i] = sum(m[i,:])
    end
    return count
end

##
function
