using Primes

is_harshad(n) = mod(n, sum(digits(n))) == 0

function is_right_truncatable_harshad(n)
    is_harshad(n) || return false
    nd = ndigits(n)
    for i in 1:nd-2
        n = div(n, 10)
        is_harshad(n) || return false
    end
    true
end

function construct_all_harshad_numbers(d)
    ns = construct_harshad_numbers()
    res = ns
    for i in 2:d-1
        ns = construct_harshad_numbers(ns)
        res = vcat(res, ns)
    end
    res
end


function construct_harshad_numbers(ns = collect(1:9))
    res = [10n for n in ns]
    for n in ns
        for i in 1:9
            new_try = 10n + i
            if mod(new_try, digits(new_try) |> sum) == 0
                push!(res, new_try)
            end
        end
    end
    res
end

function solve387(pow)
    res = 0
    hs = construct_all_harshad_numbers(pow-1)
    hs1 = filter(x->isprime(div(x, sum(digits(x)))), hs)

    for p in hs1
        # try to find if can be made into prime by adding one digits
        for i in 1:2:9
            if isprime(10p+i)
                println(10p+i)
                res += 10p+i
            end
        end
        p += 1
    end
    res
end


collect(67 .* (1:36))

x = 1000:9999
findmax(x ./ sum.(digits.(x)))

1000/67

