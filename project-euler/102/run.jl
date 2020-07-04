includet("C:/git/hacker-rank/project-euler/102/code.jl")

triangles = open("c:/git/hacker-rank/project-euler/102/p102_triangles.txt") do file
    [parse.(Int, split(readline(file), ",")) for i in 1:1000]
end

satisfy102(triangles[1])
satisfy102(triangles[2])

@time sum(satisfy102, triangles)

