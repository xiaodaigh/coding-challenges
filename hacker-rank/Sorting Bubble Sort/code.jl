
# Complete the getMinimumCost function below.
function getMinimumCost(k, c)


end

fptr = open(ENV["OUTPUT_PATH"], "w")

nk = split(readline(stdin))

n = parse(Int32, nk[1])

k = parse(Int32, nk[2])

c = [parse(Int32, k) for k in split(readline(stdin))]

minimumCost = getMinimumCost(k, c)

write(fptr, string(minimumCost)*"\n")

close(fptr)
