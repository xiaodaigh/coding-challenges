S(p) = begin
    first_term = 1
    for i in 2:p-5
        first_term *= i
        first_term = mod(first_term, p)
    end

    res = first_term
    new_term = first_term
    for i in p-4:p-1
        new_term *= i
        res += mod(new_term, p)
    end
    mod(res, p)
end

using Primes
ps = primes(5, 100)
@time S.(ps)




using Base.Iterators: drop

solve381() = begin
    ps = primes(5, 10^8)
    res = 0
    for p in ps
        # (p-2) * (n-3)! = 1
        # (n-3)! = inv(p-2)
        n3_factorial = invmod(p-2, p)
        # (n - 3)! = (n-3)*(n-4)!
        # inv(n-3)*(n - 3)! = (n-4)!
        n4_factorial = mod(n3_factorial * invmod(p-3, p), p)
        # (n - 4)! = (n-4)*(n-5)!
        # inv(n-4)*(n - 4)! = (n-5)!
        n5_factorial = mod(n4_factorial * invmod(p-4, p), p)

        res += mod(n3_factorial+n4_factorial+n5_factorial, p)
    end
    res
end

@time solve381()
