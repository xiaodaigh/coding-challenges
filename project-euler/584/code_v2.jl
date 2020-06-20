# this is the exact approach
# saple the first few move exactly
using Base.Iterators
using ProgressMeter
using CircularArrays


satisfy_all(v, days, ppl) = satisfy_all(CircularArray(v), days, ppl)

function satisfy_all(v::CircularArray, days, ppl)
    l = length(v)
    res = sum(@view v[1:1+days])

    if res >= ppl
        return true
    end

    for upto in 2:l
        res -= v[upto - 1]
        res += v[upto + days]
        if res >= ppl
            return true
        end
    end

    return false
end

identical_upto_circulation(x, y) = begin
    """can I circular y and make it equal to x"""
    ly = length(y)
    @assert length(x) == ly
    cy = CircularArray(y)
    for i in 1:length(y)
        if x == @view cy[i:i+ly-1]
            return true
        end
    end
    return false
end

make_dict(startv, dict = Dict{Vector{Int}, Rational{Int}}(), rat_mult = 1//1) = begin
    l = length(startv)
    for i in 1:l
        v = deepcopy(startv)
        v[i] += 1
        has_identical = false
        for (key, _) in dict
            if identical_upto_circulation(key, v)
                dict[key] += (1 // l) * rat_mult
                has_identical = true
                break
            end
        end
        if !has_identical
            dict[v] = (1 // l) * rat_mult
        end
    end
    dict
end

build_dict(startv_dict, days, ppl) = begin
    new_startv_dict = Dict{Vector{Int}, Rational{Int}}()
    @showprogress for (startv, rat) in startv_dict
        sa = satisfy_all(startv, days, ppl)
        if sa
            new_startv_dict[startv] = rat
        else
            make_dict(startv, new_startv_dict, rat)
        end
    end
    return new_startv_dict
end

@time satisfy_all(zeros(Int, 100), 7, 3);

solve584(year_len, days, ppl) = begin
    done = false
    @time startv_dict = make_dict(zeros(Int, year_len))
    while !done
        @time startv_dict = build_dict(startv_dict, days, ppl)
        println(length(startv_dict))
        @time done_pct = [rat for (startv, rat) in startv_dict if satisfy_all(startv, days, ppl)]
        println(sum(done_pct))
        done = sum(done_pct) == 1
    end
    startv_dict
end
