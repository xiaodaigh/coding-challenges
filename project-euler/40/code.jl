meh() = begin
    res=1
    di = 0
    for i in 1:1_000_000
        for d in reverse(digits(i))
            di += 1
            if di in Set(10 .^ (0:6))
                res *= d
            end
        end
    end
    res
end

@time meh()
