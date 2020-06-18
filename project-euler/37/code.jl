using Primes, ProjectEulerUtil

is_truncatable_prime(n) = begin
    if !isprime(n)
        return false
    end

    dn = digits(n)
    for i in 2:length(dn)
        if !isprime(inverse_digits(dn[i:end]))
            return false
        end
    end

    for i in 1:length(dn)-1
        if !isprime(inverse_digits(dn[1:end-i]))
            return false
        end
    end

    return true
end

solve37() = begin
    res = 0
    p = nextprime(8)
    found = 0
    while found < 11
        if is_truncatable_prime(p)
            println(p)
            res += p
            found += 1
        end
        p = nextprime(p+1)
    end
    res
end

@time solve37()
