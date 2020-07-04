using Primes

function meh()
    i = 4
    while true
        if isprime(i)
        end
    end
end




includet("C:/git/hacker-rank/project-euler/66/code.jl")

@time find_minx.([3,5,6,7])

D_candidates = setdiff(2:1000, (1:100) .^ 2)

@time findmax(map(find_minx, D_candidates))

x^2 == 1 (mod D)

x = 1 or D-1



D_candidates[751]

778^2+1

2178548422^2 - =1

divrem(BigInt(2178548422)^2 - 1, 778)

x^2 - 1 = D*y^2

(x-1)(x+1) = D * y^2

if x is even
    gcd(x-1, x + 1) = 1
if x is odd
    gcd(x-1, x + 1) = 2

if D >= 2 D must divide (x-1) or (x + 1)

x^2 = 1 + D*y^2

x^2 - D*y^2 = 1 (mod x)

D*y^2 = -1 (mod x)
y^2 = x-1 (mod x)
y^2 = inv(D)*(x-1) (mod x)

# another



mustn't x mod D == 1 or D-1



# x^2 - D*y^2 = 1 (mod D)

# x^2 = 1 (mod D) # x must be of this form

x^2 = D*y^2 + 1


# x^2-Dy^2 = 1

# there are at most ϕ(D) many x's
