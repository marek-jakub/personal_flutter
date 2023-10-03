## How not to solve HackerRank problems

2022-03-16

1200 words

Taking a time to solve HackerRank problems is a great way to prepare for a job interview or school exams. Problems pose as stepping stones, starting at easy difficulty, through medium to hard, and then on to advanced or expert levels. A problem one chooses to solve is described, and input/output characteristics are given. If one does struggle, one can opt to enter discussion thread, where regularly solutions appear, study those first before entering one’s own solution, or choose to see editorial notes (in that case solution points do not count).

So it could be said that a precondition to a good solution is a detailed understanding of a given problem. There are usually hints indicating what structures could be used in problem solution, with links to complementary material. This is where I made my first mistake. Instead of following suggestions to some study text, I ignored it. The problem I was to solve is called Swap Nodes [Algo] (Kumar, n.d.), defined as a medium difficulty problem. In hindsight analysis, my decision stemmed from a false feeling of security and I must admit, arrogance (I assumed I could solve it in reasonable amount of time without any help input). Making several attempts, reading and re-reading the problem description, I realized my initial views were incorrect and that I could not provide a solution in a couple of hours. But instead of opting for a helping hand in the form of discussion thread I doubled down in my strong-headedness to find the solution on my own, barring any outside input. I did for a few moments revel in the cold shower of self-pity, having a blank look of a disillusioned student (the worst time for anyone to make decisions), being on the cross-roads of closing the laptop lid, walking away or doggedly carry on. I chose the second option. This was a second mistake, instead of calming down and reassessing the situation, I had to invest resources not meant to be applied to solving this problem.

Using known and well established data structures (DS) brings many benefits to problem solving. Not only it allows efficient time/space utilization, but also unloads from programmers’ shoulders the need to reinvent concepts (although one could argue fun is taken out of it). By ignoring suggested DSs I had to push my way through input data, understand its structure and define functions which would adapt it in ways appropriate for solution to be viable. This happened to be yet another mistake, as I chose an easy to understand structure (list of lists). From that point on it was an uphill struggle, as I had to find, adjust and define solutions appropriate for that structure. It nicely shows the two faces of problem solving – hard-to-understand structures could make problem solving easier while easy-to-understand (or implement) structures can set you on a path of uphill struggle.

Swap nodes [Algo] is a very nice problem. The input is a number of lines containing two integers signifying nodes in a binary tree. The required output involves in-order traversal of the nodes in the binary tree. However, there is a midway task of swapping nodes at given levels of the tree prior to output. Thus, the work could be separated into stages. First, build a tree. Second, swap nodes at given levels. Third, output nodes through in-order traversal.

I didn’t build a binary tree with the nodes given as input, instead, I built a structure (list of lists) modelling the tree by keeping nodes in lists, each list holding nodes found at a certain level of the tree. An example of input structure is given in the Figure 1:

![Integer input](assets/articles/2022/02_article/03_input.png "Input of integer couples")

_Figure 1: Line after line of integer couples signifying previous nodes’ children._

In the given example, there are 17 nodes overall, the node 1 (not in input) being assumed root node (depth 1), the tree can be build with integers signifying nodes and -1 signifying no descendants. As each node can have a maximum of two children, tree levels can be build from the given input, each depth having double the amount of previous depth nodes, as can be seen in the Figure 2:

![Nested lists](assets/articles/2022/02_article/02_lists.png "Tree structure approximation")

_Figure 2: Even if nested lists provide tree structure approximation and simple implementation, they could be difficult to work with._

As the starting structure had been only an approximation of the structure really needed, and because following stages required and relied on that structure to achieve their goals, I had a hard time defining the logic of the solution. The next stage after building the tree structure, swapping nodes at given depth, proved a difficult task. Instead of working with single nodes in binary tree, there were lists which needed reordering and swapping. This resulted in an ugly function with another helper function and lots of conditional statements and loops (the code is at the end of the article). Looking at it now,  it is difficult to understand, with methods having nightmarish cyclomatic complexity and scoring very low on maintainability (and I didn’t help it with adding minimum comments). Thus, structural simplicity might bring in the cost of code complexity.

