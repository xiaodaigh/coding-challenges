includet("c:/git/hacker-rank/project-euler/78/code7.jl")

cache = zeros(Int32, typemax(UInt16), typemax(UInt16))

solve78() = begin
    res = p(i)
    while res != 0
        i += 1
        res = p(i)
        if mod(i, 1000) == 0
            print(i)
        end
    end
    i
end

@time solve78()


function getdist(d1, d2)
    min1, max1 = extrema(d1)
    min2, max2 = extrema(d2)
    @assert min1 > 0 && min2 > 0
    d = zeros(Rational{Int}, max1 + max2)
    for p1 in d1, p2 in d2
        s = p1 + p2
        d[s] += 1
    end
    d .//= length(d1) * length(d2)
    return d
end

NORMALDIST = getdist(1:6, 1:6)

using Base.Iterators: product

x = [1:1, (2:8 for i in 1:5)...]

v = vec([v for v in product(x...) if issorted(v)])

solns = []

for i in 1:length(v)
    for j in i:length(v)
        vi = v[i]
        vj = v[j]
        if getdist(vi, vj) == NORMALDIST
            push!(solns, (vi, vj))
        end
    end
end
