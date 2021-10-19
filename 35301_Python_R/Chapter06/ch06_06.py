# 8강. 파이썬 Pandas와 R의 dplyr (1)
from pandas import Series


# 1.5 Series 자료의 이용
# Python 1.6 Series의 이름 인덱스와 위치 인덱스
def chap06_06():
    s1 = Series([1.0, 2, 3])
    sa = Series([1.0, 2, 3], index=['a', 'b', 'c'])
    sc = Series([0.0, 1, 2], index=['a', 'b', 'd'])
    # sn = Series([1, 2, 1, 3, 3, 5, 3, 4])

    print(s1)
    '''
    0    1.0
    1    2.0
    2    3.0
    dtype: float64
    '''
    print(s1 - 2)
    '''
    0   -1.0
    1    0.0
    2    1.0
    dtype: float64
    '''

    print(sa)
    '''
    a    1.0
    b    2.0
    c    3.0
    dtype: float64
    '''
    print(sc)
    '''
    a    0.0
    b    1.0
    d    2.0
    dtype: float64
    '''

    sac = sa + sc
    print(sac)
    '''
    a    1.0
    b    3.0
    c    NaN
    d    NaN
    dtype: float64
    '''

    return False


chap06_06()
