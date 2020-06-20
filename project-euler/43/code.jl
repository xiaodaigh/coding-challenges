# generate all possible numbers
function gen_pandigital_numbers()
    sd = Set(0:9)
    res = collect(0:9)

    l = 1

    for l in 1:9
        tmp = filter(x-> length(digits(x)) == l, res)
        for val in tmp
            sd_reduced = setdiff(sd, digits(val))
            append!(res, 10val .+ sd_reduced)
        end
    end
    res
end

ns = gen_pandigital_numbers()

ns10 = filter(n -> ndigits(n)==10, ns)

inverse_digits(d) = sum(d[k]*10^(k-1) for k=1:length(d))

digits_divisible(dd, pos, d) = mod(reverse(reverse(dd)[pos]) |> inverse_digits, d) == 0

using Primes
solve43(ns) = begin
    ps = primes(2, 17)
    res = 0
    for n in ns
        dn = digits(n)
        ok = true
        for (lo, p) in zip(2:8, ps)
            if !digits_divisible(dn, lo:lo+2, p)
                ok = false
                break
            end
        end
        if ok
            res += n
        end
    end
    res
end

@time solve43(ns10)