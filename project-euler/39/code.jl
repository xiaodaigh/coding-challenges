p = 120

for a in div(p, 3)
    for b in i+1:2div(p,3)
        c = b + a^2/(p-a)
    end
end

how_many(p) = begin
    res = 0
    for a in 1:div(p-1, 3)
        if mod(a^2, p-a) == 0
            b = p-a - div(a^2, (p-a))
            if mod(b, 2) == 0
                b = div(b, 2)
                c = p - a - b
                if all(>(0), (a,b,c))
                    res += 1
                    println("$a $b $c")
                end
            end
        end
    end
    res
end

findmax(how_many.(1:1000))

how_many(840)
