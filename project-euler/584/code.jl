# this is the simulation approach
# quite slow

using ProjectEulerUtil
using DataConvenience, Statistics
using RollingFunctions
using Base.Iterators: drop
using CircularArrays

function satisfy(v::CircularArray, days, ppl, start_pos)
    l = length(v)
    res = sum(@view v[start_pos:start_pos+days])

    if res >= ppl
        return true
    end

    for upto in start_pos+1:start_pos+days
        res -= v[upto - 1]
        res += v[upto + days]
        if res >= ppl
            return true
        end
    end

    return false
end


function sim!(v, year_len, days, ppl)
    i = 0
    start_pos = 1
    while !satisfy(v, days, ppl, start_pos)
        i += 1
        tmp = rand(1:year_len)
        v[tmp] += 1
        start_pos = tmp - days
    end
    i
end

sims(n) = begin
    res = zero(Int)
    v = CircularArray(zeros(Int, 10))
    for i in 1:n
        res += sim!(v, 10, 1, 3)
        v .= 0
    end
    res
end

using Base.Threads
ok(n) = begin
    tmp_s = zeros(Int64, nthreads())
    @threads for i in 1:nthreads()
        tmp_s[i] += sims(n)
    end
    sum(tmp_s), n*nthreads()
end

@time a, b = ok(100_000_000);

BigInt(a)/BigInt(b)
