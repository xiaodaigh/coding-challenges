using Primes
using Memoize

const factors = factor.(1:20_000)

@memoize function factors_n_choose_k(n, k)
    @assert k >= div(n,2)+mod(n,2)
    if n == k
        return Dict{Int, Int}()
    end

    dict = factors_n_choose_k(n-1, k)

    fns = factor.((n, n - k))

    fn = fns[1]
    for (val, pow) in fn.pe
        if haskey(dict, val)
            dict[val] += pow
        else
            dict[val] = pow
        end
    end

    fn = fns[2]
    for (val, pow) in fn.pe
        if haskey(dict, val)
            dict[val] -= pow
        else
            dict[val] = pow
        end
    end

    dict
end

function D(n)
    dict = Dict{Int, Int}()
    for k in n-1:-1:div(n, 2)+mod(n, 2)
        # get the factors for n choose j
        # get n!/j!
        dict1 = factors_n_choose_k(n, k)

        merge!(+, dict, dict1)
    end

    dict
end