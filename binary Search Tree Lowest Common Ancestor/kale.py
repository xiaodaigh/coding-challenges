class Node:
    def __init__(self, info):
        self.info = info
        self.left = None
        self.right = None
        self.level = None
        self.parent = None

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
                        current.left.parent = current
                        break
                elif val > current.info:
                    if current.right:
                        current = current.right
                    else:
                        current.right = Node(val)
                        current.right.parent = current
                        break
                else:
                    break


test_string_1 = """ 6
2 4 3 1 7 6
1 7
4"""

test_string_2 = """ 6
2 1 3 4 5 6
3 6
4"""


def parse_input(string):
    n, nodes, v1v2, solution = string.split("\n")
    node_list = nodes.split()
    v1, v2 = v1v2.split()

    n, v1, v2, solution = int(n), int(v1), int(v2), int(solution)
    node_list = [int(x) for x in node_list]
    return n, node_list, (v1, v2), solution


def tree_traversal_array(tree):
    arr = []

    node = tree.root
    while True:
        print(node.info)
        if node.left and node not in arr:
            node = node.left
            arr.append(node)
            continue
        elif node.right:
            node = node.right
            arr.append(node)
            continue
        elif node.parent:
            node = node.parent
        else:
            break

    return arr


def lca(n, tree, v1, v2):
    traversal_array = tree_traversal_array(tree)
    E = [x.info for x in traversal_array]
    L = [x.level for x in traversal_array]
    H = [E.index(i) for i in range(n)]
    ans = Node("Hello World!")
    return ans


t, arr, v, expected_ans = parse_input(test_string_1)

tree = BinarySearchTree()

for i in range(t):
    tree.create(arr[i])

ans = lca(t, tree, v[0], v[1])
print(ans.info, expected_ans)

print(str(tree.root.right), tree.root.right.parent == tree.root)