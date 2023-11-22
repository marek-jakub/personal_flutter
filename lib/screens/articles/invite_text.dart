/// A text taken from blog articles used as a inivite to read.
class TextInvite {
  // Article from 14 November 2023
  Map<String, String> article7 = {
    'articleDate': '14-Nov-2023',
    'articleName': 'Error: Failed to create the directory pgadmin…',
    'articleText':
        'The following error has been encountered in the following environment: Linux Mint 21.2 Cinnamon running Linux Kernel 5.15.0-87-generic. SQL is one of the most sought-after languages used in data processing and analysis, and while it is rather easy to install databases for data storage through APT package manager (e.g., PostgreSQL), administration and development platform (in this case pgAdmin) offers several ways of installation. One of the ways pgAdmin could be installed in Mint is by using Python’s pip tool, which is a package manager (or package installer). However, using this tool requires setting up a Python virtual environment (venv), which is usually done at a local level (not root or user level).',
  };

  // Article from 24 October 2023
  Map<String, String> article6 = {
    'articleDate': '24-Oct-2023',
    'articleName': 'Flutter Error: Could not find the correct Provider…',
    'articleText':
        'Building a mobile application focused on data management, some of the logic has been based on a local SQLite database operations (allowing local data editing and management prior to being sent off…). The provider has offered a single Facade to several forms (collecting data), but has served as a Pipeline (e.g. for sorting or transforming data) as well. The task has been simple, on filling a form, the data has been sent to the provider, which in turn called the right method (any one of the CRUD methods...) in the single instance of the database.',
  };

  // Article from 16 March 2022
  Map<String, String> article5 = {
    'articleDate': '17-Jul-2022',
    'articleName': 'In-order traversal of a nested list structure',
    'articleText':
        'In-order traversal is usually applied to tree structures. In my previous blog post, a problem solution was described, which used nested lists as the data type of choice. One part of the problem involved in-order traversal. As binary tree was not used, but rather nested lists to approximate binary tree, the solution had to circumvent the usual implementation to provide in-order traversal functionality. This is a description of the algorithm used to achieve that. To refresh memory, nested lists provide a simple data structure, and such a structure was used to approximate binary tree. The normal implementation of in-order traversal of a binary tree is described as a recursive in-order visit of the left subtree, then root node and finally a recursive in-order visit of the right subtree (Miller and Ranum, 2011).',
  };

  // Article from 16 March 2022
  Map<String, String> article4 = {
    'articleDate': '16-Mar-2022',
    'articleName': 'How not to solve HackerRank problems',
    'articleText':
        'Taking a time to solve HackerRank problems is a great way to prepare for a job interview or school exams. Problems pose as stepping stones, starting at easy difficulty, through medium to hard, and then on to advanced or expert levels. A problem one chooses to solve is described, and input/output characteristics are given. If one does struggle, one can opt to enter discussion thread, where regularly solutions appear, study those first before entering one’s own solution, or choose to see editorial notes (in that case solution points do not count). So it could be said that a precondition to a good solution is a detailed understanding of a given problem. There are usually hints indicating what structures could be used in problem solution, with links to complementary material.',
  };

  // Article from 27 January 2022
  Map<String, String> article3 = {
    'articleDate': '27-Jan-2022',
    'articleName': 'Hunt for O(1) search',
    'articleText':
        'Using hash tables to beat the binary search timing at finding data items, hashing has proven its worth. Its O(1) efficiency is what makes it so attractive. But as Miller and Ranum (2011) assert, it can be rather difficult to design a perfect hash function. One of the ways to resolve collisions is through chaining. And this is where I have tried to push it further. Rather than designing a hash function, the structure of the hash table itself can serve in placing data items at their positions, in a way, using the structure itself as a hash function. The aim has been to keep it simple, as that is where the efficiency is maintained. Using a starting list length, the remainder method is used for item placement, whenever a collision happens, a new list is placed at the given index, but this time its length is changed.',
  };

  // Article from 20 November 2021
  Map<String, String> article2 = {
    'articleDate': '20-Nov-2021',
    'articleName': 'An old-fashioned library (bookcase)',
    'articleText':
        'One of the questions in my exam on algorithms and data structures was to suggest a data structure for holding books. An immediate proposal could be a balanced tree with book ISBN as a unique identifier. For some time after the exam I kept thinking about modelling an old-fashioned library with books placed in shelves separated by first letter of writer (or book) names. I had trouble designing an abstract data type (ADT) which would be simple enough (data stored in a single list), yet model such bookcases. The revelation came while drawing three-dimensional shapes on paper. Given a three-dimensional shape, such as cube, each one of its nodes can point to another cube. This is achieved by adding 1 to a node index in the starting cube and multiplying by 8 (the number of nodes in the cube).',
  };

  // Article from 01 September 2021
  Map<String, String> article1 = {
    'articleDate': '01-Sep-2021',
    'articleName': 'From binary tree to exponential search',
    'articleText':
        'Studying algorithms and data structures by Miller and Ranum (2011) I came across binary tree abstract data type (ADT). It is an ingenious device, where its Yes/No or 0/1 choice paths lead to many useful implementations. As I drew a binary tree for an assignment, I thought, why not try to implement a ternary tree ADT, with three choice paths instead of two. It would be such a novel idea, wouldn’t it? In my newbie ignorance I thought I had come across a new implementation of a tree. However, a quick search deflated my enthusiasm, as the ternary tree is a well-known type. Putting my design on paper, I observed a catching detail about the tree. If the nodes were numbered, the index of nodes at a level edges could easily be predicted.',
  };
}
