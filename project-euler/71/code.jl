using ProjectEulerUtil
using Primes

function coprimes(n)
    sieve = trues(n)

    ps = factor(n)
    for (f, _) in ps
        sieve[f:f:end] .= false
    end

    findall(sieve) .// n
end

@time af = coprimes(1_000_000)

log(10, div(UInt128(2)^128-1, 3))

function best_n(n)
    num = div(3*n, 7)
    while gcd(num, n) != 1
        num -= 1
    end
    num // n
end

@time res = best_n.(8:1_000_000)
maximum(res)

inverse_digits(d) = sum(d[k]*BigInt(10)^(k-1) for k=1:length(d))

function solve71(p=1000)
    ok = div(BigInt(3)*BigInt(10)^p, 7)
    max_so_far = 2 // 7
    dok = digits(ok[1]) |> reverse
    for i in 2:length(dok)
        num = reverse(@view dok[1:i]) |> inverse_digits
        num -= 1

        res = num // BigInt(10)^i
        if (denominator(res) <= 1_000_000) && (res > max_so_far)
            max_so_far = res
        end
    end
    max_so_far
end

@time solve71()