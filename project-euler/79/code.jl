replies = open("c:/git/hacker-rank/project-euler/79/p079_keylog.txt") do file
    [parse(Int, readline(file)) |> digits |> reverse for i in 1:50]
end

replies = unique(replies)

# using StatsBase
# countmap(reduce(vcat, replies))
# no 4 and 5

# [3,1,9] -> [3,1], [1,9], [3, 9]
function make_criteria(replies)
    dict = Dict{Tuple{Int, Int}, Bool}()
    for r in replies
        dict[r[1], r[3]] = true
        dict[r[2], r[3]] = true
        dict[r[1], r[2]] = true
    end
    dict
end

dict = make_criteria(replies)

function satisfy_all(numb, dict)
    for (lo, hi) in keys(dict)
        lo_pos = findfirst(==(lo), numb)
        hi_pos = findlast(==(hi), numb)
        if lo_pos === nothing
            continue
        elseif hi_pos === nothing
            continue
        else
            if lo_pos > hi_pos
                return false
            end
        end
    end
    return true
end



function add_numb!(numb, n, dict)
    if satisfy_all(vcat([n], numb), dict)
        return vcat([n], numb)
    elseif satisfy_all(vcat(numb, [n]), dict)
        return vcat(numb, [n])
    else
        for i in 1:length(numb)-1
            v = vcat(numb[1:i], [n], numb[i+1:end])
            if satisfy_all(v, dict)
                return v
            end
        end
    end
end

numb = [3, 1, 9]
for i in [2,6,7,8, 0]
    global numb
    numb = add_numb!(numb, i, dict)
end

numb

