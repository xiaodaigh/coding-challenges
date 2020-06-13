includet("c:/git/hacker-rank/project-euler/51/code.jl")

using Primes: nextprime, isprime


using Main.DigitCount:
    DigitCounter, next_candidate,
    count_digits_except_first, getindex,
    candidate_digits, inverse_digits,
    validate, solve51


prime = nextprime(1000)
prime = 11117

@time solve51(prime)






