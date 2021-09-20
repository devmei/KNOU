# 5강. 파이썬과 R 구조적 프로그래밍
import numpy as np


class Student:
    def __init__(self, first, last):
        self.first = first
        self.last = last

    def capital_first(self):
        return self.first.upper()


class Student2:
    def __init__(self, first, last):
        self.first = first
        self.last = last

    def capital_first(self):
        return self.first.upper(), self.last.upper()


class StudentGrade(Student):
    def __init__(self, first, last, score):
        super().__init__(first, last)
        self.score = score

    def grade(self):
        if self.score < 80:
            grade = 'B'
        else:
            grade = 'A'
        return grade


def chap04():
    if_test1(100)
    # x는 짝수입니다

    mysum = 0
    # for x in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]:
    for x in range(1, 11):
        mysum = mysum + x ** 2
    else:
        print(mysum)
        # 385

    x = 1
    sum = 0
    while x <= 10:
        sum = sum + x ** 2
        x = x + 1

    print(sum)
    # 385

    x = range(1, 6)
    for j in x:
        if j == 3:
            continue
        print(j, " ")
        '''
        1  
        2  
        4  
        5 
        '''

    x = range(1, 6)
    for j in x:
        if j == 3:
            break
        print(j, " ")
        '''
        1  
        2  
        '''

    print(my_sums(1, 10))
    # (55, 385, 10)

    a = my_sums(1, 10)
    print(a[0])  # 55
    print(a[1])  # 385

    aa = Student('John', 'Doe')
    bb = Student('John', 'Doe')

    print(aa.first, aa.last)  # John Doe
    print(bb.first, bb.last)  # John Doe

    print(aa.capital_first())  # JOHN
    print(bb.capital_first())  # JOHN

    aa2 = Student2('John', 'Doe')
    print(aa2.capital_first())
    # ('JOHN', 'DOE')

    aa2 = StudentGrade('John', 'Doe', 75)
    print(aa2.first, aa2.last)
    # John Doe
    print(aa2.score, aa2.grade())
    # 75 B

    return False


def if_test1(x):
    if x % 2 == 0:
        print("x는 짝수입니다")
    else:
        if x % 2 == 1:
            print("x는 홀수입니다")
        else:
            print("x는 자연수가 아닙니다")


def my_sums(a=0, b=10):
    sum1 = 0
    sum2 = 0
    data = np.arange(a, b + 1)
    for i in data:
        sum1 = sum1 + i
        sum2 = sum2 + i ** 2
    return sum1, sum2, len(data)


chap04()
