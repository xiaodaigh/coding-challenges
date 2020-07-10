# k*(k-1) = n*(n-1)/2
# lhs = rhs

# but rhs = 1 + 2 + ... + n-1
# similar lhs = (1 + 2 + ... +k-1)*2 = 2 + 4 + 6 + ...
# take values form the back and fill in 1, 3, 5, 7

# take m values from the back of lhs
# sum of them  =
# 2(k - 1) + ... +  2(k - m) = kmm
# (2 + 4 + .... 2(k - m - 1)) + kmm = rhs

# lhs = first part + second part

# first part = 2k*m - (1+m)m/2
# 2nd part = 2*(1 + 2 + k -m-1) = (k-m)(k-m-1)
# lsh = 2km-(1+m)m/2 + (k-m)(k-m-1) = n(n-1)/2

