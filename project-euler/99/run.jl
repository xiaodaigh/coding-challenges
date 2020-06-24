includet("C:/git/hacker-rank/project-euler/99/code.jl")

m = read99()


@time findmax(map(x->x[2]*log(x[1] |> Float64), m))
