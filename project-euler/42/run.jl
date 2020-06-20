includet("c:/git/hacker-rank/project-euler/42/code.jl")

words = split(readline("C:/git/hacker-rank/project-euler/42/p042_words.txt"), ",")

words = [w[2:end-1] for w in words]


is_triag.(words) |> sum

is_triag("SKY")

is_triag.([1,3,6,10])
