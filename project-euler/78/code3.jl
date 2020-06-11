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

function p(n)
    if n == 1
        return 1
    elseif n == 2
        return 2
    elseif n == 3
        return 3
    end

    res = 2 # all div(n, min_size) == 1 are counted already
            # min_size = div(n,2) is also counted
    for min_size in 1:div(n, 2)-1
        for piles in 1:div(n, min_size)
            res += p(n, piles, min_size)
        end
    end
    res
end

function p(n, piles, min_size=1)
    """
        split `n` into number of piles = `piles`

        min_size - minimum size of the each pile
    """

    @assert n > 1
    if piles*min_size > n
        # not possible
        return 0
    end

    if min_size > 1
        # clever counting tricky
        n = n - piles*(min_size - 1)
        return p(n, piles, 1)
    end

    @assert min_size == 1

    if piles == 1
        return 1
    elseif piles == n
        return 1
    elseif piles == 2
        return n >> 1
    end

    max_possible_min_size = div(n, piles)

    res = 0
    for first_pile_size in min_size:max_possible_min_size
        res += p(n - first_pile_size, piles - 1, min_size)
    end

    return res
end
