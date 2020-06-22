# find n where 2^n has more than n digits
function find_above(y)
    # y MUST be in (2:9)
    d = 1
    cnt = 0

    val = BigInt(y)

    while true
        if ndigits(val) == d
            println(val)
            cnt += 1
        else
            return cnt
        end
        d += 1
        val *= y
    end
end

find_above.(1:9) |> sum


# x = y^d && d = ceiling(Int, log(10, x))

# log(x) = ceiling(Int, log(10, x)) * log(y)

