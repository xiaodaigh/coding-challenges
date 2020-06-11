using Base.Iterators: product
using ProjectEulerUtil


abundant_nums = [i for i in 2:28123 if is_abundant(i)]

sums = vec([a+b for (a,b) in product(abundant_nums, abundant_nums)])

sums = Set(sums)

setdiff(Set(1:28123), sums) |> sum