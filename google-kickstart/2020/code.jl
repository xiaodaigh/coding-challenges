# T = parse(Int, readline(stdin))


# take P plates
# same as divding P into N parts where N can be 0
# P + N - 1 choose N - 1 possible ways (actually a bit less)
# which is gonna be massive if N is 50 and K is 30 and P <= N*K

# edge case
# [100, 1, 1]
# [200, 1, 1]
# [300, 1, 1]
# P = 4



array_cut_and_pad(arr::Vector{T}, cut_out::Int, pad::Int) where T = begin
    if length(arr) - cut_out < pad
        new_arr = Vector{T}(undef, pad)
        new_arr .= zero(T)
        new_arr[1:length(arr)-cut_out] .= arr[cut_out+1:end]
        return new_arr
    end

    arr[cut_out+1:end][1:pad]
end

function solve(K, P, stacks, case=1)
    p_reduced = P

    # average value
    stacks_taken_from = falses(length(stacks))

    score = 0

    num_plates_taken = zeros(Int, length(stacks))

    done_once = false
    cu_mean = [Float64[]]
    while (p_reduced > 0) & !all(stacks_taken_from)
        if p_reduced < K
            cu_mean = [accumulate(+, stack[1:p_reduced])./(1:p_reduced)  for stack in stacks]
        elseif !done_once
            done_once = true
            cu_mean = [accumulate(+, stack)./(1:K)  for stack in stacks]
        end

        fm = findmax.(cu_mean[.!stacks_taken_from])
        for (i, cu_mean1) in enumerate(cu_mean)
            if stacks_taken_from[i] = false
            end
        end

        maxmean, which_stack = findmax(map(x->x[1], fm))
        stacks_taken_from[which_stack] = true

        # the maximum mean (maxmean) is found in which_stack
        plates_to_take = findfirst(==(maxmean), cu_mean[which_stack])

        num_plates_taken[which_stack] = plates_to_take

        score += sum(stacks[which_stack][1:plates_to_take])

        p_reduced -= plates_to_take
    end

    if p_reduced > 0
        new_K = maximum(length.(stacks) .- num_plates_taken)
        new_stacks = array_cut_and_pad.(stacks, num_plates_taken, new_K)

        return score + solve(new_K, p_reduced, new_stacks, case)
    else
        score
    end
end

# for i in 1:T
#     N, K, P = parse.(Int, split(readline(stdin), " "))

#     stacks = [parse.(Int, split(readline(stdin), " ")) for i in 1:N]

#     println(K, P, stacks, solve(i))
# end



