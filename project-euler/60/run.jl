includet("C:/git/hacker-rank/project-euler/60/code.jl")

descent([3])




using Primes

upper_bound = sum([3, 7, 2503, 25189, 1224709])

const UPPER_BOUND_ARR = [3, 7, 2503, 25189]

# sum((13, 5197, 5701, 6733, 8389)) # to beat 26033 from opensourcesBlog

candidates = primes(6, upper_bound-3-7-11-13)
pushfirst!(candidates, 3)

function find_large_candidates_to_remove(candidates, upper_bound)
    for i in length(candidates):-1:1
        new_num = find_new_number(candidates[i:i], 2, upper_bound)
        if new_num == -1
            println(candidates[i])
            candidates = setdiff(candidates, [candidates[i]])
        end
    end
    candidates
end

reduced_candidates = find_large_candidates_to_remove(candidates, up)

@time cnt = mark_pairs(candidates)




candidates

# try to find pairs that have the property A concat B is prime
@time try_to_find_pairs(candidates)