
meh(n) = begin
    p = [2 for i in 1:n]
    for i in 2:length(p)
        p[i] = nextprime(p[i-1]+1)
    end
    p
end



# find the most economical increase
function find_pos_to_eliminate(ps, factors)
    # try to eliminate largest factor
    last_pos = findlast(>(0), factors)
    last_pos_prime = ps[last_pos]

    min_so_far = log(last_pos_prime)
    inc_pos = 0
    min_pos_prime_power_inc = 0
    for (i, prime) in enumerate(ps)
        prime_power_inc = (factors[i] + 1)*factors[last_pos]

        if prime_power_inc*log(prime) <= min_so_far
            min_pos_prime_power_inc = prime_power_inc
            min_so_far = prime_power_inc*log(prime)
            inc_pos = i
        end
    end
    #inc_pos, max_pos_prime_power_inc, last_pos
    if inc_pos != 0
        factors[inc_pos] += min_pos_prime_power_inc
        factors[last_pos] = 0
        return factors, false
    end
    println("done")
    factors, true
end

solve500(n) = begin
    factors = ones(Int8, n)
    @time ps = meh(length(factors))
    for i in 1:n
        res, done = find_pos_to_eliminate(ps, factors)
        if done
            return res, ps
        end
    end
end

@time powers, ps = solve500(500500)

res = 1
for (prime, power) in zip(ps, powers)
    global res
    for i in 1:power
        res *= prime
        res = mod(res , 500500507)
    end
end

res = mod(res, 500500507)
