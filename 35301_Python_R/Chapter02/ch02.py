# 2강. 파이썬과 R의 기본 사용법
import numpy as np
import datetime as dt


def chap02():
    print(2 ** 10)  # 1024
    print(2 ^ 10)   # 8

    a = [1, 2, 3, 4, 5]

    # print(a / 3)
    # TypeError: unsupported operand type(s) for /: 'list' and 'int'

    a = np.arange(1, 10)
    print(a)  # [1 2 3 4 5 6 7 8 9]
    print(a / 3)
    # [0.33333333 0.66666667 1.         1.33333333 1.66666667 2.
    #  2.33333333 2.66666667 3.]

    print(a // 3)  # [0 0 1 1 1 2 2 2 3]
    print(a % 3)   # [1 2 0 1 2 0 1 2 0]

    # Python Console
    # runfile('35301_Python_R/Chapter02/test1.py')  # 2

    a = 100
    print(type(a))  # <class 'int'>
    c = "my string"
    d = str(a) + " " + c
    print(d)  # 100 my string

    a = np.arange(15)
    print(a)  # [ 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14]
    print(a[0], a[1])  # 0 1

    m = np.mean(a)
    print(m)  # 7.0

    height = np.array([45, 75, 60, 51, np.nan])
    print(height)  # [45. 75. 60. 51. nan]
    print(np.nanmean(height))  # 57.75

    now = dt.datetime.now()
    print(now.year)  # 2021
    print(now.strftime("%Y-%m-%d: %A"))  # 2021-08-31: Tuesday

    return False


chap02()
