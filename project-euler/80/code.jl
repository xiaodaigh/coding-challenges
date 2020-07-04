# how to obtain the first 100 digits? of sqrt(n)
#  We can use continued fraction methods to expand the
#  digits.
function expand_digits(frac, dts = Int[])
    if length(dts) >= 100
        return dts
    end
    if numerator(frac) > denominator(frac)
        d, r = divrem(numerator(frac), denominator(frac))
        append!(dts, digits(d) |> reverse)
        return expand_digits(10r//denominator(frac), dts)
    else
        push!(dts, 0)
        return expand_digits(10frac, dts)
    end
end

function expand_cf(cf, repeated_n)
    # repeated_n    this control how many times the continued fraction is
    # expanded
    integer_part = cf[1]
    repeated_part = cf[2:end]



    res = BigInt(repeated_part[end]) // 1
    for r in Iterators.drop(reverse(repeated_part), 1)
        res = r + 1//res
    end

    for i in 2:repeated_n
        for r in reverse(repeated_part)
            res = r + 1//res
        end
    end
    integer_part + 1//res
end

function continued_frac(n, int_side_kick=0, notation = Int[])
    if isinteger(sqrt(n))
        return Int[-1]
    end
    int_part = floor(Int, sqrt(n) + int_side_kick)
    push!(notation, int_part)
    den = 1
    int_side_kick = int_side_kick - int_part

    dict_den_sk = Dict{Tuple{Int, Int}, Bool}()

    while true
        int_part = floor(Int, den/(sqrt(n) + int_side_kick))
        if haskey(dict_den_sk, (den, int_side_kick))
            return notation
        else
            dict_den_sk[den, int_side_kick] = true
        end
        push!(notation, int_part)

        old_den = den
        den = div(n-int_side_kick^2, old_den)
        int_side_kick = -int_side_kick - int_part*den
    end
end
