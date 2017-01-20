# We use the classic argparse library to parse our parameters
from argparse import ArgumentParser
from random import random

# gen_sequence takes a nucleotide composition and an integer number
# it returns a random sequence with the given nucleotide composition and length

def gen_sequence(comp, length) :
    sequence = ''

    # Tip : assertions are very good 
    assert abs( sum(comp.values())-1 ) < 0.01 , 'Probabilities do not add up to 1.'
    
    # Main loop : generate a sequence of given length
    for i in range(length) :
        # Get a random number in [0,1)
        dice = random()
        limit=0
        # divide [0,1) interval according to probabilities of each nucleotide
        for nuc in comp :
            limit += comp[nuc]
            # add the letter that dice hits
            if dice<limit :
                sequence += nuc
                limit = 0
                # roll another dice for the next nucleotide
                break

    return sequence

if __name__ =="__main__" :


    ### Argument Parsing
    ### We are using the argparse library for reading command line arguments
    
    parser = ArgumentParser(description='Generates random sequences with random composition')
    parser.add_argument('-l', type=int, help='length of random sequences to be generated')
    parser.add_argument('-n', type=int, default=1, help='number of random sequences to be generated')
    parser.add_argument('-a', type=float, help='fraction of adenines')
    parser.add_argument('-t', type=float, help='fraction of thymines')
    parser.add_argument('-c', type=float, help='fraction of cytosines')
    parser.add_argument('-g', type=float, help='fraction of guanines')
    
    args=parser.parse_args()
    
    # read the composition into a dictionary

    composition = { 'a':args.a , 'c':args.c, 't':args.t, 'g':args.g }

    # then use a for loop to populate the list
    for i in range(args.n) :
        print ('>random sequence {}'.format(i))
        print (gen_sequence(composition, args.l)) 
    
    # Here is 'the python way' of doing the same thing in a single line
    # This uses 'list comprehension' which is a very versatile feature of python
    
    # random_sequences = [ gen_sequence(composition, args.l)) for i in range(args.n) ]
    
    
