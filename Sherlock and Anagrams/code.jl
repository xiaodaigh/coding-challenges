# first approach

grps = parse(Int, readline(stdin))

function isanagram(key1, key2)
    sort(key1) == sort(key2)
end

function count_anagrams(string::String)
    chars = collect(string)
    # count length 1 anagram separately

    len_chars = length(chars)
    dict = Dict{Vector{Char}, Int}()
    for l in 1:len_chars-1
        # l is the length of anagram
        for lo in 1:len_chars-(l-1)
            sub_chars = sort(chars[lo:lo+l-1])
            if haskey(dict, sub_chars)
                dict[sub_chars] += 1
            else
                dict[sub_chars] = 1
            end
        end
    end

    # TODO treat word that is itself anagram
    res::Int = 0
    for (key, val) in dict
        res += ((val-1)*val) >> 1
    end

    res
end

count_anagrams("abcd")

1234
12
13
14
23



1234
n=4

sum(1:n-1)

n*(n-1)/2

12
13
14
23
24
34
