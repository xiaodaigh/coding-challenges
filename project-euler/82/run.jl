includet("C:/git/hacker-rank/project-euler/82/code.jl")

const M = open("c:/git/hacker-rank/project-euler/82/p082_matrix.txt") do f
    res = [reshape(parse.(Int, split(readline(f), ",")), 1, 80) for i in 1:80]
    reduce(vcat, res)
end

@time solve82(M)