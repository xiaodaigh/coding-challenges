using Primes

function solve58()
    nvals = 1
    nprimes = 0

    pos = BigInt(1)
    step = 2
    while true
        for i in 1:4
            pos += step
            nprimes += isprime(pos)
            nvals += 1
        end
        if nprimes/nvals < 0.1
            return step + 1
        end
        step += 2
    end
end

@time solve58()

