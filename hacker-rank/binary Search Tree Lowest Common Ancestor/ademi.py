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
      def __init__(self,info):
          self.info = info
          self.left = None
          self.right = None


def lca(root, v1, v2):
    # shouldn't we make sure that v1 < v2 for a start
  print(recurse(root,v1,v2))

def recurse(current,v1,v2):
  if v1 <current and v2 >current:
    return current
  if v

tree = BinarySearchTree()

"""
a ==> 1.2.4
b ==> 7.4

set(a.split('.')) - set(b.split('.'))
>>> (4)
"""

test_string_1 = """ 6
2 4 3 1 7 6
1 7
4"""

t = 6 #int(input())

arr = list(map(int, "2 4 3 1 7 6".split()))

for i in range(t):
    tree.create(arr[i])

#v = list(map(int, input().split()))
v = [1,7]

ans = lca(tree.root, v[0], v[1])
print (ans.info)
