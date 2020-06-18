meh(num, den) = begin
    if length(intersect(digits(num), digits(den))) != 1
        return 1//1
    end
    new_num = setdiff(digits(num), digits(den))
    new_den = setdiff(digits(den), digits(num))
    if (length(new_num) == 1) && (length(new_den) == 1)
        return new_num[1] // new_den[1]
    else
        return 1//1
    end
end

res = [(meh(num, den), num // den, num, den) for num in 10:98, den in 10:99 if (den > num) && (mod(den, 10) != 0) && (mod(num, 10) != 0)]

res = filter(xy -> xy[1] == xy[2], res)

prod(x->x[1], res)

meh(11, 22)

setdiff(digits(11), digits(22))
