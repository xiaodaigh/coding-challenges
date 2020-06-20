using Primes
ps = primes(2, 1_000_000)

function solve50(ps)
    max_len = 0
    for start_point in 1:length(ps)
        n = ps[start_point]
        for j in start_point+1:length(ps)
            n += ps[j]
            if n > 1_000_000
                break
            end
            if isprime(n)
                if j - start_point + 1 > max_len
                    max_len = j - start_point + 1
                    println("$max_len $n $(ps[start_point]) $(ps[j]) ")
                end
            end
        end
    end
    max_len
end

@time solve50(ps)