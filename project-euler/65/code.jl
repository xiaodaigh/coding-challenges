# prob 65
function make_cfrac_coef(n)
    cfrac_coef = [2, 1, 2]
    val = 4
    while length(cfrac_coef) < n
        append!(cfrac_coef, [1, 1, val])
        val += 2
    end
    cfrac_coef[1:n]
end

function e_cont_frac(n)
    cfracs = make_cfrac_coef(n)
    println(cfracs)
    val = BigInt(cfracs[end])

    for new_val in cfracs[end-1:-1:1]
        val = new_val + 1//val
    end
    val
end