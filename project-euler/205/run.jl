includet("C:/git/hacker-rank/project-euler/205/code.jl")

peter = compute_exact_probabililty(4, 9)
colin = compute_exact_probabililty(6, 6)

@time solve205(peter, colin)

float(ans)