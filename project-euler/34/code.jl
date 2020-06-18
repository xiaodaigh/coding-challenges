no_need_to_look_beyond = factorial(9)*7


is_digit_factorial(n) = sum(factorial, digits(n)) == n


res =  [i for i in 10:no_need_to_look_beyond if is_digit_factorial(i)]

sum(res)
