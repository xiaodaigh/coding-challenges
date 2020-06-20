using Primes

is_consec4(i) = begin
    for j in 0:3
        if length(factor(i+j)) != 4
            return false
        end
    end
    return true
end

function solve47()
    # four = [1, 1, 1, 1] # 2, 3, 4, 5
    i = 6
    while true
        if is_consec4(i)
            return i
        end
        i += 1
    end
end

@time solve47()

factor(134043)
factor(134044)
factor(134045)
factor(134046)