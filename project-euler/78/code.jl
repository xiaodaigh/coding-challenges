# build up a dictionary
const M = 1_000_000

pn!(n, n_max_sub_pile, dict) = begin
    println(n, n_max_sub_pile)
    if n < n_max_sub_pile
        n_max_sub_pile = n
    end

    if n_max_sub_pile == 1
        return 1
    elseif (n_max_sub_pile == 2)
        return (n >> 1) + 1
    end

    if haskey(dict, (n, n_max_sub_pile))
        println("ok", n, n_max_sub_pile)
        return dict[n, n_max_sub_pile]
    end

    res = 1
    for i in 2:n_max_sub_pile
        if i == n
            res += 1
        else
            res += pn!(n-i, i, dict)
        end
        res = mod(res, M)
    end

    dict[n, n_max_sub_pile] = res
    return res
end

function solve78(lim = Inf, dict = Dict{Tuple{Int, Int}, Int}())
    dict = Dict{Tuple{Int, Int}, Int}()
    n = 1000
    pn = 1
    i = 0
    while (i < lim) && (rem(pn, 1_000_000) != 0)
        n += 1
        i += 1
        pn!(n, n , dict)
        pn = dict[n, n]
        if rem(n, 100) == 0
            println("$n $pn")
        end
    end
    pn#, dict
end