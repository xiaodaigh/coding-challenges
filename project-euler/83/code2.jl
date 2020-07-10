""" trying to go from (1,1) to (n, n) """
function find_shortest_path(m)
    i=1
    j=1
    shortest_path = similar(m)
    shortest_path .= sum(m)
    shortest_path[1, 1] = m[1,1]
    return find_shortest_path!(shortest_path, m, i, j)
end

function find_shortest_path!(shortest_path, m, i, j)
    if i < 80 && (shortest_path[i, j] + m[i+1, j] < shortest_path[i+1, j])
        shortest_path[i+1, j] = shortest_path[i, j] + m[i+1, j]
        find_shortest_path!(shortest_path, m, i+1, j)
    end
    if j < 80 && (shortest_path[i, j] + m[i, j+1] < shortest_path[i, j+1])
        shortest_path[i, j+1] = shortest_path[i, j] + m[i, j+1]
        find_shortest_path!(shortest_path, m, i, j+1)
    end
    if i > 1 && (shortest_path[i, j] + m[i-1, j] < shortest_path[i-1, j])
        shortest_path[i-1, j] = shortest_path[i, j] + m[i-1, j]
        find_shortest_path!(shortest_path, m, i-1, j)
    end
    if j > 1 && (shortest_path[i, j] + m[i, j-1] < shortest_path[i, j-1])
        shortest_path[i, j-1] = shortest_path[i, j] + m[i, j-1]
        find_shortest_path!(shortest_path, m, i, j-1)
    end
    shortest_path[end, end]
end


