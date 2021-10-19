# 8강. 파이썬 Pandas와 R의 dplyr (1)
import statsmodels.api as sm

from pandas import DataFrame


# 1.6 DataFrame 자료의 이용
# Python 1.14 unstack과 multi-index의 이용
def chap06_14():
    mtcars = sm.datasets.get_rdataset("mtcars")['data']

    cols = ['mpg', 'cyl', 'hp', 'gear']

    mtx = mtcars[cols].copy()
    mtn = mtx.groupby(by=['cyl', 'gear']).mean()

    print(mtn['mpg'].unstack(0))
    '''
    cyl        4      6      8
    gear                      
    3     21.500  19.75  15.05
    4     26.925  19.75    NaN
    5     28.200  19.70  15.40
    '''

    print(mtn[['mpg', 'hp']].unstack(0))
    '''
             mpg                   hp                   
    cyl        4      6      8      4      6           8
    gear                                                
    3     21.500  19.75  15.05   97.0  107.5  194.166667
    4     26.925  19.75    NaN   76.0  116.5         NaN
    5     28.200  19.70  15.40  102.0  175.0  299.500000
    '''

    mi = mtn.index

    lvs0 = mi.levels[0]
    cds0 = mi.codes[0]
    lvx0 = lvs0[cds0].values

    lvs1 = mi.levels[1]
    cds1 = mi.codes[1]
    lvx1 = lvs1[cds1].values

    mpgx = mtn['mpg'].to_numpy()

    d = {mi.names[0]: lvx0, mi.names[1]: lvx1, 'mpg': mpgx}
    mpga = DataFrame(d)
    print(mpga)
    '''
       cyl  gear     mpg
    0    4     3  21.500
    1    4     4  26.925
    2    4     5  28.200
    3    6     3  19.750
    4    6     4  19.750
    5    6     5  19.700
    6    8     3  15.050
    7    8     5  15.400
    '''

    print(mpga.pivot(index='gear', columns='cyl', values='mpg'))
    '''
    cyl        4      6      8
    gear                      
    3     21.500  19.75  15.05
    4     26.925  19.75    NaN
    5     28.200  19.70  15.40
    '''

    return False


chap06_14()
