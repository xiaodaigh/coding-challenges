using Primes

const FACTOR_LOOKUP = factor.(1:20_000)

const PS = primes(2,  20_000)

const PRIME2IDX = Dict(p=>i for (i,p) in enumerate(PS))

const M = 1_000_000_007

import Base: iterate
import Base.length

function add_factors!(factors, new_factors)
    for (val, pow) in new_factors.pe
        factors[PRIME2IDX[val]] += pow
    end
end

function deduct_factors!(factors, new_factors)
    for (val, pow) in new_factors.pe
        factors[PRIME2IDX[val]] -= pow
    end
end

function factors_pows(n)
    factors = zeros(Int, length(PS))
    new_factors = copy(factors)

    for k in n-1:-1:div(n, 2)+mod(n, 2)
        add_factors!(new_factors, FACTOR_LOOKUP[k+1])
        deduct_factors!(new_factors, FACTOR_LOOKUP[n-k])
        factors .+= new_factors
        if iseven(n)
            if k != div(n, 2)
                factors .+= new_factors
            end
        elseif isodd(n)
            factors .+= new_factors
        end
    end

    factors
end

function sumpowermod(val, pow, m)
    res = 1
    for i in 1:pow
        res = mod(res*val, m) + 1
    end
    res
end

function D(n)
    fp = factors_pows(n)
    res = 1
    pos = findall(>(0), fp)
    vals = PS[pos]
    pows = fp[pos]
    for (val, pow) in zip(vals, pows)
        res *= sumpowermod(val, pow, M)
        res = mod(res, M)
    end
    res
end
