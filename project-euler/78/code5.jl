using Memoize

# init_cache(n) = begin
#     res = zeros(Int, n)
#     res[1:3] = [1, 2, 3]
#     res
# end

@memoize Dict function p(n)
    @assert n > 0
    if n <= 3
        return n
    end

    res  = p(n-1) + # you can break away one stone and it's back to p(n-1)
            1 # the first s

    # if I break away a first pile
    for first_pile_size in 2:div(n, 2)
        coins_remaining = n - first_pile_size
        # break the remaining coins into `p` piles
        # with minimum pile size = first_pile_size
        # I can use a counting trick to reduce it to reading from cache
        # to break the rest into one pile there is only one way to do it
        for p in 1:div(coins_remaining, first_pile_size)
            new_n = coins_remaining - p*(first_pile_size - 1)
            res += p_by_p(new_n, p)
        end
    end
    mod(res, 1_000_000)
end

@memoize Dict function p_by_p(n, p)
    """break n into p piles"""
    if p == 1
        return 1
    end
    res = 0
    for first_pile_size in 1:div(n, p)
        coins_remaining = n - first_pile_size
        new_n = coins_remaining - (p-1)*(first_pile_size-1)
        res += p_by_p(new_n, p - 1)
    end
    res
end
