# 8강. 파이썬 Pandas와 R의 dplyr (1)
from pandas import Series


# 1.5 Series 자료의 이용
# Python 1.7 Series 결측치 NaN의 처리
def chap06_07():
    # s1 = Series([1.0, 2, 3])
    sa = Series([1.0, 2, 3], index=['a', 'b', 'c'])
    sc = Series([0.0, 1, 2], index=['a', 'b', 'd'])
    # sn = Series([1, 2, 1, 3, 3, 5, 3, 4])

    sac = sa + sc
    print(sac.isnull())
    '''
    a    False
    b    False
    c     True
    d     True
    dtype: bool
    '''
    print(sac.notnull())
    '''
    a     True
    b     True
    c    False
    d    False
    dtype: bool
    '''
    print(sac.fillna(-1.0))
    '''
    a    1.0
    b    3.0
    c   -1.0
    d   -1.0
    dtype: float64
    '''

    sx = sac.dropna()
    print(sx)
    '''
    a    1.0
    b    3.0
    dtype: float64
    '''

    sy = sx.append(sc[:2])
    print(sy)
    '''
    a    1.0
    b    3.0
    a    0.0
    b    1.0
    dtype: float64
    '''
    print(sy.drop('a'))
    '''
    b    3.0
    b    1.0
    dtype: float64
    '''

    return False


chap06_07()
