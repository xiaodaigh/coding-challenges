read99() = begin
    open("C:/git/hacker-rank/project-euler/99/p099_base_exp.txt") do file
        [parse.(Int, split(readline(file), ",")) for i in 1:1000]
    end
end