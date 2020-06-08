"""
A		rotate
[1,6,5,2,4,3]	[6,5,2]
[1,5,2,6,4,3]	[5,2,6]
[1,2,6,5,4,3]	[5,4,3]
[1,2,6,3,5,4]	[6,3,5]
[1,2,3,5,6,4]	[5,6,4]
[1,2,3,4,5,6]

YES
"""

test1 = [3, 1, 2]
test2 = [1, 3, 4, 2]
test3 = [1, 2, 3, 5, 4]
test4 = [1, 6, 5, 2, 4, 3]
test5 = [3, 1, 2, 4]


def larrysArray(array):
    cycle_groups = generate_cycle_groups(array)
    print(cycle_groups)
    swaps = len(array) - len(cycle_groups)

    if swaps % 2 == 0:
        return "YES"
    elif swaps % 2 == 1:
        return "NO"


def generate_cycle_groups(array):
    cycle_groups = []

    i = 0
    next_element = i+1
    while next_element <= len(array):
        flattened_cycle_groups = [x for y in cycle_groups for x in y]
        if next_element in flattened_cycle_groups:
            next_element += 1
            continue
        else:
            i = array.index(next_element)

        subgroup = []
        element = array[i]
        while True:
            if element == i+1 or element in subgroup:
                subgroup.append(element)
                cycle_groups.append(subgroup)
                i += len(subgroup)
                break
            else:
                subgroup.append(element)
                element = array[element-1]

    return cycle_groups


for i, test in enumerate([test1, test2, test3, test4, test5]):
    print(f"== TEST #{i+1} ==")
    print("Input:", test)
    print("Output:", larrysArray(test))
