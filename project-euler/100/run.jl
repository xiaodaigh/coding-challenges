includet("C:/git/hacker-rank/project-euler/100/code.jl")

n = Int128(10)^12+1

find_k(21)
find_k(85+35)
find_k(20)


@time k, n = solve100(n)


@assert k*(k-1) // n*(n-1) == 1/2

