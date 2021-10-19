# 8강. 파이썬 Pandas와 R의 dplyr (1)
import statsmodels.api as sm


# 1.6 DataFrame 자료의 이용
# Python 1.9 trees 데이터의 일부 선택
def chap06_09():
    trees = sm.datasets.get_rdataset("trees")['data']

    print(trees.shape)
    # (31, 3)

    tree4 = trees[0:4].copy()
    print(tree4)
    '''
       Girth  Height  Volume
    0    8.3      70    10.3
    1    8.6      65    10.3
    2    8.8      63    10.2
    3   10.5      72    16.4
    '''

    tree4.index = ['B', 'C', 'D', 'E']
    print(tree4)
    '''
       Girth  Height  Volume
    B    8.3      70    10.3
    C    8.6      65    10.3
    D    8.8      63    10.2
    E   10.5      72    16.4
    '''

    print(tree4[tree4 > 10])
    '''
       Girth  Height  Volume
    B    NaN      70    10.3
    C    NaN      65    10.3
    D    NaN      63    10.2
    E   10.5      72    16.4
    '''
    print(tree4[tree4.Height > 65])
    '''
       Girth  Height  Volume
    B    8.3      70    10.3
    E   10.5      72    16.4
    '''

    print(tree4['E':'C'])
    '''
    Empty DataFrame
    Columns: [Girth, Height, Volume]
    Index: []
    '''

    cols = ['Girth', 'Height']
    print(tree4[cols])
    '''
       Girth  Height
    B    8.3      70
    C    8.6      65
    D    8.8      63
    E   10.5      72
    '''

    return False


chap06_09()