Spending a couple of evenings defining these functions, and being satisfied with their behaviour, I moved to the third stage, in-order traversal of the structure. There are moments, after hours of toil and self-doubt, where the feeling of satisfaction and completeness can again resurface and push away all bad vibes. That is what happened to me, being able to define in-order traversal of a nested list structure was indeed a happy moment. I might argue that in a learning environment, such as HackerRank, there are no wrong paths to a solution, the only difference being the length, quality of code and time spent on solution implementation. As long as one is ready to accept initial failure, learn from it and carry on, nothing can stop that person. By all means, let us experiment, let us fail, and let us begin again!

To recapitulate, my failures involved ignoring complementary material, choosing imperfect DS for the kind of problem, sticking to it even after realizing and seeing my failures, thus making decisions in a state of agitation (having a dumb strong-headedness as a trait feature). However, strong-headedness proved to be a lucky trait, as it allowed me to plod on over several evenings to a successful solution. This is not the correct way of problem solving, it is important to be able to ask for and accept help, see blind alleys, iterate at the right time, cut losses, learn from the disappointment and move on.

The code is so convoluted, that I do not want you to dwell on it too much. Do scan it quickly, see its complexity and intricacies. You might enquire: “Why showcasing such an ugly piece of code?” There are several reasons, but the most important is the quality of understanding of problem domain. Over several evenings of my constructing the answer, I dismantled, poked at and assembled problem back again. After this exploration, I was more than ready to construct a neater, simpler and much less convoluted solution (which will be outlined in another blog post). Even if the answer seems far away, the strong understanding of a problem means long memory upkeep, the problem turning from a come and go acquaintance into one which will be remembered with warm feelings. In a way, this is my love-note to Swap Nodes [Algo]. Yet another reason, to display the messy path of problem and code exploration, where problem solution is secondary to searching and putting out feelers in the forest of ideas. Could there be happier moments?

**References:**

_Miller, B.N. and Ranum, D.L. (2011). Problem solving with algorithms and data structures using Python. Sherwood, Or.: Franklin, Beedle & Associates._

.java

***

~~~java
class Result {
    
    private static Map<Integer, Integer> nodes_per_depth;
    private static List<List<Integer>> current_tree;
    private static int num_of_levels;

    public static void count_depth_nodes(List<List<Integer>> indexes) {
        nodes_per_depth = new HashMap<>();

        // Depth of the root node is 1, count is always 1
        int duo_count = 0;
        int depth = 1;
        nodes_per_depth.put(depth++, 1);

        // Depth 2
        int node_count = 0;
        List<Integer> a_duo = indexes.get(duo_count++);
        for (Integer anInt : a_duo) {
            if (anInt > -1) node_count++;
        }
        nodes_per_depth.put(depth++, node_count);

        // The rest of depths
        while (node_count > 0) {
            int currentNodeCount = node_count;
            node_count = 0;
            for (int i = 0; i < currentNodeCount; i++) {
                a_duo = indexes.get(duo_count++);
                for (Integer anInt : a_duo) {
                    if (anInt > -1) node_count++;
                }
            }
            nodes_per_depth.put(depth++, node_count);
        }
    }

    public static void build_tree(List<List<Integer>> indexes) {
        current_tree = new ArrayList<>();
        List<Integer> depth_nodes;
        List<Integer> a_duo;
        Integer nodes;
        int at = 0;

        // Depth 1 has always 1 in it
        depth_nodes = new ArrayList<>();
        depth_nodes.add(1);
        current_tree.add(depth_nodes);

        for (Integer key : nodes_per_depth.keySet()) {
            depth_nodes = new ArrayList<>();
            nodes = nodes_per_depth.get(key);
            for (int i = at; i < at + nodes; i++) {
                a_duo = indexes.get(i);
                for (Integer an_int : a_duo) {
                    depth_nodes.add(an_int);
                }
            }
            if (depth_nodes.size() > 0) {
                current_tree.add(depth_nodes);
            }
            at += nodes;
        }
        num_of_levels = current_tree.size();
    }

    public static List<Integer> inorder_traverse(List<Integer> traversed_tree, int level, int pos) {
        Integer a_node = current_tree.get(level).get(pos);

        int count = 0;
        for (Integer an_int : current_tree.get(level)) {
            if (!Objects.equals(an_int, a_node) && an_int > -1) {
                count++;
            } else if (Objects.equals(an_int, a_node)) {
                break;
            }
        }

        if (level < num_of_levels && current_tree.get(level + 1).get(((count + 1) * 2) - 2) != -1) {
            inorder_traverse(traversed_tree, level + 1, ((count + 1) * 2) - 2);
        }
        traversed_tree.add(a_node);
        if (level < num_of_levels && current_tree.get(level + 1).get(((count + 1) * 2) - 1) != -1) {
            inorder_traverse(traversed_tree, level + 1, ((count + 1) * 2) - 1);
        }

        return traversed_tree;
    }

