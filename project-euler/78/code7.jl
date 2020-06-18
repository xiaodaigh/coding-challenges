
function p(n, cache)
    res = 1

    for first_pile_size in 1:div(n,2)
        remaining_coins = n - first_pile_size
        res += p(remaining_coins, first_pile_size)
    end

    res
end
