includet("c:/git/hacker-rank/hacker-rank/common-child/code2.jl")

s1 = readline()
s2 = readline()
println(commonChild(s1, s2))

@time commonChild("SHINCHAN", "NOHARAAA")

s1, s2 = open("c:/git/hacker-rank/hacker-rank/common-child/text.txt") do file
    s1 = readline(file)
    s2 = readline(file)
    s1, s2
end


@time commonChild(s1, s2)

@code_warntype commonChild(s1, s2)

# AZZBCCCCC
# AZZBZCCCC