using Base.Iterators: product

a = 2:100
b = 2:100

Set(b*log(BigFloat(a)) for (a,b) in product(a, b))