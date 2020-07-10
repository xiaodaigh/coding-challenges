function _commonChild(s1, s2, l1, l2, dict)
    if (l1 <= 0) || (l2 <= 0)
        return 0
    else
        dl1l2 = dict[l1, l2]

        if dl1l2 != -1
            return dict[l1, l2]
        end
    end

    res = 0
    cl1 = l1
    cl2 = l2
    ml12 = min(l1, l2)
    for i in 1:ml12
        if s1[l1] != s2[l2]
            break
        end
        res += 1
        l1 -= 1
        l2 -= 1
    end

    res += max(
        _commonChild(s1, s2, l1-1, l2,    dict),
        _commonChild(s1, s2, l1,   l2 -1, dict)
    )

    dict[cl1, cl2] = res
    # if (l1 == length(s1)) && (l2 == length(s2))
    #     return dict
    # end
    res
end

function commonChild(s1, s2)
    c1 = collect(s1) .|> UInt8
    c2 = collect(s2) .|> UInt8
    l1 = length(c1)
    l2 = length(c2)
    dict = zeros(Int, l1, l2)
    dict .= -1
    _commonChild(c1, c2, l1, l2, dict)
end