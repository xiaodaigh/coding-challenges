using Primes

function solve72(n)
    cnt = 0
    for d in 2:n
        if isprime(d)
            cnt += d-1
            continue
        end
        potential_factors = trues(d)
        for (f, _) in factor(d)
            potential_factors[f:f:end] .= false
        end
        cnt += sum(potential_factors)
    end
    cnt
end

solve72(8)

@time solve72(1_000_000)