using Primes

function is_there_prime_sqr(n, ps)
    for prime in ps
        if prime < n
            i = floor(Int, sqrt(div(n - prime, 2)))
            if (prime + 2*i^2) == n
                return true
            end
        end
    end
    return false
end

function solve46()
    ps = [2]
    n = 3
    while true
        if isprime(n)
            push!(ps, n)
        else
            if !is_there_prime_sqr(n, ps)
                return n
            end
        end
        n += 2
    end
end

@time solve46()

