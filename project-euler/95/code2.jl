using Primes
using ProjectEulerUtil

function amicable_next(n)
    sum(proper_divisors(n))
end


function compute_an_once()
    an = Vector{Int}(undef, 1_000_000)
    s = setdiff(2:1_000_000, primes(1_000_000))
    for n in 1:1_000_000
        if isprime(n)
            an[n] = 1
        else
            an[n] = amicable_next(n)
        end
    end
    an
end

function chain(n, visited, max_chain_len, min_val)
    trail = Int[]
    an = n
    while true
        if visited[an]
            for t in trail
                visited[t] = true
            end
            # println("already visted $an")
            return trail, max_chain_len, min_val
        elseif an in trail
            # found a loop
            pos = searchsortedfirst(trail, an)
            chain_len = length(trail) + 1 - pos
            if chain_len >= max_chain_len
                if chain_len == max_chain_len
                    min_val = min(min_val, minimum(trail[pos:end]))
                else
                    min_val = minimum(trail[pos:end])
                end
                max_chain_len = chain_len
                println("$max_chain_len $min_val")
            end
            for t in trail
                visited[t] = true
            end
            return trail, max_chain_len, min_val
        else
            push!(trail, an)
        end
        an = amicable_next(an)
    end
end

function solve95()
    visited = falses(1_000_000)
    # for it to be considered in a chain it must be arrived to by another n
    #  candidate in Set(na)
    an = compute_an_once()

    # if an(n) > 1_000_000 then n can be ignored
    visited[an .> 1_000_000] .= true
    sum(visited)

    # a n is in a chain, if some other n has it
    set_an = Set(an)

    visited[collect(setdiff(1:1_000_000, set_an))] .= true
    visited[12496]

    # set all primes to false
    visited[Primes.primesmask(1_000_000)] .= true

    # if they map to themselves; recall 1 maps to itself
    visited[an .== 1:length(an)] .= true

    visited[1]
    visited[12496]

    # length(visited) - sum(visited)
    max_chain_len, min_val = -1, typemax(Int)
    for n in 1:length(visited)
        if !visited[n]
            _, max_chain_len, min_val = chain(n, visited, max_chain_len, min_val)
        end
    end
    min_val
end