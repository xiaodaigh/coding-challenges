using Memoize

@memoize function solve83(m, r=1, c=1, visited = falses(80,80), cvisited = falses(80, 80))
    res = typemax(Int)
    visited[r, c] = true

    if last_r == 0
        copy!(cvisited, visited)
        res = min(res, solve83(m, 2, 1, cvisited))
        copy!(cvisited, visited)
        res = min(res, solve83(m, 1, 2, cvisited))
        return res
    elseif (r == 80) && (c == 80)
        return m[r,c]
    end

    if (r < 80)
        if !visited[r+1, c]
            copy!(cvisited, visited)
            res = min(res, solve83(m, r + 1, c, cvisited))
        end
    end
    if (c < 80)
        if !visited[r, c+1]
            cvisited = copy(visited)
            res = min(res, solve83(m, r, c+1, cvisited))
        end
    end
    if (r > 1)
        if !visited[r-1, c]
            cvisited = copy(visited)
            res = min(res, solve83(m, r-1, c, cvisited))
        end
    end
    if (c > 1)
        if !visited[r, c-1]
            cvisited = copy(visited)
            res = min(res, solve83(m, r, c-1, cvisited))
        end
    end

    res
end