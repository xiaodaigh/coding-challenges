
word_to_triag(word) = begin
    res = zero(BigInt)
    for letter in word
        res += Int(letter) - 64
    end
    res
end

is_triag(word) = begin
    is_triag(word_to_triag(word))
end

is_triag(n::Integer) = begin
    # t_n = 1/2n(n+1)
    # 2t_n = n^2 + n
    # 0 = n^2 - (-n) + (-2t_n)
    # (x-p1)(x-p2)

    # p1 + p2 = -1
    # (p1 = -1/2 + u, p2 = -1/2 - u)

    # p1*p2 = -2t_n
    # 1/4 - u^2 = -2t_n
    # 1/4 + 2t_n  = u^2
    root1 = -1/2 + sqrt(1/4 + 2*n)
    #root2 = -1/2 - sqrt(1/4 + 2*word_to_triag(word))
    #root = max(root1, root2)
    isinteger(root1)
end
