using Primes

# x^2 - Dy^2 = 1
# x^2 - y^2 = 1 (mod D-1)
# y^2 = x^2+ 1 (mod D-1)
# y^2 - 1 = x^2 (mod D-1)

# therefore y^2 has to be in in the list of (0:D-2).^2 and also it has to be in list (0:D-2)^2 + 1

function possible_y_modulo_D_minus_1(D)
    possible_ys = Set(0:D-1)
    for m in 2:D-1
        s = Set(powermod(i, 2, m) for i in 0:D-1)

        for y in 0:D-1
            D_y_sqr_mod_m = mod(mod(D, m)*powermod(y, 2, m) + 1, m)
            if !(D_y_sqr_mod_m in s)
                possible_ys = setdiff(possible_ys, y)
            end
            if length(possible_ys) == 0
                return nothing
            end
        end
    end
    res = collect(possible_ys)
    sort!(res)
    push!(res, res[1]+D-1)
    diff(res)
end

possible_y_modulo_D_minus_1(19)

D = 14
accumulate(+, repeat(possible_y_modulo_D_minus_1(D), outer=18))

D = 17

function find_x(D)
    diffs = possible_y_modulo_D_minus_1(D)
    y = BigInt(0)
    for ydiff in Iterators.cycle(diffs)
        y += ydiff
        x_sqr = 1 + D*y^2
        if isinteger(x)
            println("$(Int(x))^2 - $D*$y^2 = 1")
            return sqrt(1 + D*y^2)
        end
    end
end

find_x(13)


satisfy(D, i, dict2, max_dict_val2) = begin
    bignum = D*BigInt(i)^2+1
    j = max_dict_val2[2]
    while (j+1)^2 < bignum
        dict2[(j+1)^2] = true
        j +=  1
        max_dict_val2[1] = (j+1)^2
        max_dict_val2[2] = (j+1)
        println(max_dict_val2[2])
    end

    return  haskey(dict2, bignum)
end

function find_x(D, dict2, max_dict_val2)
    i = 1
    while true
        if satisfy(D, i, dict2, max_dict_val2)
            bignum = D*BigInt(i)^2+1
            x = sqrt(bignum)|>Int
            println("$x^2 - $D*$i^2 = 1")
            return x
        end
        i+=1
    end
end

meh(n) = begin
    dict2 = Dict{BigInt, Bool}(i^2=>true for i in BigInt(1):BigInt(9100))
    max_dict_val2 = BigInt[BigInt(1)^2, BigInt(1)]

    set = setdiff(2:n, (1:100) .^ 2); sort!(set)
    @time findmin(map(x->find_x(x, dict2, max_dict_val2), set))
end

@time meh(1000)




@time find_x.(set)

find_x(2)

possible_y_modulo_D_minus_1(3)
possible_y_modulo_D_minus_1(4)
possible_y_modulo_D_minus_1(6)

possible_y_modulo_D_minus_1(1000)




D = 13

y = 1:12


s = ceil(Int, sqrt(D-1 - 1))

(1:3).^2

# if length == 0 can rule out x = (D-1) mod (D)
# x = 1 (mod D)
findall(x->powermod(x, 2, D-1) == D-2, 2:10)


(2:10) .^ 2 .% 12


satisfy(x, D, odd) = begin
    @assert D > 2
    if !odd == 0
        res = BigInt(x+1)*div(x-1, D)
    elseif odd == 0
        res = BigInt(x-1)*div(x+1, D)
    end

    is_sqr(res)
end

function find_minx(D)
    # x^2 - D*y^2 = 1
    # x^2 - (1 + D*y^2) = (x - (1 + D*y^2))
    # x = sqrt(-c)
    #

    y = UInt128(1)
    odd = false
    while !is_sqr(1 + D*BigInt(y)^2)
        y += 1
    end

    x = sqrt(1 + D*y^2) |> Int128
    println("$D $x")
    x
end
D^