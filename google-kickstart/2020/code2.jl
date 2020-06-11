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
        new_arr .= -30*101
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
    while p_reduced > 0
        if p_reduced < K
            cu_mean = [accumulate(+, stack[1:p_reduced])./(1:p_reduced)  for stack in stacks]
        elseif !done_once
            done_once = true
            cu_mean = [accumulate(+, stack)./(1:K)  for stack in stacks]
        end

        fm = findmax.(cu_mean)

        maxmean, which_stack = findmax(map(x->x[1], fm))
        stacks_taken_from[which_stack] = true

        # the maximum mean (maxmean) is found in which_stack
        plates_to_take = findfirst(==(maxmean), cu_mean[which_stack])

        score += sum(stacks[which_stack][1:plates_to_take])
        p_reduced -= plates_to_take

        stacks[which_stack] = array_cut_and_pad(stacks[which_stack], plates_to_take, K)
        if p_reduced >= K
            cu_mean[which_stack] = accumulate(+, stacks[which_stack])./(1:K)
        end
    end

    score
end

2+2

# for i in 1:T
#     N, K, P = parse.(Int, split(readline(stdin), " "))

#     stacks = [parse.(Int, split(readline(stdin), " ")) for i in 1:N]

#     println(K, P, stacks, solve(i))
# end



