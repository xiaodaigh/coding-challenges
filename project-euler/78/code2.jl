# build up a dictionary
const M = 1_000_000

make_dict(n, dict = Dict{Tuple{Int, Int}, Int}()) = begin
    for i in 3:n
        pn!(n, i, dict)
    end
    dict
end

make_large_dict(n) = begin
    dict = Dict{Tuple{Int, Int}, Int}()
    for i in 3:n
        # println(length(dict))
        make_dict(i, dict)
    end
    dict
end

function pn!(n, max_size = n, dict = Dict{Tuple{Int, Int}, Int}())
    if max_size > n
        max_size = n
    end

    if max_size == 1
        return 1
    elseif max_size == 2
        return (n >> 1) + 1
    end

    if haskey(dict, (n, max_size))
        return dict[n, max_size]
    end

    res = 1
    for take_off_size in 2:max_size
        for take_off in take_off_size:take_off_size:n
            if n == take_off
                res += 1
            elseif n > take_off
                res += pn!(n-take_off, take_off_size - 1, dict)
                res = mod(res, M)
            end
        end
    end
    dict[n, max_size] = res
    res
end

function solve78(lim = Inf, dict = Dict{Tuple{Int, Int}, Int}((2, 2) =>1))
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