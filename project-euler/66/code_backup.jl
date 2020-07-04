
satisfy2(val, D) = begin
    if is_sqr(val)
        x = sqrt(val) |> BigInt
        return mod(x, D) in (1, D-1)
    else
        return false
    end
end

is_sqr(n) = isinteger(sqrt(n))

using Primes
satisfy(x, D) = begin
    @assert D >= 2
    if mod(x-1, D) == 0
        f1 = factor(x+1)
        f2 = factor(div(x-1, D))
    end
    y2, r = divrem(BigInt(x)^2 - 1, D)
    if (r == 0) && (y2 > 0)
        return is_sqr(y2)
    else
        return false
    end
end

function find_minx(D)
    x = 1
    odd = true
    while !satisfy(x, D)
        if odd
            x += D - 2
            odd = !odd
        else
            x += 2
            odd = !odd
        end
    end
    println("$D $x")
    x
end


function find_minx_by_finding_y(D)
    y = BigInt(1)
    while !satisfy(1 + D*y^2, D)
        y+=1
    end
    sqrt(1 + D*y^2) |> Int
end
