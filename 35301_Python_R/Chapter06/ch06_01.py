# 8강. 파이썬 Pandas와 R의 dplyr (1)
import pandas as pd

from pandas import Series, DataFrame


# 1.2 Panda 구동과 자료의 생성
# Python 1.1 Series 객체와 DataFrame의 생성
def chap06_01():
    s = Series([10, 20, 30], index=['a', 'b', 'c'])
    print(s)
    '''
    a    10
    b    20
    c    30
    dtype: int64
    '''

    s = pd.Series([10, 20, 30], index=['a', 'b', 'c'])
    print(s)
    '''
    a    10
    b    20
    c    30
    dtype: int64
    '''

    df = DataFrame(s, columns=["A"])

    print(dir(df))
    # ['A', 'T', '_AXIS_LEN', ..., 'where', 'xs']

    print(s.__class__)
    # <class 'pandas.core.series.Series'>

    print(df.__class__)
    # <class 'pandas.core.frame.DataFrame'>

    print(type(s))
    # <class 'pandas.core.series.Series'>

    return False


chap06_01()
