
p(n) = begin
    val = UInt128(2)^6
    power = 6
    while n > 0
        val *= 2
        power += 1
        nd = digits(val)
        if @view(nd[end-2:end]) == [3, 2, 1]
            n -= 1
            if mod(n, 1000) == 0
                println(n)
            end
        end
        if length(nd) >= 37
            val = div(val, 10)
        end
    end
    power
end

@time p(678910)
