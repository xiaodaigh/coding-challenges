# this is an alternate solution that doesn't rely on matrices so is more memory efficient

init_rhs() = begin
    res = Rational{BigInt}[0//1 for i in 1:50]
    res
end

function update227!(rhs_coef, const_part, n, multiplier)
    new_const_part, add_rhs_coef = multiplier .* chase(n)
    rhs_coef .+= add_rhs_coef

    const_part + new_const_part
end

using Memoize

@memoize function chase(dist)
    # C*d_{dist} = A*d_{dist} + B*d_{dist-1} + D*d_{dist-2}
    # lhs_coef = C - A
    lhs_coef = 1//1
    const_part = 1//1

    rhs_coef = init_rhs()

    if dist == 50
        rhs_coef[48] += 2//36
        rhs_coef[49] += 16//36
        rhs_coef[50] += 1//2
    elseif dist == 49
        rhs_coef[47] += 1//36
        rhs_coef[48] += 8//36
        rhs_coef[49] += 1//2 + 1//36
        rhs_coef[50] += 8//36
    elseif dist == 1
        rhs_coef[1] += 1//2 + 1//36
        rhs_coef[2] += 8//36
        rhs_coef[3] += 1//36
    elseif dist == 2
        rhs_coef[1] += 8//36
        rhs_coef[2] += 1//2
        rhs_coef[3] += 8//36
        rhs_coef[4] += 1//36
    else
        rhs_coef[dist-2] += 1//36
        rhs_coef[dist-1] += 8//36
        rhs_coef[dist] += 1//2
        rhs_coef[dist+1] += 8//36
        rhs_coef[dist+2] += 1//36
    end

    if dist != 1
        while any(!=(0), @view rhs_coef[1:dist-1])
            for i in 1:dist-1
                if rhs_coef[i] != 0
                    mult = rhs_coef[i]
                    rhs_coef[i] = 0
                    const_part = update227!(rhs_coef, const_part, i, mult)
                end
            end
        end
    end

    lhs_coef -= rhs_coef[dist]
    rhs_coef[dist] = 0//1

    const_part / lhs_coef, rhs_coef ./ lhs_coef
end
