## Insights

1. The possible digits are 0, 1, 2, ..., 9 (10 digits). To have 8 of them being prime, a few must be even, so the digits that can be changed cannot be in the unit digit, because even numbers can't be prime
2. A prime, `p`, must satisfy `p = 1 or 2 (mod 3)`.
3. A number is divisible by 3 iff `sum(digits(p)) = 0 (mod 3)`
4. Based on this analysis, we must change exactly as multiple of 3 digits! This will cut out alot of candidates!
5. We need to create 8 primes, so the small of them, where the digit need changing can not be smaller than 2, cos after 2 there are only 7 digits (3,4,5,6,7,8,9)
6. Based on 4 & 5 above, we are looking primes where there are repeated digits in multiple of threes, e.g and the we are looking at the smallest of such, the digit must not be larger than 2

See reasoning below

Say to generate 8 primes by changing 1 digit is possible. Let
`sd` be `sum(digits(n))`,

then let `f` be a magic function that knows which digit to change, so `f(n, i)` chnages one digit of `n` for each value of `i`, e.g. `f(n, 1)` and `f(n, 2)` changes two different digits of `n` but `f(n, 1)` and `f(n,2)` are prime.

This will not be possible to generate 8 primes. Because

if mod(sd, 3) == 1
  `fn(n, i) |> digits |> sum` must have at least 3 values that satisfy `fn(n, i)`
same for if mod(sd, 3) == 2

So how many digits must be changed?

Count how many values satisfy mod( , 3) == 0


