using Memoize

@memoize Dict function p(n, min_size = 1)
    res = 1 # this is the case where we take the whole of n

    for i in min_size:div(n, 2)
        res += p(n - i, i)
    end

    mod(res, 1_000_000)
end
