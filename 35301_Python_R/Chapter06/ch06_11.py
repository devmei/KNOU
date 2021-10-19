# 8강. 파이썬 Pandas와 R의 dplyr (1)
import statsmodels.api as sm


# 1.6 DataFrame 자료의 이용
# Python 1.11 데이터의 전치와 정렬
def chap06_11():
    trees = sm.datasets.get_rdataset("trees")['data']

    print(trees.shape)
    # (31, 3)

    tree4 = trees[0:4].copy()

    print(tree4.T)
    '''
               0     1     2     3
    Girth    8.3   8.6   8.8  10.5
    Height  70.0  65.0  63.0  72.0
    Volume  10.3  10.3  10.2  16.4
    '''

    print(tree4.sort_index())
    '''
       Girth  Height  Volume
    0    8.3      70    10.3
    1    8.6      65    10.3
    2    8.8      63    10.2
    3   10.5      72    16.4
    '''

    print(tree4.sort_values('Height'))
    '''
       Girth  Height  Volume
    2    8.8      63    10.2
    1    8.6      65    10.3
    0    8.3      70    10.3
    3   10.5      72    16.4
    '''

    print(tree4.sort_values('Height', ascending=False))
    '''
       Girth  Height  Volume
    3   10.5      72    16.4
    0    8.3      70    10.3
    1    8.6      65    10.3
    2    8.8      63    10.2
    '''

    tree5 = tree4.copy()

    tree5.iloc[1, 0] = 12.8
    tree5.iloc[1, 1] = 63

    print(tree5.sort_values(by=['Height', 'Girth']))
    '''
       Girth  Height  Volume
    2    8.8      63    10.2
    1   12.8      63    10.3
    0    8.3      70    10.3
    3   10.5      72    16.4
    '''

    return False


chap06_11()
