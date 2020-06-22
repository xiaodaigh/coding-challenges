using Primes
isprime(1504170715041707) # false
isprime(4503599627370517) # true

const EULERCOIN = BigInt(1504170715041707)
const MOD =BigInt(4503599627370517)
const INV_EULERCOIN =invmod(BigInt(EULERCOIN), MOD)


function find_step(mincoin)
    rhs = (1:mincoin-1) .+ (MOD - mincoin)
    res = minimum(x->mod(INV_EULERCOIN * x, MOD), rhs)
end


function solve700()
    mincoin = typemax(Int64)
    val = BigInt(0)
    res = BigInt(0)
    i = 1
    while i <= INV_EULERCOIN-1
        if mincoin <= 16_000_000
            steps = find_step(mincoin)
            val += mod(steps*EULERCOIN, MOD)
            val = mod(val, MOD)
            @assert val < mincoin
            i += steps
        else
            val += EULERCOIN
            val = mod(val, MOD)
            i+=1
        end

        if val < mincoin
            res += val
            mincoin = val
            println(val)
            println(res)
        end
    end
    res
end

@time solve700()

