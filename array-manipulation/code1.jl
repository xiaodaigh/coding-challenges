# https://www.hackerrank.com/challenges/crush/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=arrays&h_r=next-challenge&h_v=zen

#!/bin/python3

import math
import os
import random
import re
import sys

# Complete the arrayManipulation function below.
def arrayManipulation(n, queries):
    # compute the cumulative sum from reverve
    # so we can early stop if the val is too far from maxval
    res = [0 for i in range(n)]
    for q in queries:
        k = q[2]
        for i in range(q[0]-1, q[1]):
            res[i] += k

    maxval = res[0]
    for r in res:
        if r > maxval:
            maxval = r

    return maxval

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    nm = input().split()

    n = int(nm[0])

    m = int(nm[1])

    queries = []

    for _ in range(m):
        queries.append(list(map(int, input().rstrip().split())))

    result = arrayManipulation(n, queries)

    fptr.write(str(result) + '\n')

    fptr.close()

