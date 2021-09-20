# 6강. 파이썬과 R을 이용한 자료의 입력 및 출력
import datetime as dt
import pandas as pd


def birthyear():
    age = input("Enter age: ")
    now = dt.datetime.now()
    curyear = now.year
    b_year = curyear - int(age)
    print("born.year=", b_year)


def chap05():
    birthyear()
    # Enter age: 20
    # born.year= 2001

    df1 = pd.read_csv('./score.txt', sep=" ", header=0, encoding='utf-8')
    print(df1)
    '''
       name  korean  english  math   ns   ss
    0   강대성      67       87    60   85   80
    1   한준호      63       73    82   73   85
    2   김종욱      74       53    76   72   58
    ...
    47  최수진      76       86    79   73   77
    48  정지영      71       70    40   91   85
    49  강민호      56       86    58   70   83
    '''

    print(df1.head(3))
    '''
      name  korean  english  math  ns  ss
    0  강대성      67       87    60  85  80
    1  한준호      63       73    82  73  85
    2  김종욱      74       53    76  72  58
    '''

    df7 = pd.read_csv('./score.txt', sep=" ", index_col='name')
    print(df7.head())
    '''
          korean  english  math  ns  ss
    name                               
    강대성       67       87    60  85  80
    한준호       63       73    82  73  85
    김종욱       74       53    76  72  58
    박상호       55       65    49  84  96
    김소현       76       69    69  92  70
    '''

    print(df7.loc['강대성'])
    '''
    korean     67
    english    87
    math       60
    ns         85
    ss         80
    Name: 강대성, dtype: int64
    '''

    print(df7.iloc[0, :])
    '''
    korean     67
    english    87
    math       60
    ns         85
    ss         80
    Name: 강대성, dtype: int64
    '''

    cars = {
        'make': ['Hyundai', 'kia', 'Ford', 'Chevrolet'],
        'model': ['Sonata', 'K5', 'Taurus', 'Impala'],
        'price': [3200, 3100, 3500, 3700]
    }
    df = pd.DataFrame(cars)
    write_txt = df.to_csv('./cars.txt', sep=" ", index=True, header=True)

    return False


chap05()
