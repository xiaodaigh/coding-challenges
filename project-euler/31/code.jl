const make = 200
const coins = [1, 2, 5, 10, 20, 50, 100]

solve32(make, min_size = 1, dict = Dict{Tuple{Int, Int}, Int}()) = begin
    if make == 0
        return 1
    end

    if haskey(dict, (make, min_size))
        return dict[make, min_size]
    end

    res = 0

    for c in coins
        if (c >= min_size) & (make >= c)
            res += solve32(make - c, c, dict)
        end
    end

    res
end

solve32(200)+1