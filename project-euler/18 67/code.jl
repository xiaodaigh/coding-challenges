lines = open("c:/git/hacker-rank/project-euler/18 67/data.txt") do file
    [parse.(Int, split(l, " ")) for l in eachline(file)]
end

using Base.Iterators: drop
solve(lines) = begin
    result = zeros(Int, length(lines[end]) + 1)
    for line in reverse(lines)
        for (i, elem) in enumerate(line)
            result[i] = elem + max(result[i], result[i+1])
        end
    end
    result[1]
end

solve(lines)

# 67
lines = open("c:/git/hacker-rank/project-euler/18 67/p067_triangle.txt") do file
    [parse.(Int, split(l, " ")) for l in eachline(file)]
end

solve(lines)