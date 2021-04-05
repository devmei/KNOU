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