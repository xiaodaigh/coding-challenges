using ProjectEulerUtil
using Primes

n = 4
pd = proper_divisors(n)
pd .+ div.(n, pd)

satisfy357(4)

function satisfy357(n)
    pd = proper_divisors(n)
    t1, t2 = divrem(length(pd)-1, 2)
    for i in 2:1+t1+t2
        isprime(pd[i]+div(n, pd[i])) || return false
    end
    return true
end

function solve357()
    prime = nextprime(4)
    n = prime - 1

    res = BigInt(0)
    while n <= 100_000_000
        if satisfy357(n)
            println(n)
            res += n
        end
        prime = nextprime(prime + 1)
        n = prime - 1
    end
    res
end

@time solve357()