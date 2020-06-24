includet("C:/git/hacker-rank/project-euler/81/code.jl")

m = open("C:/git/hacker-rank/project-euler/81/p081_matrix.txt") do file
    m = zeros(Int, 80, 80)
    for i in 1:80
        m[i, :] = parse.(Int, split(readline(file), ","))
    end
    m
end

using Memoize

@memoize function min_path(m, r=1, c=1)
    if (r == 80) & (c==80)
        return m[80, 80]
    elseif r == 80
        return m[r, c] + min_path(m, r, c+1)
    elseif c == 80
        return m[r, c] + min_path(m, r+1, c)
    end
    m[r, c] + min(min_path(m, r+1, c), min_path(m, r, c+1))
end

@time min_path(m)