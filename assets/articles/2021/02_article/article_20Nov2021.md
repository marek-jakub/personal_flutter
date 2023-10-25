
## An old-fashioned library (bookcase)

2021-11-20

1800 words

## Model a bookcase

One of the questions in my exam on algorithms and data structures was to suggest a data structure for holding books. An immediate proposal could be a balanced tree with book ISBN as a unique identifier. For some time after the exam I kept thinking about modelling an old-fashioned library with books placed in shelves separated by first letter of writer (or book) names. I had trouble designing an abstract data type (ADT) which would be simple enough (data stored in a single list), yet model such bookcases. The revelation came while drawing three-dimensional shapes on paper. Given a three-dimensional shape, such as cube, each one of its nodes can point to another cube. This is achieved by adding 1 to a node index in the starting cube and multiplying by 8 (the number of nodes in the cube).

![A list with indices 0 to 71 can be divided into containers based on a three-dimensional shape (in this case cube).](assets/articles/2021/02_article/01_cubes.jpg "A list with indices 0 to 71 can be divided into containers based on a three-dimensional shape (in this case cube).")

Each cube has the same number of nodes, this being obvious, yet important in determining starting and ending indices of each cube. The list holding data can thus be cut into such cubes, and these can become containers for holding books. However, if it was based on cube, the number of books which could be placed in such bookcase would be limited. Luckily any three-dimensional shape could be used. If the starting three-dimensional shape had 26 nodes for each letter of the alphabet, then by adding one and multiplying by the number of nodes of such shape the correct position of the container for that letter could be determined. But with increasing load the number of nodes in a container might need to increase to accommodate data items (books). Or the containers might shrink if books are removed from the list. Increasing or shrinking in size, the overall structure of the ADT has to be determined by one shape and one shape only, as the separation of containers is determined by this one shape. Thus, if the size of one container increases (with more nodes being added to hold books), the size of all containers increases, and vice-versa. This has direct impact on the size of the list holding data items, it increases significantly with just one container being filled. If there are many books starting with one letter (or a smaller group of letters having many books), then size of each container would mirror the most utilized one, but be empty (or less utilized). The space efficiency is thus compromised.

## The result

With 26 letters in the alphabet (conventional British), the starting three-dimensional shape would have 26 nodes. This has become an exercise of separating words alphabetically into one list, while keeping the separation under control. I am going to use ‘word’ or ‘book’ interchangeably from now on, meaning the same thing, an item in the list.

As books are inserted into the list, the number of nodes might change, therefore I had to decide where to hold the number of nodes for the three-dimensional shape describing the current container size, as well as the load of each container to determine if containers’ size should be scaled up or down. The implemented ADT has a variable holding this information, but the first node of the list could hold this information as well (no need for both, but the implementation contains both to show either of the possibilities). On object creation, the list is separated into 28 containers, the first holding the alphabet, the second holding the load for each letter and 26 containers for each letter in the alphabet (holding books).

.py

***

~~~python
def index(letter, alphabet):
    insertion_index = -1
    for i in range(26):
        if alphabet[i] == letter.lower():
            insertion_index = i + 1

    return insertion_index


