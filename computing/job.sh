#!/bin/bash

#PBS -l nodes=1:ppn=1,walltime=00:00:05


# queued jobs always run from your home directory
# it is a good idea to change working directory to your project directory

cd i529/computing

# let us run a c program hello_world.c
# make sure you compiled it by doing
# gcc hello_world.c -o hello_world

echo 'Running a C program...'

./hello_world

# Now let us try a Python program
# Note that we do not need to compile with Python

echo 'Running a Python program...'

python2 hello_world.py
