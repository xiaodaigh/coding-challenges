using Memoize

@memoize Dict function sqr_digit_chain(n)
    if n in (1, 89)
        return n == 89
    else
        res = sum(x->x^2, digits(n))
        return sqr_digit_chain(res)
    end
end

@time sum(sqr_digit_chain, 1:10_000_000)