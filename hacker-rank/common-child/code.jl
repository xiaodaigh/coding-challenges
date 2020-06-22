function Base.findfirst(c::Char, arr, start)
    for d in start:length(arr)
        c == arr[d] && return d
    end
    return nothing
end

function commonChild_rec!(dict, s1, s2, p1, p2)
    #println("$(s1[p1:end]) $(s2[p2:end])")
    min_findfirst_pos = typemax(Int)

    max_len = 0
    # max_len_achieved_at_pos = 0
    for i in p1:length(s1)
        if (length(s1) - i + 1 < max_len) || (length(s2) - p2 + 1 < max_len)
            break
        end
        l = get(dict, (i, p2), -2)
        if l == -2
            c = s1[i]
            pos = findfirst(c, s2, p2)
            if pos === nothing
                dict[i, p2] = -1
                continue
            end

            if pos < min_findfirst_pos
                min_findfirst_pos = pos
            else
                continue
            end

            l = 1 + commonChild_rec!(dict, s1, s2, i + 1, pos + 1)
            dict[i, p2] = l
        end
        if l > max_len
            max_len = l
            # max_len_achieved_at_pos = i
        end
        # if p2 == 1
        #     if p1 == 1
        #         return max_len
        #     end
        # end
    end

    return max_len
end

function commonChild(s1, s2)
    d = Dict{Tuple{Int, Int}, Int}()
    commonChild_rec!(d, collect(s1), collect(s2), 1, 1)
end