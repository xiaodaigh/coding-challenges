
s = 1020304050607080900
b = 1929394959697989900

s_sqrt = floor(Int, sqrt(s))

function find_start_s(s_sqrt)
    while s_sqrt^2 <= s
        s_sqrt += 1
    end
    return s_sqrt
end

s_sqrt = find_start_s(s_sqrt)

b_sqrt = floor(Int, sqrt(b))
b_sqrt = find_start_s(b_sqrt)

using Base.Threads

check206(n) = begin
    dn = digits(n)
    (dn[1] == 0) &&
    (dn[3] == 9) &&
    (dn[5] == 8) &&
    (dn[7] == 7) &&
    (dn[9] == 6) &&
    (dn[11] == 5) &&
    (dn[13] == 4) &&
    (dn[15] == 3) &&
    (dn[17] == 2) &&
    (dn[19] == 1)
end

function solve206(lo, hi)
    @threads for n in lo:100:hi
        if check206(n^2)
            println(n)
            return n
        elseif check206((n+40)^2)
            println(n)
            return n
        end
    end
end


lo = 1010101030
hi = b_sqrt
@time res = solve206(lo, hi)