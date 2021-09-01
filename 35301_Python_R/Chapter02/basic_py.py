# 3강. 파이썬 기초

class Man:
    def __init__(self, name):
        self.name = name
        print("Initialized!")

    def hello(self):
        print("Hello " + self.name + "!")

    def goodbye(self):
        print("Good-bye " + self.name + "!")


class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def show(self):
        print(self.name)
        print(self.age)


class Person2:
    def __init__(self):
        self.name = input('Name:')
        self.age = int(input('Age:'))

    def disprint(self):
        print("Name=", self.name)
        print("Age=", self.age)


def basic_py():
    # 1) 산술연산
    print(1 - 2)   # -1
    print(4 * 5)   # 20
    print(7 / 5)   # 1.4
    print(3 ** 2)  # 9

    # 2) 자료형
    print(type(10))       # <class 'int'>
    print(type(2.710))    # <class 'float'>
    print(type("hello"))  # <class 'str'>

    # 3) 변수
    x = 10
    print(x)  # 10
    y = 3.14
    print(x * y)        # 31.400000000000002
    print(type(x * y))  # <class 'float'>

    # 4) 리스트
    a = [1, 2, 3, 4, 5]
    print(a)           # [1, 2, 3, 4, 5]
    print(len(a))      # 5
    print(a[0], a[4])  # 1 5
    a[4] = 99
    print(a)       # [1, 2, 3, 4, 99]
    print(a[0:2])  # [1, 2]
    print(a[1:])   # [2, 3, 4, 99]
    print(a[:3])   # [1, 2, 3]
    print(a[:-1])  # [1, 2, 3, 4]
    print(a[:-2])  # [1, 2, 3]

    # 5) Dictionary: key 와 value 를 한 쌍으로 저장
    me = {'height': 180, 'weight': 70}
    print(me['height'])  # 180
    print(me['weight'])  # 70
    me['age'] = 30       # 새 원소 추가
    print(me)            # {'height': 180, 'weight': 70, 'age': 30}

    # 참고: 1장 desc0.py

    # 6) bool
    hungry = True
    sleepy = False
    print(type(hungry))       # <class 'bool'>
    print(not hungry)         # False
    print(hungry and sleepy)  # False
    print(hungry or sleepy)   # True

    # 7) if
    hungry = True
    if hungry:
        print("I'm hungry")
    # I'm hungry

    hungry = False
    if hungry:
        print("I'm hungry")
    else:
        print("I'm not hungry")
        print("I'm sleepy")
    # I'm not hungry
    # I'm sleepy

    # 8) for: 반복문 (1)
    for i in [1, 2, 3]:
        print(i)
    # 1
    # 2
    # 3

    name = ['a', 'b', 'c', 'd', 'e']
    for i in name:
        print(i)
    # a
    # b
    # c
    # d
    # e

    # 8) for: 반복문 (2)
    res = 0
    for i in range(10):
        # res = res + i
        res += i
    print(res)  # 45

    # 9) 함수
    hello()
    # Hello World!
    # Welcome to Python class!

    hello2("Jang")
    # Hello Jang!

    # 10) 클래스 (1)
    m = Man("David")
    # Initialized!

    m.hello()
    # Hello David!

    m.goodbye()
    # Good-bye David!

    # 10) 클래스 (2)
    p1 = Person('홍길동', 22)
    p2 = Person('철수', 35)

    p1.show()
    # 홍길동
    # 22

    p2.show()
    # 철수
    # 35

    return False


def hello():
    print("Hello World!")
    print("Welcome to Python class!")


def hello2(obj):
    print("Hello " + obj + "!")


basic_py()
