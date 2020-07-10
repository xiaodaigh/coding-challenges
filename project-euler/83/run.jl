includet("C:/git/hacker-rank/project-euler/83/code2.jl")

m = open("C:/git/hacker-rank/project-euler/83/p083_matrix.txt") do file
    x = [parse.(Int128, split(readline(file), ",")) for i in 1:80]
    reduce(hcat, x)
end

@time find_shortest_path(m)

