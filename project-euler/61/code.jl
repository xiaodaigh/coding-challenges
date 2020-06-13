# let's reduce the set
using DataFrames
using Combinatorics


# I am going to start somewhere and try to find something

make_df(numbers_set) = begin
    numbers = DataFrame()

    for (i, ns) in enumerate(numbers_set)
        df = DataFrame([ns], [:val])
        df[:type] = [i for j in 1:nrow(df)]
        dd = digits.(df[:val])
        for j in 1:4
            df[Symbol("digit$j")] = [dd[j] for dd in dd]
        end
        append!(numbers, df)
    end

    numbers
end

solve61(numbers_set) = begin
    numbers = make_df(numbers_set)
    type_checks = [:type]
    new_numbers = deepcopy(numbers)
    new_numbers[:for_merge_digit1] = new_numbers[:digit1]
    new_numbers[:for_merge_digit2] = new_numbers[:digit2]


    for step in 1:5
        numbers2 = deepcopy(numbers)[[:val, :type, :digit1, :digit2, :digit3, :digit4]]
        rename!(numbers2, :val=>Symbol("val$step"))
        rename!(numbers2, :type=>Symbol("type$step"))
        push!(type_checks, Symbol("type$step"))

        rename!(numbers2, :digit3=>:for_merge_digit1)
        rename!(numbers2, :digit4=>:for_merge_digit2)
        rename!(numbers2, :digit1=>:new_for_merge_digit1)
        rename!(numbers2, :digit2=>:new_for_merge_digit2)

        new_numbers = innerjoin(new_numbers, numbers2, on = [:for_merge_digit1, :for_merge_digit2])

        for (tc1, tc2) in combinations(type_checks, 2)
            new_numbers = new_numbers[new_numbers[:, tc1] .!= new_numbers[:, tc2], :]
        end
        select!(new_numbers, Not(:for_merge_digit1))
        select!(new_numbers, Not(:for_merge_digit2))
        rename!(new_numbers, :new_for_merge_digit1 => :for_merge_digit1)
        rename!(new_numbers, :new_for_merge_digit2 => :for_merge_digit2)
    end
    new_numbers
end





