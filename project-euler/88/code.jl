using Primes

make_indv_factors(factors_of_n) = begin
    indv_factors = Int[]

    for (val, power) in factors_of_n
        append!(indv_factors, [val for i in 1:power])
    end
    indv_factors
end

function make_all_factor_combn(indv_factors, dict = Dict{Vector{Int}, Bool}())
    sort!(indv_factors)
    dict[indv_factors] = true
    if length(indv_factors) == 1
        return
    end

    # combine 2
    l = length(indv_factors)
    tmp_dict = Dict{Vector{Int}, Bool}()
    for i in 1:l
        for j in i+1:l
            reduced_if = vcat(
                indv_factors[1:i-1],
                indv_factors[i+1:j-1],
                indv_factors[j+1:end],
                [indv_factors[i]*indv_factors[j]])

            sort!(reduced_if)

            tmp_dict[reduced_if] = true
        end
    end
    merge!(dict, tmp_dict)

    for (key, _) in tmp_dict
        make_all_factor_combn(key, dict)
    end

    return dict
end
