using ProjectEulerUtil

const sd = Set(1:9)

# generate all possible numbers
function gen_numbers()
    res = collect(1:9)

    l = 1

    for l in 1:9
        tmp = filter(x-> length(digits(x)) == l, res)
        for val in tmp
            sd_reduced = setdiff(sd, digits(val))
            append!(res, val .+ (10^l) .* sd_reduced)
        end
    end
    res
end

ns = gen_numbers()

ns3 = [(i,j, i*j) for i in ns2, j in ns2 if (i < j) && (i!=1)]

function ispandigital((i, j, ij))
    di = digits(i)
    dj = digits(j)
    dij = digits(ij)

    if (length(di) + length(dj) + length(dij)) == 9
        uij = union(di, dj, dij)
        return all(>(0), uij) && (length(uij) == 9)
    end
    return false
end

soln32 = [n[3] for n in ns3 if ispandigital(n)]

soln32 |> unique

soln32 |> unique |> sum