    public static void reorder(int count, int left, int right, int level) {
        List<Integer> level_down;
        List<Integer> level_partition;
        List<Integer> level_partition_left;
        List<Integer> level_partition_right;
        Integer rightmost_integer = null;
        int count_copy = count;
        int left_copy = left;
        int right_copy = right;


        if (level < (current_tree.size() - 2)) {
            level_down = current_tree.get(level + 1);
            level_partition = level_down.subList(
                    (count_copy * 2) - (2 * (left_copy + right_copy)), count_copy * 2);
            level_partition_left = level_partition.subList(0, left_copy * 2);
            level_partition_right = level_partition.subList(left_copy * 2, level_partition.size());

            for (int t = 0; t < level_partition_right.size(); t++) {
                if (level_partition_right.get(t) > -1) rightmost_integer = level_partition_right.get(t);
            }
            count = 0;
            for (int n = 0; n < level_down.size(); n++) {
                if (level_down.get(n) > -1 && !Objects.equals(level_down.get(n), rightmost_integer)) {
                    count++;
                } else if (Objects.equals(level_down.get(n), rightmost_integer)) {
                    count++;
                    break;
                }
            }

            left = 0;
            right = 0;
            for (int q = 0; q < level_partition_left.size(); q++) {
                if (level_partition_left.get(q) > -1) {
                    left++;
                }
            }
            for (int r = 0; r < level_partition_right.size(); r++) {
                if (level_partition_right.get(r) > -1) {
                    right++;
                }
            }

            level_partition = new ArrayList<>(level_partition_right);
            level_partition.addAll(level_partition_left);
            int replace = count_copy * 2 - (2 * (left_copy + right_copy));
            for (int p = 0; p < level_partition.size(); p++) {
                level_down.set(replace, level_partition.get(p));
                replace++;
            }

            current_tree.set(level + 1, level_down);

            if ((left != 0) && (right != 0)) {
                reorder(count, left, right, level + 1);
            }
        }
    }

    public static void swap(Integer depth) {
        List<Integer> depths_to_swap = new ArrayList<>();
        int i = 1;
        while (i * depth < current_tree.size()) {
            depths_to_swap.add(i * depth);
            i++;
        }

        List<Integer> a_level;
        Integer temp;
        Integer temp2;
        for (Integer key : nodes_per_depth.keySet()) {
            if (depths_to_swap.contains(key)) {
                a_level = current_tree.get(key);
                for (int j = 1; j < a_level.size(); j += 2) {
                    temp = a_level.get(j - 1);
                    temp2 = a_level.get(j);
                    a_level.set(j, temp);
                    a_level.set(j - 1, temp2);
                    if (temp > -1 && temp2 > -1) {
                        int node_count = 0;
                        int left = 1;
                        int right = 1;
                        for (int k = 0; k < a_level.size(); k++) {
                            if (a_level.get(k) > -1 && !Objects.equals(a_level.get(k), temp)) {
                                node_count++;
                            } else if (Objects.equals(a_level.get(k), temp)) {
                                node_count++;
                                break;
                            }
                        }
                        reorder(node_count, left, right, key);
                    }
                }
                current_tree.set(key, a_level);
            }
        }
        for (List<Integer> level : current_tree) System.out.println("build_tree: " + level);
    }
    
    /*
     * Complete the 'swapNodes' function below.
     *
     * The function is expected to return a 2D_INTEGER_ARRAY.
     * The function accepts following parameters:
     *  1. 2D_INTEGER_ARRAY indexes
     *  2. INTEGER_ARRAY queries
     */

    public static List<List<Integer>> swapNodes(List<List<Integer>> indexes, List<Integer> queries) {
    // Write your code here
List<List<Integer>> result = new ArrayList<>();
        count_depth_nodes(indexes);
        build_tree(indexes);

        if (indexes.size() == 1) {
            for (Integer depth : queries) {
                List<Integer> size_of_one = new ArrayList<>();
                size_of_one.add(1);
                result.add(size_of_one);
            }
        } else {
            for (Integer depth : queries) {
                swap(depth);
                result.add(inorder_traverse(new ArrayList<>(), 0, 0));
            }
        }
        return result;
    }
}
~~~

***
