using Base.Iterators: product

calc_val!(cache, i, j) = begin
    if i > j
        return calc_val!(cache, j, i)
    end

    if i == 0
        return 1
    end

    # if not cached then print it
    if cache[i, j] == 0
        if (i == 1) & (j == 1)
            cache[1,1] = 2
        else
            cache[i, j] = calc_val!(cache, i-1, j) + calc_val!(cache, i, j-1)
        end
    end

    cache[i, j]
end

build_cache() = begin
    cache = Array{Int, 2}(undef, 20, 20)
    cache .= 0

    for i in 1:20
        for j in i:20
            calc_val!(cache, i, j)
        end
    end
    cache[20, 20]
end



solve(n, m, cache) = begin
    return solve(n-1, m, cache) + solve(n, m-1, cache)
end