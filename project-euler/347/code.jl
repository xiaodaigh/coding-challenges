using Primes
function M(p,q,N, log_q_N = log(q, N))
    @assert p < q

    max_q_pow = floor(Int, log_q_N - log(q, p))
    max_n = 0
    for q_pow in 1:max_q_pow
        q_powered = q^q_pow
        max_p_pow = floor(Int, log(p, N/q_powered))

        n = q_powered * p^max_p_pow
        if n > max_n
            max_n = n
        end
    end
    println("$p $q $max_n")
    return max_n
end

function S(N)
    res = 0

    ps::Vector{Int} = primes(2, div(N, 2))

    # filter out the 3x > N, so the biggest possible for them is 2x
    ps3 = filter(x->3x>N, ps)
    res += sum(2 .* ps3)

    ps = filter(x->3x <= N, ps)

    # filter out the 4x > N, so the biggest possible for them is 3x
    ps3 = filter(x->4x>N, ps)
    res += sum(2 .* ps3)
    res += sum(3 .* ps3)

    ps = filter(x->4x <= N, ps)

    # filter out the 5x > N, so the biggest possible for them is 4x
    ps3 = filter(x->5x>N, ps)
    res += sum(4 .* ps3)
    res += sum(3 .* ps3)
    ps = filter(x->5x <= N, ps)

    # return [(i,j) for (i,j) in Iterators.product(ps, ps) if (i < j) && (i*j) < N]

    log_q_N = log.(ps, N)

    for i in 1:length(ps)-1, j in i+1:length(ps)
        res += M(ps[i], ps[j], N, log_q_N[j])
    end
    res
end

function solve347(n)
    fs = factor.(filter(x->!isprime(x), 2:n))
    fs2 = filter(x->length(x) == 2, fs)

    dict = Dict{Tuple{Int, Int}, Int}()
    for tmp in fs2
        fs = collect(tmp)
        if haskey(dict, (fs[1][1], fs[2][1]))
            dict[fs[1][1], fs[2][1]] = max(dict[fs[1][1], fs[2][1]], prod(tmp))
        else
            dict[fs[1][1], fs[2][1]] = prod(tmp)
        end
    end
    sum(values(dict))
end