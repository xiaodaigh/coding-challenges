push_pn!(pentagon_numbers) = begin
    n = length(pentagon_numbers) + 1
    push!(pentagon_numbers, div(n*(3n - 1), 2))
end

function gen_pen_numbers(n)
    pentagon_numbers = Int[]
    for i in 1:n
        push_pn!(pentagon_numbers)
    end
    pentagon_numbers
end

is_pentagon(pn) = begin
     #0 = n^2 - n/3 + (-2pn/3)
    # (1/6 + u)(1/6 - u) = -2pn/3
    # 1/36 - u^2 = -2pn/3
    # 1/36 + 2pn/3 = u^2
    root = round(1/6 + sqrt(1/36 + pn/3*2), digits = 0)
    div(root*(3root - 1), 2) == pn
end

solve44() = begin
    pentagon_numbers = BigInt[]
    push_pn!(pentagon_numbers)

    while true
        push_pn!(pentagon_numbers)
        last_num = pentagon_numbers[end]
        for i in @view pentagon_numbers[end-1:-1:1]
            if is_pentagon(last_num - i)
                if is_pentagon(last_num + i)
                    return last_num - i
                end
            end
        end
    end
end

@time solve44()



