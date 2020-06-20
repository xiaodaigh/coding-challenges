using Primes

ps = primes(1000, 9999)

dict = Dict{Vector{Int}, Vector{Int}}()
for p in ps
    sdp = sort(digits(p))
    if haskey(dict, sdp)
        push!(dict[sdp], p)
    else
        dict[sdp] = [p]
    end
end

dict = [val for (key, val) in dict if length(val) >= 3]

function solve49(dict)
    for vals in dict
        for i in 1:length(vals)
            for j in i+1:length(vals)
                d = vals[j] - vals[i]
                another_prime = vals[j] + d
                if isprime(another_prime)
                    if sort(digits(another_prime)) == sort(digits(vals[j]))
                        return vals[i], vals[j], another_prime
                    end
                end
            end
        end
    end
end

@time solve49(dict)





