## 5.3. 여러 가지 함수의 생성

## 예제 5-5  x와 y라는 데이터 값을 받아서 두 수의 합을 계산하는 함수 f1과 차를 계산하는 f2를 생성하자
##           함수 f1을 f라는 이름으로 지정하여 f(1, 2)를 계산하자 또한, f2를 f라는 이름으로 지정하여 f(1, 2)를 계산해 보자

f1 <- function(x, y) { return (x + y) }
f2 <- function(x, y) { return (x - y) }

f <- f1  # f1을 f라는 이름으로 저장
f(1, 2)
## [1] 3

f <- f2  # f2를 f라는 이름으로 저장
f(1, 2)
## [1] -1


## 예제 5-6  [예제 5-5]에서 생성한 f1과 f2 및 x와 y를 매개변수로 하는 함수 g를 생성하여 x와 y의 합과 차를 계산하는 작업을 수행해 보자

g <- function(h, x, y) { h(x, y) }  # h는 함수를 받는 매개변수

g(f1, 1, 2)                         # h는 f1, x = 3, y = 2
## [1] 3

g(f2, 1, 2)                         # h는 f2, x = 3, y = 2
## [1] -1


## 예제 5-7  x에 (1, 2, 3, 4)의 값을, y에 (4, 3, 2, 1) 값을 저장하고 x - y의 값을 z에 저장한 뒤 z 값을 출력해 보자
f0 <- function() {  # 매개변수가 없는 함수 선언
    x <- c(1, 2, 3, 4)
    y <- c(4, 3, 2, 1)
    z <- x - y
    print(z)        # z를 출력
}
f0()
## [1] -3 -1  1  3


## 예제 5-8  data와 num이라는 매개변수를 받아 data의 평균과 분산, 범위를 구하는 함수를 구해 보자
##           단, num이라는 매개변수에 따라 평균, 분산, 범위 중 한 가지 통계량만을 구하여 출력하도록 한다
##           기본값은 평균을 출력하는 것으로 지정한다

f_default <- function(data, num=1) {                     # "num=1"은 기본값으로 1
    d.min <- min(data)
    d.max <- max(data)
    switch(num, mean(data), var(data), c(d.min, d.max))  # switch 함수
}


## 예제 5-9  평균이 5이고 표준편차 2인 정규분포를 따르는 난수를 1,000개 발생시켜 x에 저장한 뒤 [예제 5-8]에서 정의한 함수 f_default를 사용하여 x의 분산을 구해보자
##           또한, 이 값과 num 값을 주지 않았을 때의 결괏값을 비교해 보자
x <- rnorm(1000, mean=5, sd=2)  # random number를 생성
                                # normal 정규분포를 따름(평균 5, 표준편차 2)
f_default(data=x, num=2)
## [1] 3.753267

f_default(x, 2)
## [1] 3.753267

f_default(x)
## [1] 4.99296


## 예제 5-10 [예제 5-8]과 같이 f_default라는 함수를 정의하고, 이렇게 생성된 f_default라는 객체가 함수인지를 판별하도록 하자
f_default <- function(data, num=1) {
    d.min <- min(data)
    d.max <- max(data)
    switch(num, mean(data), var(data), c(d.min, d.max))
}
is.function(f_default)
## [1] TRUE


## 예제 5-11 [예제 5-8]의 f_default라는 함수의 매개변수로 무엇을 사용하는지 출력해 보자
##           args() 함수 내에 대상 함수 이름 f_default를 입력하여 명령을 수행해 보면 다음과 같은 결과를 얻을 수 있다
args(f_default)
## function (data, num = 1) 
## NULL


## 예제 5-12 R에 내장된 기본함수도 args() 함수를 이용하면 매개변수를 파악할 수 있다
##           log 함수의 매개변수들을 출력해 보자
args(log)
## function (x, base = exp(1))
## NULL


## 예제 5-13 attributes() 함수를 이용하여 [예제 5-8]에 있는 f_default 함수의 소스 코드를 출력해 보자
attributes(f_default)
## $srcref
## function(data, num=1) {
##     d.min <- min(data)
##     d.max <- max(data)
##     switch(num, mean(data), var(data), c(d.min, d.max))
## }


## 예제 5-14 두 변숫값을 받아서 앞의 값에 2를 곱한 뒤 뒤쪽 값을 더하는 연산자를 생성하여 보자
"%a2b%" <- function(a, b) return (2 * a + b)
3 %a2b% 5
## [1] 11


## 예제 5-15 함수 f는 v라는 지역변수에 1이라는 값을 저장하고 이 함수 매개변수 y 값을 받은 뒤,
##           이 y 값과 v, 그리고 외부에서 지정되는 u 값을 더하여 제곱연산을 하는 함수이다
f <- function(x) {
    v <- 2
    g <- function(y) return ((u + v + y) ^ 2)
    gu <- g(u)
    print(gu)
}
u <- 5
f()
## [1] 144