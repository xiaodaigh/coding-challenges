using CircularArrays
const dirs = CircularArray([(0, 1), (1, 0), (0, -1), (-1, 0)])


spiral_matrix(n) = begin
    m = zeros(Int, n, n)

    dirs_upto = 1

    ij = [1,0]

    for k in 1:n^2
        pretend_ij = ij .+ dirs[dirs_upto]

        if (pretend_ij[1] > n) || (pretend_ij[2] > n) || (pretend_ij[1] <= 0) || (pretend_ij[2] <= 0)
            dirs_upto += 1
        elseif m[pretend_ij[1], pretend_ij[2]] != 0
            dirs_upto += 1
        end

        ij .+= dirs[dirs_upto]

        m[ij[1], ij[2]] = k
    end
    m
end


    n = 100
    m = zeros(Int, n, 100)
    upto = 0
    i,j = 1,1
    l =
    while upto < n
        m[i, j:n] .= upto:upto + (n-j) + 1
        j = n
    end
    m