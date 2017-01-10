#### A Not-So-Brief Introduction to Github (and Github@IU)

### Git Basics
Git is a **version control system** that is widely used.
Here are some tutorials to get you started :

  * [Git in 5 minutes](http://classic.scottr.org/presentations/git-in-5-minutes/)
  * [man giteveryday](https://www.kernel.org/pub/software/scm/git/docs/giteveryday.html)
  * [15 minute git tutorial](https://try.github.io/levels/1/challenges/1)

You can always do `man giteveryday` or ` git help everyday` to see a summary of everyday operation of git.

### Terminology

  * **repository** is a project database that stores the history and configuration of the project
  * [GitHub](https://www.github.com) is the free hosting site for git repositories
  * [GitHub@IU](https://github.iu.edu/) is IU's version with additional benefits for students
  * you can **fork** an existing repository which makes a new copy for you to modify
  * you can **clone** a remote repository to your local machine to work on it
  * after cloning a repository, you call the original repository **upstream**  
  * **commit**
    * noun : a single point in the history of a repository
    * verb : action of storing a new snapshot of the project
  * you can **push** commits from a local repository to a remote repository
  * you can submit a **pull request** to ask for your commits in your fork to be included in the main repository.

You can always do `man gitglossary` or `git help glossary` to see the complete glossary.

### Submitting coursework

To submit your work for this class, you will act as a developer and submit your work to GitHub@IU.

 1. Go to [github.iu.edu](https://github.iu.edu/) and login using your IU username.
(*You might need to activate your username if you haven't used GitHub@IU before*)

 2. Go to the [I529-Spring2017](https://github.iu.edu/I529-Spring2017) organization.

 3. Create a repository called **I529-*username***.
   * Replace *username* with your own username
   * Make sure you make your repository **private** and select "Initialize the repository with a README"
   * Make sure your repository sits under the I529-Spring2017 organization. If you are not in the organization, make sure you contact the TA (murat) ASAP so he can add you.

 4. Clone your new repository to your local machine.
  * Use SSH or HTTPS, your preference
  * Find the URL by clicking the green "Clone or download" button. It will be similar to :          
    * https://github.iu.edu/I529-Spring2017/I529-username.git
    * git@github.iu.edu:I529-Spring2017/I529-username.git
  * Clone the repository by typing e.g. `git clone https://github.iu.edu/I529-Spring2017/I529-username.git`


 Your basic workflow working on your project then should look like this :

```bash
 cd I529-username  # go into the project directory

 # do your work, creating and modifying files

 git add .        # add all files to your project

 git commit -m 'summary of changes you made'  # commit changes to your project

 git push         # push th commit(s) into the upstream repository

 ```

If you are using Windows or OS X, you can also use the graphical [GitHub Desktop](https://desktop.github.com/) interface.
