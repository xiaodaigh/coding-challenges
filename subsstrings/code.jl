grps = parse(Int, readline(stdin))

for grp in 1:grps
    str1 = readline(stdin) |> collect |> Set
    str2 = readline(stdin) |> collect |> Set

    if length(intersect(str1, str2)) > 0
        println("Yes")
    else
        println("No")
    end
end

