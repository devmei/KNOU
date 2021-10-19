# 8강. 파이썬 Pandas와 R의 dplyr (1)
import numpy as np
import statsmodels.api as sm


# 1.6 DataFrame 자료의 이용
# Python 1.12 DataFrame에 통계/계산 메서드의 적용
def chap06_12():
    trees = sm.datasets.get_rdataset("trees")['data']

    print(trees.shape)
    # (31, 3)

    tree4 = trees[0:4].copy()

    print(tree4.mean())
    '''
    Girth      9.05
    Height    67.50
    Volume    11.80
    dtype: float64
    '''

    print(tree4.mean(1))
    '''
    0    29.533333
    1    27.966667
    2    27.333333
    3    32.966667
    dtype: float64
    '''

    print(tree4.cumsum())
    '''
       Girth  Height  Volume
    0    8.3      70    10.3
    1   16.9     135    20.6
    2   25.7     198    30.8
    3   36.2     270    47.2
    '''

    print(tree4.apply(np.cumsum))
    '''
       Girth  Height  Volume
    0    8.3      70    10.3
    1   16.9     135    20.6
    2   25.7     198    30.8
    3   36.2     270    47.2
    '''

    print(tree4.apply(lambda x: x.max()))
    '''
    Girth     10.5
    Height    72.0
    Volume    16.4
    dtype: float64
    '''

    return False


chap06_12()
