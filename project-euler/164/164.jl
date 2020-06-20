using OffsetArrays
# dict the 3digits
dict3() = begin
    res = OffsetArray{Int}(undef, 0:9, 0:9)
    res .= 0

    for i = 0:900
        di = digits(i, pad = 3)
        if sum(di) < 10
            res[di[end], di[end-1]] += 1
        end
    end
    res
end

dict4(prev_res, verbose=false) = begin
    res = OffsetArray{Int128}(undef, 0:9, 0:9)
    res .= 0

    for i = 0:9
        for j = 0:9-i
            res[i,j] = sum(prev_res[j, 0:9-i-j])
        end
    end
    res
end

solution164(n) = begin
    res = dict3()
    for i = 4:n
        res = dict4(res)
    end
    res
end

using BenchmarkTools
@benchmark sum(solution164(20)[1:9, :])
