includet("C:/git/hacker-rank/project-euler/684/code.jl")

const M = 1_000_000_007
function S(f90)
    d, r = divrem(f90, 9)
    x = f90 - r
    ten_to_d = powermod(10, d, M)
    ten_to_d_plus1 = mod(10ten_to_d, M)

    nines = mod((5+x)*(ten_to_d - 1) - (mod(d, M)*ten_to_d_plus1 - mod(d+1, M)*ten_to_d + 1), M)

    mod(mod(sum(1:r)*ten_to_d, M) + mod(r*(ten_to_d - 1), M) + nines, M)
end

f90 = 20
@time S(20)

f90 = fib(90)
@time S(f90)

sfib(n) = S(fib(n))

@time sfib(90)

@time reduce((old, new) -> mod(old + sfib(new), M), 2:90)

function solve684()
    res = BigInt(0)
    for i in 2:90
        println(i)
        fibi = fib(i)
        println(fibi)
        @time Sfibi = S(fibi)
        println(Sfibi)
        res += Sfibi
        res = mod(res, M)
    end
    res
end

@time solve684()



# # consider S(f90) = s(1) + s(2) + ... + s(f90)
# # only the first 8 number have unit digit less than 9
# sum(1:8)
# x = div(f90, 9)

# (f90 - 9)*9*10^(1-1) +
# (f90 - 9 - 9)*9*10^(2-1) +
# ...
# (f90 - 9*x)*9*10^(x-1) #+

# f90*(10^x - 1) + 9*9*(x+1)*10^x


# #the_one_in_front + all the 1 to 8
# # =
# # t1 + t2 + t3 + t4 + t5 + ... + t_{f90 % 9}

# t1 = (f90 - 9)*9*10^(1-1)

# t_j = 9*f90*10^(j-1) - 9*9*(j*10^(j-1))

# sum(t_j for j in 1:div(f90,9))

# t_j = o(j) + k(j)

# O(x, y=10) = sum(o(j) j in 1:x-1)   = 1 + 10 + 10^2 + ... + 10^(x-1)
# 10*O(j)                             =     10 + 10^2 + ... + 10^(x-1) + 10^x

# 10*O(x) - O(x) = 10^x - 1
# 9*O(x) = 10^x - 1
# O(x) = (10^x - 1)/9

# K(j, y=10) = sum(k(j) for j in 1:x-1) = 1 + 2*10 + 3*10^2 + ... +  x*10^(x-1)

# d(O(x+1,y))/dy = K(x, y=10)

# K(x, y) = d(y^(x+1) - 1)/9/dy for y = 10 = (x+1)*y^x




# fib(90) % 9

# s(100) = 199999999999
# s(100000000)

# S(k) = sum(s, 1:k)

# f2 = 2
# f3 = 3
# f4 = 5
# ...
# f90 = 2880067194370816120

# S(f2) = sum(s, 1:f2)
# S(f3) = sum(s, 1:f3)
# ...
# S(f90) = sum(s, 1:f90)

# S(f89) = sum(s, 1:(f89))
# S(f90) = sum(s, 1:(f89   + f88))


