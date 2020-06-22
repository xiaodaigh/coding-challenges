using Memoize

@memoize function cnt76(n, m = 1)
    if m > n
        return 0
    end
    res = 0
    for i in m:div(n, 2)
        res += 1+cnt76(n-i, i)
    end
    res
end

