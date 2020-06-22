@memoize function fib(n)
    if n <= 2
        return BigInt(1)
    else
        return fib(n-1) + fib(n-2)
    end
end

function satisfy104(first18, last18, bool)
    fill!(bool, false)

    dn = digits(first18)

    for d in @view dn[end-8:end]
        if d == 0
            return false
        end
        bool[d] = true
    end

    if all(bool)
        fill!(bool, false)
        dn = digits(last18)
        for d in @view dn[1:9]
            if d == 0
                return false
            end
            bool[d] = true
        end
        all(bool) && return true
    end
    return false
end

get_first_18(n) = div(n, BigInt(10)^(ndigits(n) - 18)) |> Int128
get_last_18(n) = mod(n, BigInt(10)^18) |> Int128

function solve104()
    k = 201
    bool = falses(9)

    n1 = fib(k-1)
    n2 = fib(k)

    first18 = [get_first_18(n1), get_first_18(n2)]
    last18 = [get_last_18(n1), get_last_18(n2)]

    while !satisfy104(first18[2], last18[2], bool)
        first18[1], first18[2] = first18[2], first18[1] + first18[2]
        if ndigits(first18[1]) == ndigits(first18[2])
            first18 = get_first_18.(first18)
        end
        last18[1], last18[2] = last18[2], last18[1] + last18[2]
        if ndigits(last18[1]) == ndigits(last18[2])
            last18 = get_last_18.(last18)
        end
        k += 1
    end
    k
end
