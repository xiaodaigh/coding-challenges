spiral = [1]


solve28() = begin
    cnt = 0
    inc = 2
    res = 1
    val = 1
    while inc < 1001
        val += inc
        res += val
        cnt += 1
        if mod(cnt, 4) == 0
            inc += 2
        end
    end
    res
end

solve28()