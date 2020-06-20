smallest_r(n) = begin
    for j in 4:div(n, 2)
        if binomial(n, j) > 1_000_000
            return j
        end
    end
end


function solve54()
    res = 0
    for n in 23:100
        r = smallest_r(n)
        # println(r)
        if iseven(n)
            if r == div(n, 2)
                res += 1
            else
                res += 2(div(n,2) - r) + 1
            end
        else
            res += (div(n,2) - r + 1)*2
        end
    end
    res
end

@time solve54()

49 - 4

0 1 2 3 4