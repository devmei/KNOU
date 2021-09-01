# 3강. 파이썬 기초
import numpy as np
import matplotlib.pyplot as plt


def basic_np():
    # 11) Numpy 가져오기
    x = np.array([1.0, 2.0, 3.0])
    print(x)        # [1. 2. 3.]
    print(type(x))  # <class 'numpy.ndarray'>

    y = x / 3
    print(y)  # [0.33333333 0.66666667 1.        ]

    x = np.array([1.0, 2.0, 3.0])
    y = np.array([2.0, 4.0, 6.0])
    print(x + y)  # [3. 6. 9.]
    print(x - y)  # [-1. -2. -3.]
    print(x * y)  # [ 2.  8. 18.]
    print(x / y)  # [0.5 0.5 0.5]

    # 12) Numpy - N차원 배열
    A = np.array([[5, 7], [9, 11]])
    print(A)
    # [[5  7]
    #  [9 11]]
    print(A[0], A[1])        # [5 7] [ 9 11]
    print(A[0, 0], A[1, 0])  # 5 9

    B = np.array([[3, 0], [0, 6]])
    print(A + B)
    # [[8  7]
    #  [9 17]]
    print(A * B)
    # [[15  0]
    #  [0 66]]

    # 13) Broadcast: 형상이 다른 배열 계산
    A = np.array([[1, 2], [3, 4]])
    B = np.array([10, 20])
    C = 10
    print(A * B)
    # [[10 40]
    #  [30 80]]
    print(A * C)
    # [[10 20]
    #  [30 40]]

    # 14) 원소 접근: 원소의 인덱스는 0부터 시작
    X = np.array([[51, 55], [14, 19], [0, 4]])
    print(X)
    # [[51 55]
    #  [14 19]
    #  [ 0  4]]
    print(X[0])     # [51 55]
    print(X[0][1])  # 55

    # 15) matplotlib
    x = np.arange(0, 6, 0.1)
    y = np.sin(x)
    plt.plot(x, y)
    plt.show()

    x = np.arange(0, 6, 0.1)
    y1 = np.sin(x)
    y2 = np.cos(x)
    plt.plot(x, y1, label='sin')
    plt.plot(x, y2, label='cos', linestyle='-')
    plt.xlabel('x-axis')
    plt.ylabel('y-axis')
    plt.title("sin & cos")
    plt.legend()
    plt.show()

    return False


basic_np()
