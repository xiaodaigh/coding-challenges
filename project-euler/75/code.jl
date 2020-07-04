# A^2 + B^2 = C^2
# A + B + C = n
# A <= B < C

# B != A

# Generate all x^2 up to sqrt(1_500_000)

# A, B = A, C = sqrt(2A + 1)

# C = L - (L/3-1) - (L/3-2)

# (L-3)/3+2 = A+2 < C

# A+B+C = 2A+1+sqrt(2)A = A

# A = L/(2+sqrt(2))

# B+C = L-A

# (B+C)^2 - 2BC = B^2 +C^2
#(L - b - c)^2 + b^2 = c^2

# 2A^2 = 2L^2/(2+sqrt(2))^2



# A^2+B^2=C^2

# 4A^2+4B^2=4C^2
# 9A^2+9B^2=9C^2

function only_one_solution(L)
    println(L)
    maxA = floor(Int, div(L, 2+sqrt(2)))
    found_one = false
    for B in maxA:div(L-1,2)
        C, r = divrem(2*B^2-2*B*L+L^2, 2*(L-B))
        # @assert (A < B) && (B < C)
        A = L - B - C
        if (r == 0) && (C>B) && (B>A)
            if found_one
                return 2
            end
            found_one = true
            @assert C > B
            @assert C + B < L
        end
    end
    if found_one
        return 1
    else
        return 0
    end
end

