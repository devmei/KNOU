# 4강. 파이썬과 R의 배열, 리스트, 데이터프레임
import numpy as np
import pandas as pd


def chap03():
    xm = np.array([[1, 2, 3], [3, 4, 5], [6, 7, 9]])
    print(xm)
    '''
    [[1 2 3]
     [3 4 5]
     [6 7 9]]
    '''

    xm = np.arange(1, 10)
    print(xm)
    # [1 2 3 4 5 6 7 8 9]

    xm = xm.reshape(3, 3)
    print(xm)
    '''
    [[1 2 3]
     [3 4 5]
     [6 7 9]]
    '''

    print(xm[:, 0])
    # [1 4 7]

    print(xm[0:2, :])
    '''
    [[1 2 3]
     [4 5 6]]
    '''

    x2 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    print(x2)
    # [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

    print(x2[0][2])
    # 3

    print([row[2] for row in x2])
    # [3, 6, 9]

    country_code = {'korea': 82, 'us': 1, 'china': 86}
    print(country_code['korea'])  # 82

    d = {'name': ['Kim', 'Lee', 'Park'], 'height': [170, 180, 175]}
    df1 = pd.DataFrame(data=d)
    print(df1)
    '''
       name  height
    0   Kim     170
    1   Lee     180
    2  Park     175
    '''

    print(type(df1))
    # <class 'pandas.core.frame.DataFrame'>

    df2 = pd.DataFrame([['kim', 170], ['lee', 180], ['park', 175]], index=['r1', 'r2', 'r3'],
                       columns=['name', 'height'])
    print(df2)
    '''
        name  height
    r1   kim     170
    r2   lee     180
    r3  park     175
    '''

    df3 = pd.DataFrame(np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]]), columns=['a', 'b', 'c'])
    print(df3)
    '''
       a  b  c
    0  1  2  3
    1  4  5  6
    2  7  8  9
    '''

    mx1 = np.array(range(1, 10)).reshape(3, 3)
    print(mx1)
    '''
    [[1 2 3]
     [4 5 6]
     [7 8 9]]
    '''

    mx2 = np.append(mx1, np.array([10, 20, 30]).reshape(1, 3), axis=0)
    mx3 = np.append(mx1, np.array([10, 20, 30]).reshape(3, 1), axis=1)
    print(mx2)
    '''
    [[ 1  2  3]
     [ 4  5  6]
     [ 7  8  9]
     [10 20 30]]
    '''
    print(mx3)
    '''
    [[ 1  2  3 10]
     [ 4  5  6 20]
     [ 7  8  9 30]]
    '''

    x1 = np.array(range(1, 7)).reshape(2, 3)
    mx2 = np.hstack((np.repeat(1, 3).reshape(3, 1), np.repeat(2, 3).reshape(3, 1)))
    mx3 = np.matmul(mx1, mx2)
    print(x1)
    '''
    [[1 2 3]
     [4 5 6]]
    '''
    print(mx2)
    '''
    [[1 2]
     [1 2]
     [1 2]]
    '''
    print(mx3)
    '''
    [[ 6 12]
     [15 30]
     [24 48]]
    '''

    print(mx3.transpose())
    '''
    [[ 6 15 24]
     [12 30 48]]
    '''

    ma = np.array([[1, 2], [3, 4]])
    print(ma)
    '''
    [[1 2]
     [3 4]]
    '''

    print(np.linalg.inv(ma))
    '''
    [[-2.   1. ]
     [ 1.5 -0.5]]
    '''

    return False


chap03()
