using Primes
using CircularArrays
using ProjectEulerUtil

ps = primes(101, 1_000_000)

using StatsBase

is_circular_prime(p) = begin
    if !isprime(p)
        return false
    end

    dp = CircularArray(digits(p))
    l = length(dp)

    for i in 2:length(dp)
        new_p = inverse_digits(dp[i:i+l-1])
        if !isprime(new_p)
            return false
        end
    end

    return true
end


sum(is_circular_prime, ps) + 13
