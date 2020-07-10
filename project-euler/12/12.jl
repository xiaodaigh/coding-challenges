using Primes

trinum(n) = begin
  prod((factor(Int128(n)*(n+1) ÷ 2) |> values) .+ 1)
end


abc12() = begin
  lastmax = 1
  for i in 1:20000
    res = trinum(i)
    if res > lastmax
      println(i, " ", res)
      lastmax = res
    end
    if res > 500
      println("final", i)
      error()
    end
  end
end

abc12()

Int128(12375)*(12375+1) ÷ 2
