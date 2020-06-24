function solve227()
    m = Matrix{Rational{BigInt}}(undef, 50, 50)
    m .= 0
    for i in 3:48
        m[i, i] = 1//2
        m[i, i+1] = -8//36
        m[i, i-1] = -8//36
        m[i, i+2] = -1//36
        m[i, i-2] = -1//36
    end

    m[50, 50] = 1//2
    m[50, 49] = -16//36
    m[50, 48] = -2//36

    m[49, 49] = (1 - 1//2 - 1/36)
    m[49, 50] = -8//36
    m[49, 48] = -8//36
    m[49, 47] = -1//36

    m[2, 2] = 1//2
    m[2, 3] = -8//36
    m[2, 1] = -8//36
    m[2, 4] = -1//36


    m[1, 1] = (1 - 1//2 - 1//36)
    m[1, 2] = -8//36
    m[1, 3] = -1//36

    o = Matrix{Rational{BigInt}}(undef, 50, 1)
    o .= 1//1

    res = m^-1*o
end

@time res = solve227()

res[50]
res[50] |> float

res[1] |> float
res[2] |> float
res[3] |> float
res[4] |> float
res[5] |> float