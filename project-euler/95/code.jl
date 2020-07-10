using ProjectEulerUtil, Primes

function compute_chain(n, done)
    chain_length = 0
    spdn = proper_divisors(n) |> sum
    if spdn > 1_000_000
        return -1
    elseif done[spdn]
        return -1
    end
    done[spdn] = true
    println(spdn)
    while spdn != n
        chain_length += 1
        spdn = proper_divisors(spdn) |> sum
        println(spdn)
        if spdn > 1_000_000
            return -1
        elseif done[spdn]
            return -1
        end
        done[spdn] = true
    end
    chain_length
end

function solve95()
    done = primesmask(1_000_000)
    max_chain_length = 0
    smallest_member = -1
    for i in 4:1_000_000
        if !done[i]
            println(i)
            chain_length = compute_chain(i, done)
            if chain_length > max_chain_length
                smallest_member = i
            end
        end
    end
    smallest_member
end

2+2


using DataFrames

a = DataFrame(a = 1:3)

