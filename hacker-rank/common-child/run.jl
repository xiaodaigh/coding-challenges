includet("c:/git/hacker-rank/hacker-rank/common-child/code.jl")

s1 = readline()
s2 = readline()
println(commonChild(s1, s2))

@time commonChild("SHINCHAN", "NOHARAAA")

file =open("c:/git/hacker-rank/hacker-rank/common-child/text.txt")
s1 = readline(file)
s2 = readline(file)
close(file)

@time commonChild(s1, s2)

# AZZBCCCCC
# AZZBZCCCC