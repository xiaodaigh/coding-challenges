inverse_digits(d) = sum(d[k]*BigInt(10)^(k-1) for k=1:length(d))

function is_palindrome(i::Integer)
    di = digits(i)
    for j in 1:div(length(di), 2)
        if di[j] != di[end - j + 1]
            return false
        end
    end
    return true
end

is_lychrel(n, lvl = 1) = begin
    dn = digits(n)
    rdn = reverse(dn)
    sumd = inverse_digits.((dn, rdn)) |> sum
    println(sumd)
    if is_palindrome(sumd)
        return false
    else
        if lvl + 1 > 50
            return true
        else
            return is_lychrel(sumd, lvl + 1)
        end
    end
end

function solve55()
    res = 0
    for i in 1:10_000
        res += is_lychrel(i)
    end
    res
end

is_lychrel(196)

@time solve55()