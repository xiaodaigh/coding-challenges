includet("C:/git/hacker-rank/project-euler/80/code.jl")

# write some code to "expand" the continued fraction
# using magic table-like method
function solve80()
    res = 0
    for i in setdiff(2:100, (1:10) .^ 2)
        cf = continued_frac(i)
        frac = expand_cf(cf, 1000)
        res += sum(expand_digits(frac))
    end
    res
end

@time solve80()







# bloody hell!! gotta write my own function to expand digits
# use fraction


