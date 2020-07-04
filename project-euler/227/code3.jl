# this is a linear relations solver

function meh(dist)
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
end