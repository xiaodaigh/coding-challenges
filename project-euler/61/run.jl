includet("c:/git/hacker-rank/project-euler/61/code.jl")

# I will just make a function to check for each type of number

# generat4e all 4 digit triangle numbers
n = 1:200

triangles = @. div(n*(n + 1), 2)
triangles=triangles[ndigits.(triangles) .== 4]

squares = n.^2
squares=squares[ndigits.(squares) .== 4]

pentagonals = @. div(n*(3n-1), 2)
pentagonals=pentagonals[ndigits.(pentagonals) .== 4]

hexgonals = @. n*(2n-1)
hexgonals=hexgonals[ndigits.(hexgonals) .== 4]

heptagonals = @. div(n*(5n-3), 2)
heptagonals=heptagonals[ndigits.(heptagonals) .== 4]

octagonals = @. n*(3n-2)
octagonals=octagonals[ndigits.(octagonals) .== 4]

numbers_set = (triangles, squares, pentagonals, hexgonals, heptagonals, octagonals)

length.(numbers_set)

prod(length.(numbers_set))

new_numbers = solve61(numbers_set)

using CSV
CSV.write("c:/scratch/ok.csv", new_numbers)