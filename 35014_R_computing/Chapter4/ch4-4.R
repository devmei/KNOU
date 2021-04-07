## 4.4. 프로그래밍의 기본 구조

## 예제 4-5  다음은 일정한 기준을 만족할 때만 명령을 수행하는 if 조건문의 활용 예이다

x <- c(1, 2, 3, 4)
y <- c(2, 1, 4, 5)

if(sum(x) < sum(y)) print(x)    # x의 합이 y의 합보다 작을 때 x를 출력
## [1] 1 2 3 4

if(sum(x) < sum(y)) {           # x의 합이 y의 합보다 작을 때 x의 평균과 분산을 출력
    print(mean(x))
    print(var(x))
}
## [1] 2.5
## [1] 1.666667


## 예제 4-6  [예제 4-5]에서 사용한 같은 벡터 x, y를 정의하고
##           평균값을 비교하여 "Mean(x) > Mean(y)" 또는 "Mean(x) > Mean(y)" 등으로 출력하는 조건문을 작성해 보자
##           또한 x의 평균이 y의 평균보다 크면 x의 평균과 분산을 출력하고 그렇지 않으면 y의 평균과 분산을 출력하도록 한다

x <- c(1, 2, 3, 4)
y <- c(2, 1, 4, 5)

if(mean(x) > mean(y)) print("Mean(x) > Mean(y)") else print("Mean(x) < Mean(y)")
## [1] "Mean(x) < Mean(y)"

if(mean(x) > mean(y)) {  # x의 평균이 y의 평균보다 크면
    print(mean(x))       # x의 평균과 분산을 출력
    print(var(x))
} else {                 # 그렇지 않으면
    print(mean(y))       # y의 평균과 분산을 출력
    print(var(y))
}                        # if와 else의 조건문들이 중괄호로 묶여 있음
## [1] 3
## [1] 3.333333


## 예제 4-7  [예제 4-5]에서 사용한 같은 벡터 x, y를 정의하고
##           x의 길이가 5라는 조건에 x의 합이 10이면 "length = 5, sum = 10"을 출력하고 x의 길이가 5가 아니면 "length = 4, sum = 10"을 출력해 보자
##           또한, x의 길이가 4라는 조건에 x의 합이 10이면 "length = 4, sum = 10"을 출력하고 10이 아니면 "length = 5, sum = 10"을 출력해 보자

x <- c(1, 2, 3, 4)
y <- c(2, 1, 4, 5)

if(length(x) == 10) {                               # 외부 조건문
    if(sum(x) == 10) print("length = 5, sum = 10")  # 내부 조건문
} else {
    print("length = 4, sum = 10")
}
## [1] "length = 4, sum = 10"

if(length(x) == 4) {                                                                   # 외부 조건문
    if(sum(x) == 10) print("length = 4, sum = 10") else print("length = 5, sum = 10")  # 내부 조건문
}
## [1] "length = 4, sum = 10"


## 예제 4-8  [예제 4-5]에서 사용한 같은 벡터 x, y를 정의하고
##           x가 y보다 작으면 x의 값을 반환하고 그렇지 않으면 y 값을 반환하도록 한다
##           또한, x - y의 합이 0보다 크면 "positive"를 출력하고 x - y의 합이 0보다 작다면 "negative"를 출력하며
##           0보다 크지도 작지도 않으면 "zero"를 출력해 보자

x <- c(1, 2, 3, 4)
y <- c(2, 1, 4, 5)

ifelse(x < y, x, y)
## [1] 1 1 3 4

ifelse(sum(x - y) > 0, "positive", ifelse(sum(x - y) < 0, "negative", "zero"))
## [1] "negative"


## 예제 4-9  switch의 매개변숫값이 문자열을 가지는 경우를 살펴보자

x <- c(1, 2, 3, 4)
type <- "var"

switch(type, mean=mean(x), median=median(x), sum=sum(x), var=var(x))
## [1] 1.666667


## 예제 4-10 다음은 switch의 매개변숫값이 정숫값을 가지는 경우의 예이다

x <- c(1, 2, 3, 4)

switch(1, mean(x), sum(x), var(x))
## [1] 2.5