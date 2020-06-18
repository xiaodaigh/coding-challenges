
function is_palindrome(vec::AbstractVector)
    l = length(vec)
    for i in 1:div(length(vec), 2)
        if vec[i] != vec[l - i + 1]
            return false
        end
    end
    return true
end

res = [i for i in 1:1_000_000 if is_palindrome(digits(i, base=2)) && is_palindrome(digits(i))]

res |> sum
