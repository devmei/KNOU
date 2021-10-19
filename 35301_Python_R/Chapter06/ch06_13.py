# 8강. 파이썬 Pandas와 R의 dplyr (1)
import pandas as pd
import statsmodels.api as sm


# 1.6 DataFrame 자료의 이용
# Python 1.13 crosstab과 groupby의 적용 예
def chap06_13():
    mtcars = sm.datasets.get_rdataset("mtcars")['data']

    print(mtcars.head())
    '''
                        mpg  cyl   disp   hp  drat  ...   qsec  vs  am  gear  carb
    Mazda RX4          21.0    6  160.0  110  3.90  ...  16.46   0   1     4     4
    Mazda RX4 Wag      21.0    6  160.0  110  3.90  ...  17.02   0   1     4     4
    Datsun 710         22.8    4  108.0   93  3.85  ...  18.61   1   1     4     1
    Hornet 4 Drive     21.4    6  258.0  110  3.08  ...  19.44   1   0     3     1
    Hornet Sportabout  18.7    8  360.0  175  3.15  ...  17.02   0   0     3     2
    
    [5 rows x 11 columns]
    '''

    cols = ['mpg', 'cyl', 'hp', 'gear']
    mtx = mtcars[cols].copy()

    print(mtx.head())
    '''
                        mpg  cyl   hp  gear
    Mazda RX4          21.0    6  110     4
    Mazda RX4 Wag      21.0    6  110     4
    Datsun 710         22.8    4   93     4
    Hornet 4 Drive     21.4    6  110     3
    Hornet Sportabout  18.7    8  175     3
    '''

    print(pd.crosstab(mtx.cyl, mtx.gear))
    '''
    gear   3  4  5
    cyl           
    4      1  8  2
    6      2  4  1
    8     12  0  2
    '''

    mtn = mtx.groupby(by=['cyl', 'gear']).mean()
    print(mtn)
    '''
                 mpg          hp
    cyl gear                    
    4   3     21.500   97.000000
        4     26.925   76.000000
        5     28.200  102.000000
    6   3     19.750  107.500000
        4     19.750  116.500000
        5     19.700  175.000000
    8   3     15.050  194.166667
        5     15.400  299.500000
    '''

    return False


chap06_13()
