using Memoize

@memoize function p(n, min_pile_size = 1)
    if n == 0
        return 1
    elseif min_pile_size == n
        return 1
    elseif min_pile_size > n
        return 0
    end
    res = 1 # take all n
    for i in min_pile_size:div(n, 2)
        res += mod(p(n-i, i), 1_000_000)
    end
    res % 1_000_000
end
