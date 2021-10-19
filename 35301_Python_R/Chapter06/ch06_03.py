# 8강. 파이썬 Pandas와 R의 dplyr (1)
import numpy as np

from pandas import Series, DataFrame


# 1.2 Panda 구동과 자료의 생성
# Python 1.3 딕셔너리와 행렬을 이용한 DataFrame의 생성
def chap06_03():
    d = {'one': Series([1, 2], index=['a', 'b']),
         'two': Series([1, 2, 3], index=['a', 'b', 'c'])}
    df = DataFrame(d)
    print(df)
    '''
       one  two
    a  1.0    1
    b  2.0    2
    c  NaN    3
    '''

    x = np.arange(4).reshape((2, 2))
    print(x)
    '''
    [[0 1]
     [2 3]]
    '''

    df = DataFrame(x)
    df.columns = ['A', 'B']
    df.index = [11, 12]
    print(df)
    '''
        A  B
    11  0  1
    12  2  3
    '''

    return False


chap06_03()
