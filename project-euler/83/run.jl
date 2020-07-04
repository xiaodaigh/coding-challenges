includet("C:/git/hacker-rank/project-euler/83/code.jl")

m = open("C:/git/hacker-rank/project-euler/83/p083_matrix.txt") do file
    x = [parse.(Int, split(readline(file), ",")) for i in 1:80]
    reduce(hcat, x)
end

@time solve83(m)

