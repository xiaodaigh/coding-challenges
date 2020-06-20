using Primes

function totient_count(n)
    if isprime(n)
        return n-1
    end
    res = trues(n)
    for f in factor(n)
        res[f[1]:f[1]:n] .= false
    end
    sum(res)
end

@time tc = totient_count.(6:1_000_000);

@time tc = totient_count(1_000_000)

res = 1
p = 2
while res*p < 1_000_000
    global res, p
    res *= p
    p = nextprime(p+1)
end
res