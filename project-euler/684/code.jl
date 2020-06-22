using Memoize

@memoize function fib(n)
    if n == 1
        return 1
    elseif n == 0
        return 0
    else
        return fib(n-1) + fib(n-2)
    end
end

S(20)

@time f290 = fib.(2:90)

n = f290[end]
nine9, r = divrem(n, 9)

forty_five = 45
multiplier = 9
d = 1

nine9m = mod(nine9, 1_000_000_007)

cnt9 = mod(9*(nine9m-d), 1_000_000_007)


(nine9m-1)*9 + (nine9m-2)*9*10 + (nine9m-3)*9*10^2




val = mod(9*mod(multiplier*cnt9 + forty_five, 1_000_000_007), 1_000_000_007)



nine9 = nine9*(1+r)
#reduce the power
nine9 = mod(nine9, 1_000_000_006)





t(n) =
    # phase one


    rr = mod(9_999_999_999, 1_000_000_007)

end

function nines(d)
end

function s(n)
    num9, r = divrem(n, 9)

    res = r*10^num9
    for d in num9-1:-1:0
        res += 9*10^d
        res = mod(res, 1_000_000_007)
    end
    res
end

@memoize function S(k)
    if k == 1
        return 1
    end
    return S(k-1) + s(k)
end

# @time s(f290[end])

# @time res = f.(f290
