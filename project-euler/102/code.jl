function dist(ptA, ptB)
    sqrt(sum((ptA .- ptB) .^ 2))
end

# Let ABC be triangle

# The line thru AB divides the plane into two parts. C must sit in one of these two parts.
# If the origin sit on the part opposite of C then origin is not in the trianlge

# AB

function slope_intercept(A, B)
    if A[1] > B[1]
        return slope_intercept(B, A)
    end

    # A is to the left of B
    rise = B[2] - A[2]
    run = B[1] - A[1]

    slope = rise/run

    # y = intercept + x*slope
    # B[2] = intercept + B[1]*slope
    intercept = B[2] - B[1]*slope
    slope, intercept
end

function same_side_as_origin(A, B, C)
    slope, intercept = slope_intercept(A, B)

    C_side = C[2] > (intercept + C[1]*slope)
    origin_side = 0 > intercept

    C_side == origin_side
end

function satisfy102(tt)
    res = [same_side_as_origin(tt[1:2], tt[3:4], tt[5:6]),
    same_side_as_origin(tt[1:2], tt[5:6], tt[3:4]),
    same_side_as_origin(tt[3:4], tt[5:6], tt[1:2])]

    if all(res)
        return true
    else
        return false
    end
end