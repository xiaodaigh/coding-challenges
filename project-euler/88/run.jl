includet("c:/git/hacker-rank/project-euler/88/code.jl")

using Combinatorics

n = 12

factors_of_n = factor(12)

# generate all possible combinations of
# of factors
indv_factors = make_indv_factors(factors_of_n)


make_all_factor_combn(indv_factors)




# integer partition of powers
ipp = [integer_partitions(power)
    for (_, power) in factors_of_n]

using Base.Iterators: product

factor_combn = []
for pipp in product(ipp...)
    res = [v.^ p for ((v, _), p) in zip(factors_of_n, pipp)]
    push!(factor_combn, res)
end

# each element of factor_combn will multiply
# to form n
factor_combn
