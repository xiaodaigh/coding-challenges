# it's recursion problem

using Memoize

@memoize function solve91(n, m)
    # what is n = 1
    if n == 1
        return 3
    end

    cnt = solve91(n-1) +
        n   + # by keeping Q on the x-axis & P on top left corner
        n   + # by keeping P on the y-axis & Q on bottom right corner
        - 1 + # to take care of double counting above
        n  + # vary Q on top and keep P on top left
        n  + # vary P on right, and keep Q on bottom right
        n + # varp P on top and draw straing line down to Q
        - 1
        n  # varp Q on right and draw straing line left to P
        - 1
        # i need A B C to be A^2+B^2 = C^2 (1)
        # but C = N (2)
        # A = sqrt((N/2)^2 + K^2) (3)
        # B = A (3)
        # From (3)
        # 2((N/2)^2 + K^2) = N^2 +

    if iseven(n)
        cnt += 2
    end
    cnt
end