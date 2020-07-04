using ProjectEulerUtil
using Primes

function n_fracs(d)
    sieve = trues(d)
    fd = factor(d)
    for (f, _) in fd
        sieve[f:f:end] .= false
    end

    res = 0
    for (i, s) in enumerate(sieve)
        if s
            if 1//3 < i//d < 1//2
                res += 1 end
        end
    end
    res
end