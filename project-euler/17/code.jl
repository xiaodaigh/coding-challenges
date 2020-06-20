const dict = Dict(
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety",
    100 => "hundred",
    1000 => "thousand"
)

using Base.Iterators: drop
to_words(n) = begin
    word_len = 0
    if n == 1000
        return length(dict[1]) + length(dict[1000])
    elseif n <= 20
        word_len += length(dict[n])
    else
        dn = digits(n, base = 10, pad = 4)
        first2 = dn[1] + dn[2]*10
        if (0 < first2) & (first2 <= 20)
            word_len += length(dict[dn[1] + dn[2]*10])
        else
            if dn[1] != 0
                word_len += length(dict[dn[1]])
            end
            if dn[2] != 0
                word_len += length(dict[dn[2]*10])
            end
        end

        if dn[3] != 0
            if (dn[1] != 0)  | (dn[2] != 0)
                word_len += 3 # add and
            end
            word_len += length(dict[dn[3]])
            word_len += length(dict[100])
        end
    end
    word_len
end

sum(to_words.(1:1000))

to_words(1000)
to_words(100)

to_words(342)
to_words(115)



to_words(999)

to_words(900)
to_words(90)
to_words(9)



dict[1]
dict[100]