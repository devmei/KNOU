# 8강. 파이썬 Pandas와 R의 dplyr (1)
from pandas import Series


# 1.5 Series 자료의 이용
# Python 1.8 Series에 메서드 적용
def chap06_08():
    # s1 = Series([1.0, 2, 3])
    # sa = Series([1.0, 2, 3], index=['a', 'b', 'c'])
    # sc = Series([0.0, 1, 2], index=['a', 'b', 'd'])
    sn = Series([1, 2, 1, 3, 3, 5, 3, 4])

    print(sn)
    '''
    0    1
    1    2
    2    1
    3    3
    4    3
    5    5
    6    3
    7    4
    dtype: int64
    '''

    print(sn.head())
    '''
    0    1
    1    2
    2    1
    3    3
    4    3
    dtype: int64
    '''

    print(sn.describe())
    '''
    count    8.00000
    mean     2.75000
    std      1.38873
    min      1.00000
    25%      1.75000
    50%      3.00000
    75%      3.25000
    max      5.00000
    dtype: float64
    '''

    print(list(sn.unique()))
    # [1, 2, 3, 5, 4]

    print(sn.nunique())
    # 5

    print(sn.replace([1, 2], 0))
    '''
    0    0
    1    0
    2    0
    3    3
    4    3
    5    5
    6    3
    7    4
    dtype: int64
    '''

    return False


chap06_08()
