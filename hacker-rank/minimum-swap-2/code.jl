# Complete the minimumSwaps function below.
how_long(arr, pos) = begin
    new_pos = pos
    steps = 0

    while arr[new_pos] != pos
        new_pos = arr[new_pos]
        steps += 1
    end
    steps
end

# reduce complexity of test cases
# if two elements when swapped will be correct then it's preferred

# [2, 1, 3] swaping [2,1 ] woudl be perfectly
# [2, 4, 5, 4 ,3] in hhere (5, 3) would be perfect swap

find_perfect_swap!(arr) = begin
    perfect_moves = 0
    keep_pos = fill(true, length(arr))

    for (pos, a) in enumerate(arr)
        if a == pos
            keep_pos[pos] = false
        else
            if keep_pos[pos]
                if arr[a] == pos
                    keep_pos[pos] = false
                    keep_pos[a] = false
                    perfect_moves += 1
                end
            end
        end
    end

    # ak = arr[keep_pos]
    # new_arr = similar(ak)
    # for (real_rank, pos) in enumerate(sortperm(ak))
    #     new_arr[pos] = real_rank
    # end

    sum(keep_pos) - 1 + perfect_moves
end

simplier_arr, moves_so_far = find_perfect_swap!([7, 1, 3, 2, 4, 5, 6])


simplier_arr[simplier_arr[1]],  simplier_arr[1] = simplier_arr[1], simplier_arr[simplier_arr[1]]

simplier_arr






function minimumSwaps(arr)
    res = how_long.(Ref(arr), 1:length(arr))
    if all(==(0), res)
        return 0
    end
    minimum([r for r in res if r > 0])
end

fptr = open(ENV["OUTPUT_PATH"], "w")

n = parse(Int32, readline(stdin))

arr = [parse(Int32, k) for k in split(readline(stdin))]

res = minimumSwaps(arr)

write(fptr, string(res)*"\n")

close(fptr)
