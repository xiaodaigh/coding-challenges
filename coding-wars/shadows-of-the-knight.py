# https://www.codingame.com/training/expert/shadows-of-the-knight-episode-2

import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# w: width of the building.
# h: height of the building.
w, h = [int(i) for i in input().split()]
n = int(input())  # maximum number of turns before game over.
x0, y0 = [int(i) for i in input().split()]

# every move batman makes will split the board into "COLDER", "WARMER", "SAME"
# I want to minimise this metric which will try to have as "even" as a distribution
# The metric n_colder^2 + n_warmer^2 + n_same^2

# keeps track of the possible locations
# initally all locations are possible


def is_middle(pos, length):
    if length % 2 == 1:  # has to odd for somthing to fall in the middle
        if pos == ((length - 1) // 2):
            return True
    return False


# game loop
def game_loop(w, h, x0, y0, offset_x=0, offset_y=0, possible_locations={}):
    while True:
        # Current distance to the bomb compared to previous distance (COLDER, WARMER, SAME or UNKNOWN)
        bomb_dir = input()

        # Write an action using print
        # To debug: print("Debug messages...", file=sys.stderr)
        #if bomb_dir == "UNKNOWN":
        # this is the first first move
        in_middle = False
        if is_middle(x0, w) and is_middle(y0, h):
            in_middle = True
            # find the longer side and move 2 steps
            # this will maximize the metric
            # TODO shorter than 3 is special case
            if w >= h:
                new_x0 = x0 - 2
                new_y0 = y0
            else:
                new_x0 = x0
                new_y0 = y0 - 2
        else:
            # the location is not in the middle. Go to reflection point
            new_x0 = (w - 1 - x0) % (w-1)
            new_y0 = (h - 1 - y0) % (h-1)

        print(f"{offset_x+new_x0} {offset_y+new_y0}")

        # after the first move
        # we can add
        bomb_dir = input()
        if in_middle:
            if bomb_dir == "SAME":
                # must be on the line that separates the two
                # parts
                if w >= h:
                    # on line
                    # line x0 - 1
                    pass
                else:
                    # line y0 - 1
                    pass
            elif bomb_dir == "WARMER":
                # I got closer so must be current location and below
                return game_loop(w, h, new_x0, new_y0)
            elif bomb_dir == "COLDER":
                # I got closer so must be last location and below
                return game_loop(w, h, new_x0, new_y0)
        else:
            # it's not in the middle so
            # run thru all
            if bomb_dir == "SAME":
                # add cells from the diagonal (x0, new_y0) and move to (new_x0, y0)
                # to possiblilities
                # must be on the diagonal

                # (x0, y0)(new_x0, new_y0)
                # possible_locations
                pass
            elif bomb_dir == "WARMER":
                # add a triangle
                pass
            elif bomb_dir == "COLDER":
                # add triangle
                pass

    # apply the slow algorithm
    # which works like this
    # for each position in the posibilities,
    # compute its length


game_loop(w, h, x0, y0)
