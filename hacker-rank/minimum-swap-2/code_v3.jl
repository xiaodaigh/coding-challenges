# simplier_arr
function minimumSwaps(arr)
    moves = 0
    keep_pos = fill(true, length(arr))

    for (pos, a) in enumerate(arr)
        if keep_pos[pos] == true
            keep_pos[pos] = false
            next_pos = a
            chain_length = 0
            while arr[next_pos] != a
                keep_pos[next_pos] = false
                next_pos = arr[next_pos]
                moves += 1
            end
        end
    end

    #keep_pos, moves
    moves
end

fptr = open(ENV["OUTPUT_PATH"], "w")

n = parse(Int32, readline(stdin))

arr = [parse(Int32, k) for k in split(readline(stdin))]

res = minimumSwaps(arr)

write(fptr, string(res)*"\n")

close(fptr)
