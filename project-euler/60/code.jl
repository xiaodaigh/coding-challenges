using Primes

const ps=(3, 7, 109, 673)

satisfy60(prime, ps)=begin
    if length(ps) == 0
        return true
    end
    for p in ps
        isprime(p*BigInt(10)^ndigits(prime)+prime) || return false
        isprime(prime*BigInt(10)^ndigits(p)+p) || return false
    end
    return true
end

function next_prime_candidate(prime)
    if prime == 3
        # obviously 5 cannot be in the set as
        # an integer of the form XXXXX5 can not be prime
        return 7
    end

    # if prime mod(prime, 3) = 1 then
    # prime + 2 and prime + 4 can't be in the same set
    # as mod(prime + 2, 3) = 0 # as mod(prime + 4, 2) = 0
    try_prime = nextprime(prime + 6)
    while mod(try_prime, 3) != mod(prime, 3)
        try_prime = nextprime(try_prime + 2)
    end
    try_prime
end

function will_set_exceed_upper_bound(set, try_prime, sum_upper_bound)
    if length(set) == 5
        return sum(set) >= sum_upper_bound
    end

    res = sum(set) + try_prime

    val = try_prime
    for i in 1:5 - length(set) - 1
        val = next_prime_candidate(val)
        res += next_prime_candidate(val)
    end
    res >= sum_upper_bound
end

# every time I `descent` I try to add one more prime to the set
# until it's not possible then I return `nothing`
function descent(set)
    # set -  a set of primes in ascending order
    #sum_upper_bound = typemax(Int)
    #sum_upper_bound = 129977413-1 # found by uncomment line above
    sum_upper_bound = 2_000_000 # found before by trying

    max_val = set[end]
    try_prime = max_val

    # try to find the next
    while true
        try_prime = next_prime_candidate(try_prime)
        # if length(set) == 4
        #     if set[end] == 29059
        #         println(try_prime)
        #     end
        # end
        if satisfy60(try_prime, set)
            push!(set, try_prime)
            try_prime = set[end]
            # println(set)
        end

        if will_set_exceed_upper_bound(set, try_prime, sum_upper_bound)
            # println("will_set_exceed_upper_bound $set")
            # go back two steps
            try_prime = set[end-1]
            set = set[1:end-2]
        elseif length(set) == 5
            # found a full set
            if sum(set) < sum_upper_bound
                sum_upper_bound = sum(set)
                println("new_upper_bound discovered $sum_upper_bound $set")
            else
                2+2
                # println("bad news $sum_upper_bound $set")
            end
            try_prime = set[4]
            set = set[1:3]
        end
    end
end

# derive the upper bound as the algorithm goes along
# Insight 1: a number is divisible by 3 iff the sum of its digits
#            are. So the primes in the set must follow either
#               a) mod(prime, 3) == 1, or
#               b) mod(prime, 3) == 2
# because if prime1 and prime2 are in the set and they fall into
# a) and b) then their concatencation must be divisible by 3
function find_solution()
    # 3 can go into either and it doesn't matter
    eq_2_mod_3_primes = Int[]
    eq_1_mod_3_primes = Int[]

    first_prime = next_prime(3)

    # 3 is special and doesn't fall into either a) or b)
    if first_prime != 5
        if first_prime == 3
            set = [3]
        end
        satisfy60(prime, ps)
    end



end


function find_new_number(ps, starting_from, upper_bound)
    sps = sum(ps)
    prime=nextprime(starting_from+1)
    while !satisfy60(prime, ps)
        prime=nextprime(prime+1)
        if prime + sps >= upper_bound
            return -1
        end
    end
    prime
end

function try_to_find_upper_bound(starting_set)
    starting_new_num = 823
    upper_bound = sum((3, 7, 2503, 25189, 1224709))

    while true
        cstarting_set = copy(starting_set)
        tmp2 = starting_new_num
        println(tmp2)
        for i in 1:3
            new_num = find_new_number(cstarting_set, tmp2)
            tmp2 = new_num
            if i == 1
                starting_new_num = nextprime(new_num + 1)
            end
            push!(cstarting_set, new_num)
        end
        println(cstarting_set)
        tmp = sum(cstarting_set)
        if tmp < upper_bound
            upper_bound = tmp
            println("$(sum(cstarting_set)) $cstarting_set")
        end

    end
end



function try_to_find_pairs(candidates)
    triples = Tuple{Int, Int, Int}[]
    not_candidates = Int[]
    upper_bound = sum((3, 7, 2503, 25189, 1224709))

    for i in 1:length(candidates)-4
        found_at_least_one_pair = false
        ci = candidates[i]
        for j in i+1:length(candidates)-3
            cj = candidates[j]
            if isprime(10^ndigits(ci) + cj)
                if isprime(10^ndigits(cj) + ci)
                    possible_soln = [ci, cj]
                    println("$ci, $cj")
                    tmp_prime = nextprime(cj+1)
                    skip = false
                    for k in 1:3
                        new_num = find_new_number(possible_soln, tmp_prime, upper_bound)
                        if new_num == -1
                            skip = true
                            break
                        end
                        push!(possible_soln, new_num)
                        println(possible_soln)
                        # l = 5 - length(possible_soln)
                        # cpossible_soln = copy(possible_soln)
                        # for ll in l+1:5
                        #     push!(cpossible_soln, nextprime(cpossible_soln[end]+1))
                        # end
                        # if sum(cpossible_soln) > upper_bound
                        #     skip = true
                        #     break
                        # end
                        tmp_prime = nextprime(new_num + 1)
                    end
                    if skip
                        break
                    end

                    if sum(possible_soln) < upper_bound
                        println("good news: $(sum(possible_soln)) $possible_soln")
                        upper_bound = sum(possible_soln)
                    else
                        println("bad news: $(sum(possible_soln)) $possible_soln")
                    end
                end
            end
        end
        if !found_at_least_one_pair
            push!(not_candidates, candidates[i])
        end
    end
    pairs, not_candidates
end



function mark_pairs(candidates)
    upper_bound = sum((3, 7, 2503, 25189, 1224709))
    cnt = zeros(Int, length(candidates))
    triples = Tuple{Int, Int, Int}[]
    for i in 1:length(candidates)-1
        for j in i+1:length(candidates)
            if satisfy60(candidates[j], (candidates[i],))
                ci = candidates[i]
                cj = candidates[j]
                new_num = find_new_number([ci,cj], cj, upper_bound)
                if new_num != -1
                    np1 = nextprime(new_num+1)
                    np2 = nextprime(np1+1)
                    if ci+cj+np1+np2+new_num <= upper_bound
                        cnt[i] += 1
                        cnt[j] += 1
                        push!(triples, (ci, cj, new_num))
                        if (cnt[j] >= 4) && (cnt[i] >= 4)
                            println((ci, cj, new_num))
                        end
                    end
                end
            end
        end
    end
    cnt, triples
end
