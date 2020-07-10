function is_palindrome(n)
    dn = digits(n)
    for i in 1:div(length(dn), 2)
        if dn[i]  != dn[end-i+1]
            return false
        end
    end
    true
end


function gen_all_diffs(all_sums)
    diff = copy(all_sums)
    for i in 1:length(all_sums)
        for j in i+1:length(all_sums)
            push!(diff, all_sums[j]-all_sums[i])
        end
    end
    diff |> sort!
end



function solve125(all_palin, diff)
    res = 0
    for palindrome in all_palin
        pos = searchsortedfirst(diff, palindrome)
        if diff[pos] == palindrome
            res += palindrome
        end
    end
    res
end