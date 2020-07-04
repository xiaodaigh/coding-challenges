includet("C:/git/hacker-rank/project-euler/87/code.jl")

using Primes

50_000_000^(1/4)

ps1 = primes(2, 7072)
ps2 = primes(2, 369)
ps3 = primes(2, 85)

function solve87()
    dict = falses(50_000_000)
    for ps1 in ps1
        if ps1^2 + ps2[1]^3 + ps3[1]^4 > 50_000_000
            return sum(dict)
        end
        for ps2 in ps2
            if ps1^2 + ps2^3 + ps3[1]^4 > 50_000_000
                break
            end
            for ps3 in ps3
                key = ps1^2+ps2^3+ps3^4
                if key < 50_000_000
                    dict[key] = true
                else
                    break
                end
            end
        end
    end
    sum(dict)
end

@time solve87()