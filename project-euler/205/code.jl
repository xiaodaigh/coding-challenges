function compute_exact_probabililty(nfaces, ndice)
    res = zeros(Rational{Int}, nfaces*ndice)
    res[1:nfaces] .= 1//nfaces
    for i in 2:ndice
        resi = similar(res)
        resi .= 0
        for j in 1:nfaces*(ndice-1)
            for k in 1:nfaces
                resi[j + k] += res[j]//nfaces
            end
        end
        res .= resi
    end
    res
end

function solve205(peter, colin)
    res = 0//1
    for (n, pct) in enumerate(peter)
        res += pct*sum(colin[1:n-1])
    end
    res
end