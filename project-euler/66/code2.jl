# x^2 - D*y^2 = 1
# => x^2 = 1 + y^2 (mod D-1)
# so we can compute S = (1:D-2)^2 mod (D-1) and store that.
# we can use this to cut down on possible y values, cos y^2 in S and 1+y^2 in S should be rare

# we have x = 1 (mod D)
# we have x = s_y (mod D-1)
# we have x = 1 (mod (D-1)^2)
# so we must ave x = 1 + lcm(D, (D-1)^2) which grow rapidly! In fact
# x = 1 + D((D-1)*k)^2 for some k
# so iterating through k it should be no long before you hit x


possibles_ys(D) = begin
    S = Set(0:1)
    if D >= 3
        S = union(S, mod.((2:D-3) .^ 2, D-1) |> unique)
    end

    intersect(S, [s-1 for s in S])
end

@time possibles_ys(6)
@time possibles_ys(13)

@time possibles_ys(12)

dict_y(D) = begin
    dict = Dict{Int, Vector{Int}}()
    for y in 0:sum(divrem(D-1, 2))
        ymod = powermod(y, 2, D-1)
        if haskey(dict, ymod)
            dict[ymod] = push!(dict[ymod], y)
        else
            dict[ymod] = [y]
        end
    end
    dict
end

dict_y(12)
