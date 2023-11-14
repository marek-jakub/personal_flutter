## Error: Failed to create the directory pgadmin…

2023-11-14

300 words

## Setting

The following error has been encountered in the following environment: Linux Mint 21.2 Cinnamon running Linux Kernel 5.15.0-87-generic.

SQL is one of the most sought-after languages used in data processing and analysis, and while it is rather easy to install databases for data storage through APT package manager (e.g., PostgreSQL), administration and development platform (in this case pgAdmin) offers several ways of installation.

One of the ways pgAdmin could be installed in Mint is by using Python’s pip tool, which is a package manager (or package installer). However, using this tool requires setting up a Python virtual environment (venv), which is usually done at a local level (not root or user level).

So while the PostgreSQL has been installed at the user level, pgAdmin has been installed at a local level (in a directory containing venv), thus the user has to be granted access and ownership of the directory containing pgAdmin log (/var/log/pgadmin). As explained by the pgAdmin Development Team (n.d.), pgAdmin will run in server mode, requiring system-wide paths.

## Error

After installation, on running pgAdmin from such local directory, the error shown in the Figure 1 has been seen:

![Figure 1: An error shown on starting pgAdmin application.](assets/articles/2023/02_article/pgadmin_error.png "Figure 1: An error shown on starting pgAdmin application.")

## Solution

To avoid such errors, rather than changing pgAdmin config file, prior to installation, ‘pgadmin’ directories have been created with user ownership (where $USER is replaced with your OS username):

.bash

~~~bash

sudo mkdir /var/lib/pgadmin
sudo mkdir /var/log/pgadmin
sudo chown $USER /var/lib/pgadmin
sudo chown $USER /var/log/pgadmin

~~~

However, the error has been seen post-installation, even with the script run prior to the pgAdmin installation. In such case, check you have ‘pgadmin’ directories at the given locations (/var/log/ and var/lib/) and you can recreate them manually to invalidate the error (again replacing $USER with your OS username):

.bash

~~~bash

sudo mkdir /var/log/pgadmin
sudo a+wrx $USER /var/log/pgadmin

~~~

Giving the user read/write/execute permissions is significant, as it allows running SQL file access commands e.g. COPY TO or COPY FROM.

***

**References:**

_pgAdmin Development Team, n.d. Download [WWW Document]. pgAdmin 4 (Python). URL <https://www.pgadmin.org/download/pgadmin-4-python/> (accessed 7 November 2023)._
