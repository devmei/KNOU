# 8강. 파이썬 Pandas와 R의 dplyr (1)
import statsmodels.api as sm


# 1.4 R 데이터 불러오기
# Python 1.5 R 데이터 불러와서 DataFrame으로 활용하기
def chap06_05():
    trees = sm.datasets.get_rdataset("trees")['data']
    print(trees.head())
    '''
       Girth  Height  Volume
    0    8.3      70    10.3
    1    8.6      65    10.3
    2    8.8      63    10.2
    3   10.5      72    16.4
    4   10.7      81    18.8
    '''

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

    iris = sm.datasets.get_rdataset("iris")['data']
    print(iris.head())
    '''
       Sepal.Length  Sepal.Width  Petal.Length  Petal.Width Species
    0           5.1          3.5           1.4          0.2  setosa
    1           4.9          3.0           1.4          0.2  setosa
    2           4.7          3.2           1.3          0.2  setosa
    3           4.6          3.1           1.5          0.2  setosa
    4           5.0          3.6           1.4          0.2  setosa
    '''

    print(type(trees))
    # <class 'pandas.core.frame.DataFrame'>

    print(trees.__class__)
    # <class 'pandas.core.frame.DataFrame'>

    return False


chap06_05()
