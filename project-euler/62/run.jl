includet("c:/git/hacker-rank/project-euler/62/code.jl")
cubes = (1:999) .^ 3
maximum(ndigits, cubes)

@time solve62()

# found some in digit 13
cubes = (1:46999).^3
nd = 12

cubes = [c for c in cubes if ndigits(c) == 12]

# to be possible they must have 5 or more
# numbers with exactly the same digits

cdc = countmap.(digits.(cubes)) |> countmap

for c in cubes
    if cdc[countmap(digits(c))] == 5
        println(c)
        break
    end
end

cd1 = countmap(digits(10072098316736))

for c in cubes
    if countmap(digits(c)) == cd1
        println(c)
    end
end
