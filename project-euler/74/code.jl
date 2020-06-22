next74(n) = sum(factorial, digits(n))

function chain74(n)
    dict = Dict{Int, Bool}(n=>true)
    chain_length = 1

    n = next74(n)
    while !haskey(dict, n)
        dict[n] = true
        chain_length += 1
        n = next74(n)
    end
    chain_length
end
