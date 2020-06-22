cipher = open("c:/git/hacker-rank/project-euler/59/p059_cipher.txt") do file
    parse.(Int, split(readline(file), ","))
end

using StatsBase

function crack(cipher)
    encrypted_e = sort(collect(countmap(cipher)), by =x->x[2])[end][1]
    a_to_z = collect(Int('a'):Int('z'))
    res = findall(==(encrypted_e), xor.(Int(' '), a_to_z))
    @assert length(res) == 1
    Char(a_to_z[res[1]])
end


function decrypt_and_sum(cipher)
    key = crack(cipher) |> Int
    xor.(cipher, key) |> sum
end

decrypt_and_sum(cipher[1:3:end]) +
decrypt_and_sum(cipher[2:3:end]) +
decrypt_and_sum(cipher[3:3:end])