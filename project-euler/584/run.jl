includet("c:/git/project-euler/julia/584/code_v2.jl")
startv_dict = solve584(10, 1, 3)



startv_dict = solve584(100, 7, 3)

year_len=100
days=7
ppl = 3
done = false
@time startv_dict = make_dict(zeros(Int, year_len))



# while !done
@time startv_dict = build_dict(startv_dict, days, ppl)



new_startv_dict = Dict{Vector{Int}, Rational{Int}}()

startv = iterate(startv_dict)[1][1]
make_dict(startv, new_startv_dict, 1)

startv = collect(startv_dict)[2][1]
make_dict(startv, new_startv_dict, 1)

startv = collect(startv_dict)[3][1]
make_dict(startv, new_startv_dict, 1)

startv = collect(startv_dict)[4][1]
make_dict(startv, new_startv_dict, 1)

startv = collect(startv_dict)[5][1]
make_dict(startv, new_startv_dict, 1)


println(length(startv_dict))
@time done_pct = [rat for (startv, rat) in startv_dict if satisfy_all(startv, days, ppl)]
println(sum(done_pct))
done = sum(done_pct) == 1
# end

startv_dict

sum([rat*sum(startv) for (startv, rat) in startv_dict if satisfy_all(startv, 1, 3)]) |> Float64
