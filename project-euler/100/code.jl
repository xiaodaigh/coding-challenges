# k*(k-1)/n*(n-1) = 1/2 where n > 10^12
# k*(k-1) = n*(n-1)/2 where n > 10^12

#when does this 1 + 2n*(n-1) have a integer sqrt

#k*(k-1)//(n*(n-1)) = 1/2; where n > 10^12

# k*(k-1) = n*(n-1)/2
# (n/2)/n = 1/2
# ((n/2)-1)/(n-1) > 1/2
# k = n/2
# 1 + 2n*(n-1) = X^2

function precise_sqrt(n)
    apprx_sqrt = floor(Int, sqrt(n))
    dir = 0
    if apprx_sqrt^2 == n
        return apprx_sqrt
    elseif apprx_sqrt^2 > n
        while apprx_sqrt^2 > n
            apprx_sqrt -= 1
        end
        if apprx_sqrt^2 == n
            return apprx_sqrt
        else
            return nothing
        end
    elseif apprx_sqrt^2 < n
        while apprx_sqrt^2 < n
            apprx_sqrt += 1
        end
        if apprx_sqrt^2 == n
            return apprx_sqrt
        else
            return nothing
        end
    end
end

function find_k(n)
    # k^2 - k - rhs = 0
    # k = (-b +/- sqrt(b^2 - 4ac))/2a
    ps = precise_sqrt(1+2*n*(n-1))
    if ps === nothing
        return nothing
    else
        k, r = divrem(ps - 1, 2)
        if  r == 0
            return Int(k)
        end
    end
end

function solve100(startn)
    k = find_k(startn)
    while k === nothing
        if startn % 1_000_000 == 0
            println(startn)
        end
        startn += 1
        k = find_k(startn)
    end
    k, startn
end
