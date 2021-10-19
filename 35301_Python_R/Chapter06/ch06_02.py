# 8강. 파이썬 Pandas와 R의 dplyr (1)
from pandas import Series, DataFrame


# 1.2 Panda 구동과 자료의 생성
# Python 1.2 Series와 DataFrame에서 index와 columns
def chap06_02():
    # Python 1.1
    s = Series([10, 20, 30], index=['a', 'b', 'c'])
    df = DataFrame(s, columns=["A"])

    print(s.to_numpy())
    # [10 20 30]
    print(df.to_numpy())
    '''
    [[10]
     [20]
     [30]]
    '''

    print(s.to_numpy().shape)
    # (3,)
    print(df.to_numpy().shape)
    # (3, 1)

    print(s.index)
    # Index(['a', 'b', 'c'], dtype='object')
    print(df.index)
    # Index(['a', 'b', 'c'], dtype='object')
    print(df.columns)
    # Index(['A'], dtype='object')

    return False


chap06_02()
