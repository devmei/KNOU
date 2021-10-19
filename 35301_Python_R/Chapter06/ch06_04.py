# 8강. 파이썬 Pandas와 R의 dplyr (1)
import pandas as pd


# 1.3 CSV 파일 입출력
# Python 1.4 CSV 파일 입출력을 통한 DataFrame 읽기와 쓰기
def chap06_04():
    faithful = pd.read_csv("./faithful.csv")

    print(faithful.shape)
    # (272, 2)

    print(faithful.head())
    '''
       eruptions   waiting
    0      3.600        79
    1      1.800        54
    2      3.333        74
    3      2.283        62
    4      4.533        85
    '''

    print(faithful.head(3))
    '''
       eruptions   waiting
    0      3.600        79
    1      1.800        54
    2      3.333        74
    '''

    print(faithful.__class__)
    # <class 'pandas.core.frame.DataFrame'>

    print(type(faithful))
    # <class 'pandas.core.frame.DataFrame'>

    faithful.to_csv("./old_faithful.csv")

    return False


chap06_04()
