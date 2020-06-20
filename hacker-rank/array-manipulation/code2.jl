# https://www.hackerrank.com/challenges/crush/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=arrays&h_r=next-challenge&h_v=zen

#!/bin/python3

import math
import os
import random
import re
import sys

def overlap(q1, q2):
    overlapped = False
    if (q2[0] <= q1[0]) and (q1[0] <= q2[1]) or (q2[0] <= q1[1]) and (q1[1] <= q2[1]):
        overlapped = True
    elif (q1[0] <= q2[0]) and (q2[0] <= q1[1]) or (q1[0] <= q2[1]) and (q2[1] <= q1[1]):
        overlapped = True

    if overlapped:
        ok = [q1[0], q1[1], q2[0], q2[1]]
        ok.sort()
        return [ok[1], ok[2], q1[2] + q2[2]]
    else:
        return q1

# Complete the arrayManipulation function below.
def arrayManipulation(n, queries):
    if n/3 <= len(queries):
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
    else:
        # compute the cumulative sum from reverve
        # so we can early stop if the val is too far from maxval
        cumsum = [q[2] for q in queries]
        for i in range(len(queries) - 2, -1, -1):
            cumsum[i] += cumsum[i+1]

        # first check if they overlap
        maxval = 0
        for i in range(len(queries) - 1):
            q = queries[i]
            for j in range(len(queries)):
                if (maxval - q[2]) > cumsum[j]:
                    break
                if i != j:
                    q = overlap(q, queries[j])



            if q[2] > maxval:
                maxval = q[2]

        if queries[len(queries)-1][2] > maxval:
            return queries[len(queries)-1][2]
        else:
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

