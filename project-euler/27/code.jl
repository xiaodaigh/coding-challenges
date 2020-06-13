using Primes

fn(a,b) = begin
    function(n)
        n^2 + a*n + b
    end
end

isprime(997)
# n is even, a is even = even + even = even
# n is odd, a is even = odd + even = odd

# n is odd, a is odd = odd + odd = even
# n is even, a is odd = even + even = even


fn2 = fn(1, 41)

fn2(1) |> isprime



# a must be odd
# b must be odd
using Base.Iterators: product
solve27() = begin
    max_n = 0
    for (a, b) in product(-999:2:999, primes(3, 997))
        fn2 = fn(a,b)
        n = 0
        while fn2(n) |> isprime
            n+=1
        end
        n -= 1
        if n > max_n
            println("$a $b $n")
            max_n = n
        end
    end
end

@time solve27()

-61*971

