includet("C:/git/hacker-rank/project-euler/650/code.jl")


@time factor_powers = factors_pows.(2:20_2000)

@time sum(D.(1:5))
@time sum(D.(1:10))


function solve650(n)
    res = 0
    for i in 1:n
        res += D(i)
        res = mod(res, M)
        if i % 1000 == 0
            println(i)
        end
    end
    res
end


@time solve650(20_000)



(BigInt.(PS[pos]) .^ (res[pos] .+ 1)) .// (PS[pos] .- 1)



mod(div((BigInt(PS[pos[1]]) ^ res[pos[1]] - 1), PS[pos[1]] - 1), M)

mod(div((BigInt(PS[pos[2]]) ^ res[pos[2]] - 1), PS[pos[2]] - 1), M)

BigInt(PS[pos[1]]) ^ res[pos[1]]

(PS[pos],res[pos] .+ 1) - 1) .// (PS[pos] .- 1)

@time powermod(PS[end], res[end], M) * invmod.(PS[pos], M)

@time solve650(5)
@time solve650(10)
@time solve650(100)


2^6 - 1