using Memoize

@memoize function solve493(selected, unselected, nuniq)
    if nuniq == 7
        return 7
    elseif 70 - selected - unselected == 20
        return nuniq
    end
    sp = selected // (selected + unselected)

    return sp*solve493(selected - 1, unselected, nuniq) +
    (1 - sp)*solve493(selected+9, unselected-10, nuniq+1)
end

@time solve493(0, 70, 0)
