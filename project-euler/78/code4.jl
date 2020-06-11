# how many ways are there to split it into 2 piles
# 4 1
# 3 2

# # how many ways are there to split it into 3 piles
# 4 1 0 # not possible
# 3 1 1
# 2 2 1
# 1 1 1 # not possible

# # how many ways are there to split it into 4 piles
# 4 1 0 0 # not possible
# 3 1 1 0 # not possible
# 2 2 1 1
# 1 1 1 1 # not possible

const M = 1_000_000

function p(n, dict = Dict{Tuple{Int, Int}, Int}())
    if n == 1
        return 1
    elseif n == 2
        return 2
    elseif n == 3
        return 3
    end

    res = 4 # piles = n is counted
            # piles = n-1 is counted
            # piles = n-2 is counted
    for piles in 1:n-3
        res += p(n, piles, dict)
        res = mod(res, M)
    end
    res#, dict
end

function p(n, piles, dict)
    @assert n >= piles
    if piles == 1
        return 1
    elseif piles == n
        return 1
    elseif piles == 2
        return n >> 1
    end

    @assert piles >= 3

    if haskey(dict, (n, piles))
        return dict[n, piles]
    end

    res = 0
    max_possible_min_size = div(n, piles)
    for min_size = 1:max_possible_min_size
        new_n = n - min_size # the first pile is this of size min_size
        # counting trick to reduce stuff
        new_n -= (piles - 1)*(min_size - 1)
        res += p(new_n, piles - 1, dict)
        res =  mod(res, M)
    end
    dict[n, piles] = res
    res
end

solve78() = begin
    dict  = Dict{Tuple{Int, Int}, Int}()
    n = 1000
    @time pn = p(n, dict)
    while mod(pn, M) != 0
        n += 1
        pn = p(n, dict)
        if mod(n, 1000) == 0
            println(n, pn)
        end
    end
    pn
end