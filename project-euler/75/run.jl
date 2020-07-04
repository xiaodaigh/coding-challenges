includet("C:/git/hacker-rank/project-euler/75/code.jl")


# if I know
# A^2+B^2=C^2 has more 1 solution
# then these have more than one solution
# 4A^2+4B^2=4C^2
# 9A^2+9B^2=9C^2

using ProgressMeter
using Base.Threads
function solve75()
    confirmed_more_than_one = falses(1_500_000)
    res = zeros(Int, nthreads())
    @threads for i in 12:1_500_000
        if !confirmed_more_than_one[i]
            num_solns = only_one_solution(i)
            if num_solns == 1
                res[threadid()] += 1
            elseif num_solns == 2
                j = 2
                while i*j^2 <= 1_500_000
                    confirmed_more_than_one[i*j^2] = true
                    j += 1
                end
            end
        end
    end
    res
end

@time solve75()

only_one_solution(12)
only_one_solution(20)
only_one_solution(120)