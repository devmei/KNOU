# 8강. 파이썬 Pandas와 R의 dplyr (1)
import statsmodels.api as sm


# 1.6 DataFrame 자료의 이용
# Python 1.10 iloc, loc를 이용한 데이터의 선택
def chap06_10():
    trees = sm.datasets.get_rdataset("trees")['data']

    print(trees.shape)
    # (31, 3)

    tree4 = trees[0:4].copy()
    tree4.index = ['B', 'C', 'D', 'E']

    print(tree4.iloc[[0, 2], [0, 1]])
    '''
       Girth  Height
    B    8.3      70
    D    8.8      63
    '''

    print(tree4.iloc[:2, [0, 1]])
    '''
       Girth  Height
    B    8.3      70
    C    8.6      65
    '''

    print(tree4.iloc[:2, 0:1])
    '''
       Girth
    B    8.3
    C    8.6
    '''

    print(tree4.loc['E':'C'])
    '''
    Empty DataFrame
    Columns: [Girth, Height, Volume]
    Index: []
    '''

    print(tree4.loc[['E', 'C'], ['Girth', 'Height']])
    '''
       Girth  Height
    E   10.5      72
    C    8.6      65
    '''

    print(tree4.loc['E':'C', 'Girth':'Height'])
    '''
    Empty DataFrame
    Columns: [Girth, Height]
    Index: []
    '''

    return False


chap06_10()
