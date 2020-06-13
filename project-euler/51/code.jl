# Firstly indentify primes

module DigitCount
    using Primes
    using Combinatorics
    using Base.Iterators: drop

    export DigitCounter, count_digits_except_first, getindex,
            satisfy, next_candidate


    import Base: getindex

    struct DigitCounter
        digits::Vector{Int}

        DigitCounter(i::Integer) = i |> digits |> count_digits_except_first

        DigitCounter(digits) = new(digits)
    end

    getindex(d::DigitCounter, i) = d.digits[i+1]

    function count_digits_except_first(digits)
        """d must be iterable"""
        cnt = zeros(Int8, 10)
        for digit in drop(digits, 1)
            cnt[digit + 1] += 1
        end
        DigitCounter(cnt)
    end

    candidate_digits(n) = begin
        d = digits(n)
        dc = count_digits_except_first(d)

        # more than 3 digits
        cd = Set{Int}()
        for dd in 0:2
            if dc[dd] >= 3
                if dc[dd] > 3
                    println("woah more than 3 $n")
                end
                cd = union(cd, dd)
            end
        end
        cd
    end

    satisfy(n) = begin
        """ check if n has digits in triples
            and if the tripled digits are no larger than 2
        """


        cd = candidate_digits(n)
        if length(cd) > 0
            return true
        end

        return false
    end

    # Getting some tea

    function next_candidate(n)
        if isprime(n)
            prime = n
        else
            prime = nextprime(n)
        end
        i = 0
        while !satisfy(prime)
            prime = nextprime(prime+1)
            i += 1
            if mod(i, 1000) == 0
                println("$n $prime")
            end
        end
        prime
    end


    inverse_digits(digits) = sum([digits[k]*10^(k-1) for
        k=1:length(digits)])

    validate(prime, pos_of_3) = begin
        """check if eight of them are prime"""
        d = digits(prime)

        # digit value to change
        digit_val = d[pos_of_3[1]]

        strikes = digit_val
        for dv in digit_val+1:9
            d[pos_of_3] .= dv
            ok = isprime(inverse_digits(d))
            strikes += (!ok)
            if strikes >= 3
                return false
            end
        end

        return true
    end

    solve51(prime) = begin
        i = 0
        while true
            prime = next_candidate(prime+1)
            d = digits(prime)
            cd = candidate_digits(prime)
            @assert length(cd) == 1
            pos = findall(==(collect(cd)[1]), d)

            res = [validate(prime, pos_of_3) for pos_of_3 in collect(combinations(pos, 3))]
            if any(res)
                return prime
            end

            if mod(i, 1000) == 0
                println(prime)
            end
        end
    end
end
