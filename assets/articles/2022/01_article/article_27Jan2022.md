## Hunt for O(1) search

2022-01-27

1300 words

## List of lists

Using hash tables to beat the binary search timing at finding data items, hashing has proven its worth. Its O(1) efficiency is what makes it so attractive. But as Miller and Ranum (2011) assert, it can be rather difficult to design a perfect hash function. One of the ways to resolve collisions is through chaining.

And this is where I tried to push it further. Rather than designing a hash function, the structure of the hash table itself can serve in placing data items at their positions, in a way, using the structure itself as a hash function. The aim has been to keep it simple, as that is where the efficiency is maintained. Using a starting list length, the remainder method is used for item placement, whenever a collision happens, a new list is placed at the given index, but this time its length is changed. The remainder method is used again, and the two colliding items are placed in the inner list. This happens whenever there is a collision. The important assumption here is that no two items have the same remainder when being placed in two successive lists, as the remainder method uses different list lengths. If the starting list is at a level 0, then each collision would introduce a list at an inner level (in this case level 0 + 1), and each level would have lists of the same length, yet different from other levels to introduce variation into the remainder method.

![Figure 1: A structure of nested lists is created as collisions occur. Here the length of lists decreases by 1 at each inner level.](assets/articles/2022/01_article/02_structure.png "Figure 1: A structure of nested lists is created as collisions occur. Here the length of lists decreases by 1 at each inner level.")

## The result

My first design dwelled on starting list of length 3 or 4 (with increasing list length by 1 at each inner level, unlike the Figure 1, where the length decreases, for clarity purposes of simplifying the structure). But this has quickly proved unproductive, as collisions appeared right away, practically being forced upon it, and this would greatly worsen the space efficiency. Then I tried a structure which lowered the size of every level, as can be seen in the Figure 1, I assumed that with sufficiently large starting list (e.g. of size 10) I could place !10 items in it. But this has proved not to be the case, as lists themselves occupy positions, thus the possible storage might by described as !10 minus number of collisions (and minus lists of length 1 as in these no two colliding items can be placed). Thus, with several tens of thousands of items to be stored (my tests had from 10^4 to 10^6 items to be stored) a starting list of a length between several tens to several hundreds places was found to be most useful (for search to be fast), with inner lists of increasing length (rather then decreasing length).

.py

***

~~~python
def get_jump():
    return 41


def insert_it(a_list, an_item, a_hash, a_level):
    jump = get_jump()
    if a_list[a_hash] is None:
        a_list[a_hash] = an_item
    elif type(a_list[a_hash]) is list:
        new_hash = an_item % (a_level + jump)
        inner_list = a_list[a_hash]
        insert_it(inner_list, an_item, new_hash, (a_level + jump))
    else:
        current_item = a_list[a_hash]
        current_item_hash = current_item % (a_level + jump)
        new_list = [None] * (a_level + jump)
        new_list[current_item_hash] = current_item
        a_list[a_hash] = new_list
        new_hash = an_item % (a_level + jump)
        insert_it(new_list, an_item, new_hash, (a_level + jump))


def find_position(a_list, an_item, a_hash, a_level):
    jump = get_jump()
    if a_list[a_hash] == an_item:
        return a_level, a_hash, a_list[a_hash]
    elif type(a_list[a_hash]) is list:
        new_hash = an_item % (a_level + jump)
        inner_list = a_list[a_hash]
        return find_position(inner_list, an_item, new_hash, (a_level + jump))
    return a_level, -1, a_list[a_hash]


position_stats = [0 for _ in range(get_jump() * get_jump() if get_jump() > 50 else 2500)]


def count_lists(a_list):
    position_stats[len(a_list)] += 1
    lists_size = 0
    count = 0
    for i in a_list:
        if type(i) is list:
            lists_size += len(i)
            count += 1
            curr_count, curr_size = count_lists(i)
            lists_size += curr_size
            count += curr_count
    return count, lists_size


class DList:
    def __init__(self):
        """ Initial object is an empty list."""
        self.list_length = 297
        self.dList = [None for _ in range(self.list_length)]

    def is_empty(self):
        """ Returns true if and only if the list 'dList' is empty. """
        is_empty = True
        for i in self.dList:
            if i is not None:
                is_empty = False
        return is_empty

    def insert(self, item):
        """ Checks the index at a_hash, if it is not empty creates new
         inner list and inserts in the list."""
        a_hash = item % self.list_length
        insert_it(self.dList, item, a_hash, self.list_length)

    def find(self, item):
        """ Returns a level (how far from the starting list the inner list is)
         and index of the item in the list if found, otherwise returns level and -1. """
        a_hash = item % self.list_length
        return find_position(self.dList, item, a_hash, self.list_length)

    def show_stats(self):
        """ Prints out list count, and total length of all lists. """
        list_count, lists_size = count_lists(self.dList)
        print("dList object's number of inner lists, and length of all inner lists: ",
              list_count, " : ", lists_size)
        list_levels = position_stats[self.list_length::get_jump()]
        # print("Position status: ", list_levels)
        level = 0
        for i in list_levels:
            if i > 0:
                print("Level " + str(level) + " contains " + str(i) + " list(s), each of length "
                      + str(self.list_length + (level * get_jump())))
            level += 1
~~~

***

## Observations

I tried to keep the code simple, with the Github repository containing explanatory notes, however, the two helper methods – **insert_it** and **find_position** deserve attention. As described in the introductory section, no special method is used to insert items in the ADT object, a simple remainder method serves the purpose. Every time there is a collision, an inner list is created, with different length, placed at the collision index, then the two colliding items are placed in the inner list, again using the remainder method. The important assumption is that no two items collide repeatedly after changing the parameter of list length. In finding items the same remainder methods are used, every time it finds a list at a position, it recalculates the position for the inner list and looks again.

My aim has been to beat the binary search at search speed, after achieving this (although this is conditional, please, read on), I looked into the space efficiency. This is rather unsatisfactory, indeed, every time an inner list is created when a collision happens, space is wasted. But the catching detail about the structure of the ADT is that the speed and space are dependent on the starting list length, the range of items to be held and length difference between list levels (Figure 2).

![Figure 2: Item range and lists' length predispose speed and space efficiency.](assets/articles/2022/01_article/03_speed_space.png "Figure 2: Item range and lists' length predispose speed and space efficiency.")

In my tests the items stored were in the range 10^4 – 10^5 (or 10^6), and the challenge was to find such a combination of starting list length and length changes between levels so as to maintain speed efficiency without wasting space. This is where a closer inspection would be appropriate. The combination which proved efficient (storing integers from 10 000  to 110 000) featured starting list of length 297 and upward changes of 41 (increasing list length by 41 at each level change). In this way there were just 297 collisions and the overall length of all inner lists was 100 386. This is rather fascinating. Items can be stored in such a way that all items take just a few steps to find. Thus the search is indeed O(1) even if difficult to achieve together with efficient space utilization.

If you find any errors, please, let me know.

**References:**

_Miller, B.N. and Ranum, D.L. (2011). Problem solving with algorithms and data structures using Python. Sherwood, Or.: Franklin, Beedle & Associates._
