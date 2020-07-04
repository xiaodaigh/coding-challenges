includet("C:/git/hacker-rank/project-euler/54/code.jl")

hands = open("c:/git/hacker-rank/project-euler/54/p054_poker.txt") do file
    res = [decode.(split(readline(file), " ")) for i in 1:1000]
    res1 = [r[1:5] for r in res]
    sort!.(res1)
    res2 = [r[6:10] for r in res]
    sort!.(res2)
    res1, res2
end

@time sum(cmp_hands.(hands[1], hands[2]))

