function sqrt2_numerator_denominator(n, num=BigInt(1), den=BigInt(2))
    if n == 1
        return num + den, den
    end

    sqrt2_numerator_denominator(n - 1, den, 2*den + num)
end

@time [ndigits(num) > ndigits(den) for (num, den) in map(sqrt2_numerator_denominator, 1:1000)] |> sum


