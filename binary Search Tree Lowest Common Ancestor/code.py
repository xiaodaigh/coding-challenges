class Node:
    def __init__(self, info):
        self.info = info
        self.left = None
        self.right = None
        self.level = None

    def __str__(self):
        return str(self.info)


class BinarySearchTree:
    def __init__(self):
        self.root = None

    def create(self, val):
        if self.root == None:
            self.root = Node(val)
        else:
            current = self.root

            while True:
                if val < current.info:
                    if current.left:
                        current = current.left
                    else:
                        current.left = Node(val)
                        break
                elif val > current.info:
                    if current.right:
                        current = current.right
                    else:
                        current.right = Node(val)
                        break
                else:
                    break
# Enter your code here. Read input from STDIN. Print output to STDOUT


class Node:
    def __init__(self, info):
        self.info = info
        self.left = None
        self.right = None


def lca(root, v1, v2):
    # ensure v1 < v2
    if v1 > v2:
        return lca(root, v2, v1)
    return recurse(root, v1, v2, root)


def recurse(current, v1, v2, root):
    if (v1 == current.info) or (v2 == current.info):
        return current
    if v1 < current.info and v2 > current.info:
        return current
    elif v2 < current.info and v1 > current.info:
        return current
    elif v2 < current.info and v1 < current.info:
        if current.left == None:
            return root

        return recurse(current.left, v1, v2, root)
    elif v2 > current.info and v1 > current.info:
        if current.right == None:
            return root
        return recurse(current.right, v1, v2, root)


tree = BinarySearchTree()

"""
      2 1 0
a ==> 1.2.4

      1 0
b ==> 7.4

# set(a.split('.')) - set(b.split('.'))
>>> (4)
"""

test_string_1 = """ 6
2 4 3 1 7 6
1 7
4"""

t = 6  # int(input())

arr = list(map(int, "2 4 3 1 7 6".split()))

for i in range(t):
    tree.create(arr[i])

#v = list(map(int, input().split()))
v = [1, 7]

ans = lca(tree.root, v[0], v[1])
print(ans.info)
