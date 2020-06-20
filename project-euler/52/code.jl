function found52(i)
    d = sort(digits(i))
    for j in 2:6
        if sort(digits(j*i)) != d
            return false
        end
    end
    return true
end

function solve52()
    for nd = 2:10
        max_n = sum(9*10^k for k in 0:nd-1)
        for i in 10^(nd-1):div(max_n, 6)
            if found52(i)
                return i
            end
        end
    end
end

@time solve52()