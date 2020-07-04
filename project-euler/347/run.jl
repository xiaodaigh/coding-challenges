includet("C:/git/hacker-rank/project-euler/347/code.jl")


@time solve347(100)

@time solve347(10_000_000)

using DataFrames
using Random: randstring
M = 100_000_000
str_base = [randstring(8) for i in 1:1_000_000]
df = DataFrame(int = rand(Int32, M), float=rand(M), str = rand(str_base, M))
@time sort!(df, :int);
@time sort!(df, :str);


]add https://github.com/xiaodaigh/SortingLab.jl
using SortingLab
using Base.Threads: @spawn
function another_sort!(df, col)
    @time ordering = fsortperm(df[!, col])
    channel_lock = Channel{Bool}(length(names(df)))
    for c in names(df)
        @spawn begin
            v = df[!, c]
            @inbounds v .= v[ordering]
            put!(channel_lock, true)
        end
    end
    for _ in names(df)
        take!(channel_lock)
    end
    df
end

@time another_sort!(df, :int);
@time another_sort!(df, :str);
