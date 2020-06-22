function isbouncy(n)
    dn = digits(n)
    s = 0

    for i in 2:length(dn)
        si = sign(dn[i]-dn[i-1])
        if si != 0
            if s == 0
                s = si
            else
                if si != s
                    return true
                end
            end
        end
    end
    return false
end

function solve112()
    n = 100
    num_bouncy = 0

    while num_bouncy//n != 99//100
        n += 1
        num_bouncy += isbouncy(n)
    end
    n
end

@time solve112()