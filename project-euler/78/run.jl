includet("c:/git/hacker-rank/project-euler/78/code4.jl")

p(1)
p(2)
p(3)
p(4)
p(5)
p(6)
p(7)
p(8)
using BenchmarkTools
@benchmark p(1000)

@time solve78()


##########################################
# time for a break while the
# solution RUNS
##########################################

# p(5) =
#     p(5, piles = 1) +
#     p(5, piles = 2) +
#     p(5, piles = 3) +
#     p(5, piles = 4) +
#     p(5, piles = 5) +
#     =
#     1 +
#     p(5, piles = 2) +
#     p(5, piles = 3) +
#     p(5, piles = 4) +
#     1 +


# p(5, piles = 2) =
#     p(5, piles = 2, min_size = 1)
#     p(5, piles = 2, min_size = 2)
#     p(5, piles = 2, min_size = 3)
#     =
#     p(5, piles = 2, min_size = 1)
#     p(5, piles = 2, min_size = 2) = p(3, piles = 2) = 2
#     0


# p(4, 1, 1)
# p(4, 2, 1)
# p(4, 3, 1)
# p(4, 4, 1)


# p(5)

# p(4, 1)

# p(5, 1)
# p(5, 1)
# p(5, 2)
# p(5, 3) # =
# p(6, 3, 2)



