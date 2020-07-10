using StatsBase

function sim402()
    colors=falses(7)
    colors[1]=true
    for i in sample(10:79,19,replace=false)
        colors[div(i, 10)]=true
    end
    sum(colors)
end



