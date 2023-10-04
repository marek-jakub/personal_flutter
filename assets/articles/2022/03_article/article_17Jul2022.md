## In-order traversal of a nested list structure

2022-07-17

600 words

In-order traversal is usually applied to tree structures. In my previous blog post, a problem solution was described, which used nested lists as the data type of choice. One part of the problem involved in-order traversal. As binary tree was not used, but rather nested lists to approximate binary tree, the solution had to circumvent the usual implementation to provide in-order traversal functionality. This is a description of the algorithm used to achieve that.

To refresh memory, nested lists provide a simple data structure, and such a structure was used to approximate binary tree. The normal implementation of in-order traversal of a binary tree is described as a recursive in-order visit of the left subtree, then root node and finally a recursive in-order visit of the right subtree (Miller and Ranum, 2011). Nested lists (such as Figure 1) lack the structure of interconnected nodes of a binary tree, instead, they form an ordered collection of items (objects in the case of inner lists). As can be seen in the figure, while natural numbers indicate tree nodes, the value of -1 indicates no children.

![Nested lists](assets/articles/2022/03_article/01_lists.png "Nested lists structure")

_Figure 1: Nested lists, approximating a binary tree._

To be able to define in-order traversal of such a structure, a pattern of movement had to be found, which would follow recursive left subtree, root, recursive right subtree path.

In-order traversal starts at the root, which sits at depth 1. It checks the root node for an existing left child, if it exists, traversal moves to the left child. This carries on until the visited node does not have left child. The value of the visited node is recorded and the traversal continues with its right child (if in existence). This pattern is easy to implement when faced with left/right edges between nodes (and it can be easily found in books on programming).

In search of a solution it is important to look for patterns (or regular occurrences). Having defined the structure and desired movement through that structure for in-order traversal, characteristics of that movement were still missing. In such situations, modelling helps. Using simple models (paper sketches), it was found that if a position of the visited node at the current level of the tree is determined (starting from left and counting from 1), then positions of its children can easily be calculated, i.e. that there exists a pattern, as given in the Figure 2:

![Movement](assets/articles/2022/03_article/02_lists_travel.png "Binary tree-like movement")

_Figure 2: A description of a binary tree-like movement in nested list structure, through nodes 1-3-6-12._

The binary tree movement in nested lists structure is achieved by direct determination of positions of a node’s children. While in a binary tree nodes are connected through node attribute values (e.g. ‘leftChild’ and ‘rightChild’), in this case left child is found by determining position of parent node in the inner list (signifying tree level), e.g. position is 3 in the case of node ‘6’ in the Figure 2 and applying the formula (3 x 2) - 2 to give 4. The right child is found by applying formula (3 x 2) - 1 to give 5. Now positions 4 and 5 of the following list (signifying next depth of the tree) can be checked for existing nodes possibly holding that node’s children.

Due to the lack of edges, nested lists require several variables to keep track of traversed nodes’ position, the implementation given below holds the position of visited inner list (holding nodes at a given depth of the tree), the position of visited node in an inner list and the depth of the tree (designated as the number of levels in the method). The node at the current position is selected, the count of nodes positioned left-wise to the node at a given level of the tree is determined, followed by in-order traversal movement. Those variables allow for the binary tree-like movement across nested lists, and implementation of the in-order traversal. As an exercise, please, try implementing other forms of traversal.

**References:**

_Miller, B.N. and Ranum, D.L. (2011). Problem solving with algorithms and data structures using Python. Sherwood, Or.: Franklin, Beedle & Associates._

.java

***

~~~java
public static void in_order(List<List<Integer>> input_tree, int level, int pos, int num_of_levels) {
    
    Integer a_node = input_tree.get(level).get(pos);

    int count = 1;
    for (Integer an_int : input_tree.get(level)) {
        if (!Objects.equals(an_int, a_node) && an_int > -1) {
            count++;
        } else if (Objects.equals(an_int, a_node)) {
            break;
        }
    }

    if (level < num_of_levels && input_tree.get(level + 1).get((count * 2) - 2) != -1) {
        in_order(input_tree,level + 1, (count * 2) - 2, num_of_levels);
    }
    System.out.print(a_node + " ");
    if (level < num_of_levels && input_tree.get(level + 1).get((count * 2) - 1) != -1) {
        in_order(input_tree,level + 1, (count * 2) - 1, num_of_levels);
    }
}
~~~

***
