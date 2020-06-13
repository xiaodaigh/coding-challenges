using StatsBase: countmap

# number of digits to play with
solve62() = begin
    # number of digits
    nd = 3
    n = 999
    res = []

    cubes = (1:n) .^ 3

    while length(res) == 0
        println(nd)
        while maximum(ndigits, cubes) <= nd
            n += 1000
            cubes = (1:n) .^ 3
        end
        println(n)

        cubes = [c for c in cubes if ndigits(c) == nd]

        # to be possible they must have 5 or more
        # numbers with exactly the same digits

        cdc = countmap.(digits.(cubes)) |> countmap

        res = [val for (val, cnt) in cdc if cnt == 5]
        nd += 1
    end
    res
end