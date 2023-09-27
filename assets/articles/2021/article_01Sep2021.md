
## From binary tree to exponential search

2021-09-01

1000 words


## A node addition

Studying algorithms and data structures by Miller and Ranum (2011) I came across binary tree abstract data type (ADT). It is an ingenious device, where its Yes/No or 0/1 choice paths lead to many useful implementations. As I drew a binary tree for an assignment, I thought, why not try to implement a ternary tree ADT, with three choice paths instead of two. It would be such a novel idea, wouldn’t it?


![Binary and ternary](assets/articles/2021/01_b_to_t.jpg "Binary to ternary")

_Adding an extra path to each node makes ternary tree out of binary tree._

In my newbie ignorance I thought I had come across a new implementation of a tree. However, a quick search deflated my enthusiasm, as the ternary tree is a well-known type. Putting my design on paper, I observed a catching detail about the tree. If the nodes were numbered, the index of nodes at a level edges could easily be predicted. The formula was given by adding 1 to previous node index at the rightmost extreme end of a level and multiplying by 3 (i.e., number of edges per node):

![Tree indices](assets/articles/2021/02_indices.jpg "Ternary tree indices")

_Finding node indices at extremities for each level of the ternary tree._

Now, both edge nodes can have easily defined indices, if the rightmost node index is divided by 3, then the leftmost node index at the same level is determined. This led me to ponder whether it could be used in a search algorithm. The binary search halves the number of items in an ordered collection at each turn, this search would dismiss levels not containing the item searched for. After finding the tree level containing the item of interest, the search would continue with the items contained in the given level, i.e. items bordered by the leftmost and rightmost nodes for the given level. The only condition, the same as with the binary search, is that the data is ordered.

## The result

The resulting function is nothing new, as Bentley and Yao (1976) proposed such a search, incorporated in the exponential search. However, exploring their work and rediscovering a well-known algorithm is a fantastic way to learn. I named the function level_search, to highlight the process of search, dismissing levels not containing the item searched for. The search starts at the beginning of a collection, then visits the rightmost item of each level of a ternary tree, comparing it to the item being searched for. It continues until an item greater than or equal to the search item is found, the search then starts again from the beginning of the given level:

.py

~~~python
def level_search (an_array, an_item):
    high = len(an_array)
    current_pos = 0
    while current_pos < high and an_array[current_pos] < an_item:
        level = 0
        step = current_pos
        while step < high and an_array[step] < an_item:
            level = (level + 1) * 3
            step += level
        current_pos += int (level / 3)
    if current_pos < high and an_array[current_pos] == an_item:
        return current_pos
    else:
        return -1
~~~

## Observations

Bentley and Yao (1976) propose a two-step search, or search of several steps, where an item searched for is found by a binary search after limiting its existence by well-defined borders. Indeed, the function given above performs much worse compared to the binary search:

![Binary search](assets/articles/2021/03_compared.jpg "Search timings compared")

_Binary search and level search timings compared, with search items generated randomly._

If an ordered collection of size n is considered, then the maximum number of steps taken by a binary search in an item look-up is given by log 2 (n). It is not exactly so with the function given above. Even though its Big-O is logarithmic (log n), the search steps are being repeated over and over until the item being sought is found (or not). How does that happen? Given that an item which is being sought exists in an ordered collection, then in the first run the level it sits in is determined (let us say level1 – the first run). The second run takes the whole level1, starts from the first item in the level and again determines the level (let us say level2 – the second run) the item sits in, as if the items in the level1 formed a new tree, with the first item in the level1 being the root node of that tree. These runs are being repeated until the item is found. This means that in the worst-case scenario, the number of steps taken to found it would be log 3 (n) + log 3 (level1 size) + log 3 (level2 size) and so on until it is found. In this way, levels are being discounted in search, but the size of the next step search table depends on where in the collection the item searched for resides, as the search starts from the beginning of the collection (or level). Thus, the search takes more steps to find the item, compared to the binary search. However, with the level_search function the search starts at the beginning of the collection, it might therefore perform better with items searched for residing close to the beginning of the collection (compared to the binary search). That would be its best-case scenario.

One more note is that the level_search function is not confined to the model of ternary tree. It works with N-ary trees as well, with 2, 4 or more nodes per parent node. The implementation is simple, instead of hard-coding in three edges per node as I have done, a variable could be defined which would hold the number of edges of the tree the search function would model. Or, at each turn of the search, the number of edges could change, so the search could start with a tree having many edges per node, and three or even two nodes could be used to pinpoint the item being searched for at the end of the search. I will leave it to you, the Reader, to perform efficiency comparisons between different N-ary trees.

I will be happy to remove any errors you find. Please, let me know!

**References:**

_Bentley, J.L. and Yao, A.C.-C. (1976). An almost optimal algorithm for unbounded searching. Information Processing Letters, [online] 5(3), pp.82–87. Available at: <https://pmt-eu.hosted.exlibrisgroup.com/primo-explore/fulldisplay?docid=TN_cdi_osti_scitechconnect_1318069&context=PC&vid=44OPN_VU1&lang=en_US&search_scope=EVERYTHING&adaptor=primo_central_multiple_fe&tab=default_tab&query=any,contains,An%20almost%20optimal%20algorithm%20for%20unbounded%20searching&offset=0> [Accessed 20 Aug. 2021]._

_Miller, B.N. and Ranum, D.L. (2011). Problem solving with algorithms and data structures using Python. Sherwood, Or.: Franklin, Beedle & Associates._
