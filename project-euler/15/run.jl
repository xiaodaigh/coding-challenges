
includet("c:/git/hacker-rank/project-euler/15/code.jl")

cache = Array{Int, 2}(undef, 20, 20)
cache .= 0

calc_val!(cache, 2, 2)

build_cache()