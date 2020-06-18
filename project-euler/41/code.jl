# generate all possible numbers
function gen_numbers()
    res = collect(1:9)

    l = 1

    for l in 1:9
        tmp = filter(x-> length(digits(x)) == l, res)
        for val in tmp
            sd_reduced = setdiff(sd, digits(val))
            append!(res, val .+ (10^l) .* sd_reduced)
        end
    end
    res
end

ns = gen_numbers()


using Primes

@time res = [n for n in ns if isprime(n)]

res = [r for r in res if maximum(digits(r)) == length(digits(r))] |> sort

res[end]
