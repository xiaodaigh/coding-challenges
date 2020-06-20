using CSV

a = CSV.read("c:/git/project-euler\\data/13.txt", header = false, types=[String])

ok = map(split.(a[!, :Column1], "")) do x
    parse.(Int, x)
end

abc(ok) = begin
    res = 0
    for digit = 1:12
        for ok1 in ok
            res += ok1[digit]
        end
        res = res*10
    end
    return res
end

abc(ok)

aa = abc(ok) |> digits |> reverse

reduce(string, aa[1:10])

using Distributions

dist = [Cauchy{Float32}, Normal, Uniform]
x = rand(1000)
fd = fit.(dist, Ref(x))

# Winning Distributions
dist[findmax(loglikelihood.(fd, Ref(x)))[2]]


MixtureModel(Normal[
   Normal(-2.0, 1.2),
   Normal(0.0, 1.0),
   Normal(3.0, 2.5)], [0.2, 0.5, 0.3])
