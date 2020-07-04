function continued_frac(n, int_side_kick=0, notation = Int[])
    if isinteger(sqrt(n))
        return Int[-1]
    end
    int_part = floor(Int, sqrt(n) + int_side_kick)
    push!(notation, int_part)
    den = 1
    int_side_kick = int_side_kick - int_part

    dict_den_sk = Dict{Tuple{Int, Int}, Bool}()

    while true
        int_part = floor(Int, den/(sqrt(n) + int_side_kick))
        if haskey(dict_den_sk, (den, int_side_kick))
            return notation
        else
            dict_den_sk[den, int_side_kick] = true
        end
        push!(notation, int_part)

        old_den = den
        den = div(n-int_side_kick^2, old_den)
        int_side_kick = -int_side_kick - int_part*den
    end
end

n=23