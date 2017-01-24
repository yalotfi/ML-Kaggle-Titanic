'''
Author: Yaseen Lotfi
Title: Feature Engineering
Description: This program prepares the titanic training set to pass through
    several learning, classifier algorithms. 
'''


# Import dependencies
#import numpy as np
import pandas as pd


def main():
    df = pd.read_csv('../data/train.csv', header=0)
    print(df)


if __name__ == '__main__':
    main()
