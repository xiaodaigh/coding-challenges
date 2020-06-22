struct CCIndex
    idx::NTuple{26, Vector{Int}}

    CCIndex(s) = begin
        idx = ntuple(_ -> Int[], 26)
        for (i, c) in enumerate(s)
            push!(idx[Int(c) - 64], i)
        end
        new(idx)
    end
end

function Base.findfirst(c::Char, idx::CCIndex, start)
    idxc = idx[c]
    l = length(idxc)
    if l == 0
        return nothing
    end
    res = searchsortedfirst(idxc, start)
    if res > length(idx[c])
        return nothing
    end
    idxc[res]
end

Base.getindex(idx::CCIndex, c::Char) = idx.idx[Int(c) - 64]

function commonChild_rec!(dict, s1, s2, p1, p2, idx2)
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
            pos = findfirst(c, idx2, p2)
            if pos === nothing
                continue
            end

            if pos < min_findfirst_pos
                min_findfirst_pos = pos

                # max_len_achieved_at_pos - pos + 1
            else
                continue
            end

            l = 1 + commonChild_rec!(dict, s1, s2, i + 1, pos + 1, idx2)
            dict[i, p2] = l
        end
        if l > max_len
            max_len = l
            # max_len_achieved_at_pos = pos
        end
    end

    return max_len
end

function commonChild(s1, s2)
    d = Dict{Tuple{Int, Int}, Int}()
    cs2 = collect(s2)
    idx2 = CCIndex(cs2)
    commonChild_rec!(d, collect(s1), cs2, 1, 1, idx2)
end