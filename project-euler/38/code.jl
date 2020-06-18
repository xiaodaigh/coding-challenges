# generate all possible numbers
function gen_numbers()
    res = collect(1:9)

    l = 1

    for l in 1:9
        tmp = filter(x-> length(digits(x)) == l, res)
        for val in tmp
            sd_reduced = setdiff(sd, digits(val))
            append!(res, val .+ (10^l) .* sd_reduced)
        end
    end
    res
end

ns = gen_numbers()

ns = filter(x->length(digits(x))==9, ns)

ns = sort(ns, rev = true)

for n in ns
    if largest_n(n) > 1
        println(n)
        break
    end
end

using Primes

largest_n(num) = begin
    dn = reverse(digits(num))
    max_n = 1
    upto = 1

    while upto <= 4
        val = inverse_digits(reverse(dn[1:upto]))
        n = 1

        lo = upto + 1

        while lo < length(dn)
            next_val = val*(n+1)

            dnv = length(digits(next_val))

            if lo+dnv-1 > length(dn)
                max_n = 1
                break
            end

            if digits(next_val) == reverse(dn[lo:lo+dnv-1])
                n += 1
                if n > max_n
                    println(max_n)
                    println(val)
                    max_n = n
                end
                lo += dnv
            else
                break
            end
        end
        upto += 1
    end
    max_n
end


largest_n(918273645)


2*936
