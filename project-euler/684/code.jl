using Memoize

@memoize function fib(n)
    if n == 1
        return BigInt(1)
    elseif n == 0
        return BigInt(0)
    else
        return fib(n-1) + fib(n-2)
    end
end



