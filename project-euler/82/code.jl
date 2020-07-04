using Memoize

@memoize function min_path_cost(start_row, start_col, M)
    if start_col == 80
        return M[start_row, start_col]
    end
    min_costs = Vector{Int}(undef, 80)
    for i in 1:start_row
        min_costs[i] = sum(M[i:start_row, start_col]) + min_path_cost(i, start_col+1, M)
    end
    for i in start_row+1:80
        min_costs[i] = sum(M[start_row:i, start_col]) + min_path_cost(i, start_col+1, M)
    end
    minimum(min_costs)
end

function solve82(M)
    min_costs = Vector{Int}(undef, 80)
    for r in 1:80
        min_costs[r] = min_path_cost(r, 1, M)
    end
    minimum(min_costs)
end