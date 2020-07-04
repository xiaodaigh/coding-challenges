includet("C:/git/hacker-rank/project-euler/64/code.jl")

@time sum(continued_frac ∘ length ∘ iseven, 2:13)

@time sum(iseven.(length.(continued_frac.(2:10_000))))