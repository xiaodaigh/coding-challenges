

inverse_digits(d) = sum(d[k]*10^(k-1) for k=1:length(d))

function is_reversible(n)
    idn = digits(n)
    carry = 0
    for i in 1:length(idn)
        carry, new_digit = divrem(idn[i] + idn[end-i+1] + carry, 10)
        if iseven(new_digit)
            return false, idn
        end
    end
    true, idn
end

using Base.Threads

function solve145(n)
    res = zero(Int)
    done = BitVector(undef, n)
    done .= false
    done[10:10:end] .= true
    for i in 1:n-1
        if i % 1_000_000 == 0
            println(res)
        end
        if !done[i]
            is_reversible_n, digits = is_reversible(i)
            if is_reversible_n
                res += 2
                done[inverse_digits(reverse(digits))] = true
            end
        end
    end
    res
end