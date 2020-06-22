using ProjectEulerUtil
using Primes

n = 2
pd = proper_divisors(n)
okk= pd .+ div.(n, pd)
t1, t2 = divrem(length(pd)-1, 2)
okk[2:1+t1+t2]


function satisfy357(n)
    pd = proper_divisors(n)
    t1, t2 = divrem(length(pd)-1, 2)
    for i in 2:1+t1+t2
        isprime(pd[i]+div(n, pd[i])) || return false
    end
    return true
end

function solve357()
    prime = nextprime(3)
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
    res + 1 # is for 1
end

@time solve357()