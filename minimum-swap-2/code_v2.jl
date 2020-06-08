
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

    ak = arr[keep_pos]
    new_arr = similar(ak)
    for (real_rank, pos) in enumerate(sortperm(ak))
        new_arr[pos] = real_rank
    end
    new_arr, perfect_moves

    # sum(keep_pos) - 1 + perfect_moves
end

# simplier_arr, moves_so_far = find_perfect_swap!([7, 1, 3, 2, 4, 5, 6])

find_perfect_swap!([1 3 5 2 4 6 7])



how_long([2, 3, 1, 6, 4, 5], 1)
how_long([2, 3, 1, 6, 4, 5], 2)
how_long([2, 3, 1, 6, 4, 5], 3)
how_long([2, 3, 1, 6, 4, 5], 4)
how_long([2, 3, 1, 6, 4, 5], 5)
how_long([2, 3, 1, 6, 4, 5], 6)


how_long([1, 3, 2, 6, 4, 5], 5)




# simplier_arr[simplier_arr[1]],  simplier_arr[1] = simplier_arr[1], simplier_arr[simplier_arr[1]]

# simplier_arr
function minimumSwaps(arr)
    find_perfect_swap!(arr)
end

fptr = open(ENV["OUTPUT_PATH"], "w")

n = parse(Int32, readline(stdin))

arr = [parse(Int32, k) for k in split(readline(stdin))]

res = minimumSwaps(arr)

write(fptr, string(res)*"\n")

close(fptr)
