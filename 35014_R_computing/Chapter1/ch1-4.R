## 1.4. R의 기본 활용

## 예제 1-5  c() 함수를 이용하여 (1, 2, 3), (4, 5, 6)의 값을 갖는 벡터 x, y를 만들고
##           x + y, x * y, x ^ 2, log(x ^ 2) 등을 계산하여 보자
##           그리고 벡터 x, y를 병합하여 새로운 벡터 z를 생성하여 보자

x <- c(1, 2, 3)  # 벡터 x 생성, 수열이므로 1:3도 가능
y <- c(4, 5, 6)  # 벡터 y 생성, 수열이므로 4:6도 가능

x + y            # x와 y의 원소별 합
## [1] 5 7 9

x * y            # x와 y의 원소별 곱
## [1]  4 10 18

x ^ 2            # x값의 원소별 제곱
## [1] 1 4 9

log(x ^ 2)       # x의 제곱에 자연로그(log)를 취한 값
## [1] 0.000000 1.386294 2.197225

z <- c(x, y)     # 벡터 x와 y를 병합하고 z에 저장
z
## [1] 1 2 3 4 5 6


## 예제 1-6  R의 내장함수를 이용하여 벡터 x = (7, 2, 4, 9, 8, 6, 1, 5, 10, 3)에 대해
##           합, 평균, 분산 등 기초 통계량을 계산하여 보자

x <- c(7, 2, 4, 9, 8, 6, 1, 5, 10, 3)

sort(x)             # 숫자를 오름차순으로 정렬
## 1]  1  2  3  4  5  6  7  8  9 10

sum(x)              # 합
## [1] 55

mean(x)             # 표본평균
## [1] 5.5

sum(x) / length(x)  # 포본평균
## [1] 5.5

var(x)              # 표본분산
## [1] 9.166667

min(x)              # 최솟값
## [1] 1

which.min(x)        # 최솟값이 있는 위치
## [1] 7

summary(x)          # 기초 통계량
##   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
##   1.00    3.25    5.50    5.50    7.75   10.00


## 예제 1-7  (1, 3, 5, NA, 9, NA, 11)로 이루어진 벡터 y를 정의하고
##           평균을 구하기 위해 mean()을 실행하였을 때 어떠한 결괏값이 산출되는지 살펴보자

y <- c(1, 3, 5, NA, 9, NA, 11)

mean(y)
## [1] NA            # 함수 실행 결과도 NA

mean(y, na.rm=TRUE)  # 연산에서 NA 제외 옵션
## [1] 5.8

is.na(y)             # 각 관측치가 NA 여부 판단
## [1] FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE

which(is.na(y))      # NA인 관측치의 위치 값
## [1] 4 6

sum(is.na(y))        # 관측치가 NA 여부 판단 시 TRUE면 1, FALSE면 0
## [1] 2             # sum은 합계 산출 함수

1 / 0    # 무한대
## [1] Inf

log(-1)  # 이상치
## [1] NaN
## In log(-1) : NaN이 생성되었습니다