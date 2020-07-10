includet("C:/git/hacker-rank/project-euler/125/code.jl")

# @time get_all_palindrome()

# find all palidromic numbers
@time all_palin = filter(is_palindrome, 1:9_999_999)


n= BigInt(1):BigInt(sqrt(10^8))
all_sums = @. BigInt(n*(n+1)*(2n+1)//6)
@time diff = gen_all_diffs(all_sums)


@time solve125(all_palin, diff)



yn + xn = xy

n(x+y) = xy