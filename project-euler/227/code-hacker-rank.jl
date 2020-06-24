# this is the hacker rank solution

ss = readline(stdin)
nm = parse.(Int, split(ss, " "))

const n = nm[1]
const m = nm[2]

# write(stdout, "$n $m")


init_rhs() = begin
    res = Rational{BigInt}[0//1 for i in 1:div(n,2)]
    res
end

function update227!(rhs_coef, const_part, n, multiplier)
    new_const_part, add_rhs_coef = multiplier .* chase(n)
    rhs_coef .+= add_rhs_coef

    const_part + new_const_part
end

function chase(dist)
    # C*d_{dist} = A*d_{dist} + B*d_{dist-1} + D*d_{dist-2}
    # lhs_coef = C - A
    lhs_coef = 1//1
    const_part = 1//1

    rhs_coef = init_rhs()

    if dist == 1
        rhs_coef[1] += (2+(m-2)^2)//m^2 + 1//m^2
        rhs_coef[2] += (m-2 + m-2)//m^2
        rhs_coef[3] += 1//m^2
    elseif dist == div(n, 2)
        rhs_coef[div(n, 2)-2] += 2//m^2
        rhs_coef[div(n, 2)-1] += (m-2 + m-2)//m^2
        rhs_coef[div(n, 2)] += 2//m^2 + (m-2)^2/m^2
    elseif dist == 2
        rhs_coef[1] += (m-2 + m-2)//m^2
        rhs_coef[2] += (2+(m-2)^2)//m^2
        rhs_coef[3] += (m-2 + m-2)//m^2
        rhs_coef[4] += 1//m^2
    elseif dist == div(n, 2)-1
        rhs_coef[div(n, 2)-1-2] += 1//m^2
        rhs_coef[div(n, 2)-1-1] += (m-2 + m-2)//m^2
        rhs_coef[div(n, 2)-1] += 1//m^2 + 1//m^2
        rhs_coef[div(n, 2)-1+1] += (m-2 + m-2)//m^2
    else
        rhs_coef[dist-2] += 1//m^2
        rhs_coef[dist-1] += (m-2 + m-2)//m^2
        rhs_coef[dist] += (2+(m-2)^2)//m^2
        rhs_coef[dist+1] += (m-2 + m-2)//m^2
        rhs_coef[dist+2] += 1//m^2
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

res, _ = chase(div(n,2))

fnl = mod(numerator(denominator) * invmod(denominator(res), 10^9+9), 10^9+9)

write(stdout, "$fnl")