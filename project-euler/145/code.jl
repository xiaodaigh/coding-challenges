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

# EXXXXO
# OXXXXE
# 12

# EO
# OE
# EXO
# EXO

# EXXXXXXXO
const E = (2, 4, 6, 8)
const O = (1, 3, 5, 7, 9)

function solve145(limit)
    cnt = zero(Int)
    done = BitVector(undef, limit)
    done .= false
    done[10:10:end] .= true

    # generate numbers of digits from 2 to 9
    for nd in 2:9
        middle_numbers = 0:10^(nd - 2)-1
        for i in middle_numbers
            for even in E
                for odd in O
                    n = even*10^(nd-1) + i*10 + odd
                    if !done[n]
                        is_reversible_n, digits = is_reversible(n)
                        if is_reversible_n
                            cnt += 2
                            done[inverse_digits(reverse(digits))] = true
                        end
                    end
                end
            end
        end
    end
    cnt
end