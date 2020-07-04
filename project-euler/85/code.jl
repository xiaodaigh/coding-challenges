function count_rect(a, b)
    @assert a <= b
    cnt = 0
    for (x,y) in Iterators.product(1:a, 1:b)
        cnt += (a-x+1)*(b-y+1)
    end
    cnt
end


function solve85()
    nearest_cnt = 2_000_000
    nearest_a = 0
    nearest_b = 0
    a = 1
    b = a
    while true
        while true
            cab = count_rect(a, b)
            if abs(cab - 2_000_000) < nearest_cnt
                nearest_cnt = abs(cab - 2_000_000)
                nearest_a = a
                nearest_b = b
            end
            if cab > 2_000_000
                println("$a $b")
                break
            end
            b+=1
        end
        a += 1
        b = a
        cab = count_rect(a, b)
        if cab > 2_000_000
            if abs(cab - 2_000_000) < nearest_cnt
                nearest_cnt = abs(cab - 2_000_000)
                return a, b
            else
                return nearest_a, nearest_b
            end
        end
    end
end