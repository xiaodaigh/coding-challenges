# naive solution
# compute ϕ(n) for all n < 10^7 = 10million

using Primes

# get all factors of n
# using a prime sieve to count ϕ
# function ϕ(n)
#     f = factor(n)
#     coprime = trues(n)
#     for (val, _) in f
#         coprime[val:val:end] .= false
#     end
#     sum(coprime)
# end

function solve70()
    minn = 1
    ratio = typemax(Int64)
    for n in 2:10^7
        t = totient(n)
        if sort!(digits(t)) == sort!(digits(n))
            new_ratio = n/t
            if new_ratio < ratio
                ratio = new_ratio
                minn = n
            end
        end
    end
    minn
end