class ShapeList:
    def __init__(self):
        """ Initial size of the list is (shape_nodes + 1) * shape_nodes, first value in the
         list is the current size of the 3-D shape, then follows the alphabet. """
        # Number of containers is 26 + 2 (alphabet length + 2 containers holding alphabet
        # characters and letter load).
        self.containers = 27
        # Storing the 3-D shape size in this variable, redundant, as the information is stored
        # in the list at index 0 as well.
        self.shape_nodes = 27
        self.shape_list = list(None for _ in range((self.shape_nodes + 1) * self.shape_nodes))
        self.shape_list[0] = self.shape_nodes
        for i in range(1, self.shape_nodes, 1):
            self.shape_list[i] = chr(i + 96)
            self.shape_list[i + self.shape_nodes] = 0

    def is_empty(self):
        """ The load of inserted words for each letter reside at indices i + shape_size.
         If they are all 0, containers are empty (returns true). """
        is_empty = True
        for i in range(1, self.shape_nodes, 1):
            if self.shape_list[i + self.shape_nodes] != 0:
                is_empty = False
                break
        return is_empty

    def insert(self, item):
        """ Inserts an item at the range of indices which account for a given first letter
         of the item. Returns False if the insertion is not successful. """
        inserted = False
        insertion_index = index(item[0], self.shape_list[1:27])

        if insertion_index != -1:
            letter_load = self.shape_list[insertion_index + self.shape_nodes]
            # If the load of the sublist is getting close to the size of the 3-D shape,
            # i.e. soon to be filled in, it needs to be enlarged. The difference is
            # arbitrary, currently it is 5.
            if self.shape_nodes - letter_load < self.shape_nodes - (self.shape_nodes - 5):
                increased_by = self.shape_nodes // 2
                increase_list = list(None for _ in range(increased_by))
                # It has to be performed from the end of the list to correctly point to
                # empty parts of containers.
                for i in range(self.containers, -1, -1):
                    self.shape_list[(self.shape_nodes * i) + self.shape_nodes:
                                    (self.shape_nodes * i) + self.shape_nodes] = increase_list
                self.shape_nodes += increased_by
                self.shape_list[0] = self.shape_nodes

            # After checking the load for the letter, the word can be inserted.
            letter_start_index = (insertion_index + 1) * self.shape_nodes
            if letter_load < self.shape_nodes and \
                    self.shape_list[letter_start_index + letter_load] is None:
                self.shape_list[letter_start_index + letter_load] = item
                self.shape_list[insertion_index + self.shape_nodes] += 1
                inserted = True

        return inserted

    def search(self, item):
        """ Returns the index of the item if found, otherwise returns -1. The search
         is linear, if found, the index marks the first item found. """
        item_index: int = -1
        search_index = index(item[0], self.shape_list[1:27])

        letter_load = 0
        if search_index != -1:
            letter_load = self.shape_list[search_index + self.shape_nodes]

        if letter_load != 0:
            i = (search_index + 1) * self.shape_nodes
            found = False
            while i < ((search_index + 1) * self.shape_nodes) + self.shape_nodes and not found:
                if self.shape_list[i] == item:
                    found = True
                    item_index = i
                i += 1

        return item_index

    def remove(self, item):
        """ The first word found by linear search and equal to the item is replaced by None
         and True returned, if not found, False is returned."""
        removed = False
        item_index: int = -1
        sublist_index = index(item[0], self.shape_list[1:27])

        letter_load = 0
        if sublist_index != -1:
            letter_load = self.shape_list[sublist_index + self.shape_nodes]

        found = False
        if letter_load != 0:
            i = (sublist_index + 1) * self.shape_nodes
            while i < ((sublist_index + 1) * self.shape_nodes) + self.shape_nodes and not found:
                if self.shape_list[i] == item:
                    found = True
                    item_index = i
                i += 1

        if item_index != -1 and found:
            self.shape_list[item_index] = None
            removed = True
            self.shape_list[sublist_index + self.shape_nodes] -= 1

        # Check if containers could be resized to decrease the overall list size.
        if removed:
            max_load = max(self.shape_list[self.shape_nodes + 1: self.shape_nodes + self.containers])
            # Decrease each sublist of words by 1
            if self.shape_nodes - max_load > 5 and self.shape_nodes - 5 > self.containers:
                # It has to performed from the end of the list, to correctly point to empty
                # parts of containers.item[0]
                for i in range(self.containers, -1, -1):
                    self.shape_list.pop((self.shape_nodes * i) - 1)
                self.shape_nodes -= 1
                self.shape_list[0] = self.shape_nodes

        return removed

    def show(self, letter):
        """ The sublist of words starting with the letter is returned, if it is empty, an empty
        list is returned. """
        sublist_index = index(letter, self.shape_list[1:27])

        if sublist_index != -1:
            letter_load = self.shape_list[sublist_index + self.shape_nodes]
            print(self.shape_list[(sublist_index + 1) * self.shape_nodes:
                                  (sublist_index + 1) * self.shape_nodes + letter_load])
        else:
            print("Enter a letter of alphabet")

    def show_stats(self):
        """ Shows the length of the list holding the data (size of all containers), number of
          inserted words and the load of each container. """
        print("Containers have size: ", len(self.shape_list), " number of inserted words: ",
              sum(self.shape_list[self.shape_nodes + 1: self.shape_nodes + self.containers]))
        print("Letter loads:")
        for i in range(1, 27):
            print(self.shape_list[i], " - ", self.shape_list[self.shape_nodes + i])
~~~

***

## Observations

The ADT works by determining which container a given book is in (search), or should be inserted into/deleted from. The insertion, deletion and search currently rely on linear operations, it would be great, if you, the reader, could improve this design.

### Insertion

Finding the matching letter in the alphabet to the first letter of a book, the index of the matching letter points to the container holding books starting with the given letter. Insertion is fast as the load of a given container is known and a book is inserted after the last book inserted into the container. The load is important in determining if container size should be increased, currently each container has at least five free spaces available for book insertion. Here, if containers are enlarged, an interesting activity happens. In order for the information on container indices to stay valid, containers have to be enlarged from the last (holding ‘z’ books) to first (holding ‘a’ books). Otherwise, enlarging containers from the first one would move all the following containers out of order. This implementation of the ADT does allow insertion of matching books (words) in the list. Returns true or false based on the success of the operation.

### Deletion

The operation starts with finding the index of the matching letter to the first letter of the book, so that the container holding the book is determined. The book is searched for in the given container, and the first book match is replaced with ‘None’, this lowers the container load and checks if the container size could be lowered as well. If possible, the container size is lowered by one, the three-dimensional shape looses a node, so every container has its size decreased by one (remember, the three-dimensional shape describes the size of each container in the bookcase). This is again an exercise of reducing container size in backward fashion to keep information on container indices correct. Returns true or false based on the success of the operation.

### Search

A simple operation of finding the index of the matching letter to the first letter of the book and then searching linearly the container for the first occurrence of the book. Returns -1 if not found, else returns the index of the book (this takes into account the whole list - library), not just the container (bookcase), so the index refers to the index of the book when the whole list is considered.

It would be great if you could take it further and refine the design. This implementation has a big flaw, in that it is very space inefficient. Linear search could be replaced. A facility added for storing digits. Using one list for storing all items is a shortcoming, however, which can only be removed by completely discarding a three-dimensional shape describing container size, and maybe use the container load instead to find any given container.

If you find any errors, please, let me know.
