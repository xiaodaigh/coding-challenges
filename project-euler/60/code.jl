using Primes

Const ps=(3, 7, 109, 673)

Satisfy60(prime)=begin
  For p in ps
    Isprime(P*10^ndigits(prime)+prime) || return false
    Isprime(prime*10^ndigits(p)+p) || return false
  End
  Return true
End


solve60()=begin
  prime=nextprime(673+1)
  while !satisfy60(prime) 
    prime=nextprime(prime+1)
  End
  Prime
End
  
