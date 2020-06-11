function solve(denominator, numerator = 1, remainder = Dict{Int, Bool}(1=>true), repeat_cnt = 0)

    if numerator < denominator
        return solve(denominator, 10numerator, remainder, repeat_cnt)
    end

    d, r = divrem(numerator, denominator)
    repeat_cnt += length(digits(d, base=10))
    if (r == 0) || haskey(remainder, r)
        return repeat_cnt
    else
        remainder[r] = true
        return solve(denominator, r, remainder, repeat_cnt)
    end
end