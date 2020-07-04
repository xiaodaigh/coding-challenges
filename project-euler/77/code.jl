using Memoize
using Primes

@memoize function nways(n, min_prime = 2)
    if n == 0
        return 1
    elseif min_prime > n
        return 0
    end
    res = 0
    ps = primes(min_prime, n)
    for prime in ps
        res += nways(n - prime, prime)
    end
    res
end

function solve77()
    i = 2
    while true
        if nways(i) > 5000
            return i
        end
        i += 1
    end
end