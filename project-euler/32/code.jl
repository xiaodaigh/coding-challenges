const sd = Set(digits(987654321))
reverse_digits(digits) = sum([digits[k]*10^(k-1) for k=1:length(digits)])

m1 = 2
digits_of_prod = sort(setdiff(sd, digits(m1)) |> collect)[2:end]
reverse_digits(digits_of_prod)