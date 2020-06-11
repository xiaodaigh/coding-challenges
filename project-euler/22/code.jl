words = open("c:/git/hacker-rank/project-euler/22/p022_names.txt") do file
    ok = split(readline(file), ",")
    [o[2:end-1] for o in ok]
end

wordsworth(string) = begin
    sum(Int.(collect(string)) .- Int('A')) + length(string)
end

sort!(words)

sum([i*wordsworth(string) for (i, string) in enumerate(words)])

