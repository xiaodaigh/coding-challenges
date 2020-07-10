# find all squares
# A^2 + B^2 = C^2 (1)
# A + B = N - C (2)
# A < B < C
# B != A as 2A^2 = C^2 has no integer solution for C
const max_possible_A = floor(Int, 1_500_000/(2+sqrt(2)))
const max_possible_C = trunc(Int, sqrt(max_possible_A^2 + (max_possible_A+1)^2))



@assert max_possible_A + max_possible_A+1 + max_possible_C < 1_500_000

const power2 = (1:max_possible_C).^2

function solve75()
    Lcnt = zeros(Int, 1_500_000)
    l = length(power2)

    max_possible_A2 = max_possible_A^2
    max_possible_B2 = (max_possible_A+1)^2
    done_cnt = 0
    i = 1
    while power2[i] < max_possible_A2
        power2i = power2[i]
        j = i + 1
        while true
            C_sqr = power2i + power2[j]
            pos = searchsortedlast(power2, C_sqr)
            if power2[pos] == C_sqr
                Lcnt[pos] += 1
                println("$pos $(Lcnt[pos])")
            elseif pos == l
                # println("broke at $i $j")
                break
            end
            done_cnt += 1
            if done_cnt % 1_000_000 == 0
                # println(done_cnt)
            end
            j += 1
        end
        i += 1
    end
    sum(==(1), Lcnt)
end


