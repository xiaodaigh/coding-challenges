is_pentagonal(pn) = begin
     #0 = n^2 - n/3 + (-2pn/3)
    # (1/6 + u)(1/6 - u) = -2pn/3
    # 1/36 - u^2 = -2pn/3
    # 1/36 + 2pn/3 = u^2
    root = round(1/6 + sqrt(1/36 + pn/3*2), digits = 0)
    div(root*(3root - 1), 2) == pn
end

is_hexagonal(hn) = begin
    # hn = n(2n−1)
    # hn/2 = n^−n/2
    # 0 = n^−n/2 + (-hn/2)
    # (1/2 + u)(1/2 - u) = (-hn/2)
    # 1/4 - u^2 =
    # 1/4 + hn/2 = u^2
    root = round(1/2 + sqrt(1/4 + hn/2), digits = 0)
    root*(2root - 1) == hn
end

triag_num(n) = div(n*(n+1), 2)

solve45() = begin
    i = 286
    while true
        tn = triag_num(i)
        if is_pentagonal(tn) && is_hexagonal(tn)
            return tn
        end
        i += 1
    end
end

@time solve45()
