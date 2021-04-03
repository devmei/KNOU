## 3.6. 데이터 프레임

## 예제 3-22 read.table() 함수를 이용하여 story.txt 파일을 읽어 보자

d2 <- read.table("story.txt", row.names='num', header=T)
d2
##   name age sex
## 1  Lee  55   M
## 2 Park  47   F
## 3   So  35   M
## 4  Kim  26   F
## 5 Yoon  29   M

## 예제 3-23 다음은 문자형 벡터 char1과 수치형 벡터 num1을 생성하고 결합하여 test1이라는 데이터 프레임을 만들어 보는 예제이다
##           이렇듯 데이터 프레임은 행렬과 구조는 유사하지만 각 열의 데이터 형태가 다른 점이 행렬과 큰 차이점이다

char1 <- rep(LETTERS[1:3], c(2, 2, 1))  # 문자형 벡터 char1
char1
## [1] "A" "A" "B" "B" "C"

num1 <- rep(1:3, c(2, 2, 1))            # 수치형 벡터 num1
num1
## [1] 1 1 2 2 3

test1 <- data.frame(char1, num1)        # test1 데이터 프레임 생성
test1
##   char1 num1
## 1     A    1
## 2     A    1
## 3     B    2
## 4     B    2
## 5     C    3


## 예제 3-24 문자 a부터 o까지 이루어진 벡터를 생성하고 이를 5행 3열의 행렬로 변환한 뒤 a1으로 지정하자
##           저장한 행렬 a1을 as.data.frame() 함수를 이용하여 데이터 프레임으로 변환하여 보자

a1 <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o")
dim(a1) <- c(5, 3)          # 5행 3열인 a1 행렬 생성
a1
##      [,1] [,2] [,3]
## [1,] "a"  "f"  "k"
## [2,] "b"  "g"  "l"
## [3,] "c"  "h"  "m"
## [4,] "d"  "i"  "n"
## [5,] "e"  "j"  "o"

test3 <- as.data.frame(a1)  # a1을 데이터 프레임으로 변환
test3
##   V1 V2 V3
## 1  a  f  k
## 2  b  g  l
## 3  c  h  m
## 4  d  i  n
## 5  e  j  o


## 예제 3-25 [예제 3-23]의 test1과 [예제 3-24]의 test3라는 데이터 프레임을 cbind() 함수를 이용하여 옆으로 병합해 보자
##           test4라는 새로운 데이터 프레임을 생성하고 rbind() 함수를 이용하여 test1과 test4를 아래로 병합해 보자

cbind(test1, test3)               # test1과 test3를 옆으로 병합한 형태
##   char1 num1 V1 V2 V3
## 1     A    1  a  f  k
## 2     A    1  b  g  l
## 3     B    2  c  h  m
## 4     B    2  d  i  n
## 5     C    3  e  j  o

char1 <- rep(LETTERS[1:3], c(1, 2, 2))
char1
## [1] "A" "B" "B" "C" "C"

num1 <- rep(1:3, c(1, 1, 3))
num1
## [1] 1 2 3 3 3

test4 <- data.frame(char1, num1)  # test4 데이터 프레임 생성
test4
##   char1 num1
## 1     A    1
## 2     B    2
## 3     B    3
## 4     C    3
## 5     C    3

rbind(test1, test4)               # 아래로 병합한 형태
##    char1 num1
## 1      A    1
## 2      A    1
## 3      B    2
## 4      B    2
## 5      C    3
## 6      A    1
## 7      B    2
## 8      B    3
## 9      C    3
## 10     C    3


## 예제 3-26 [예제 3-25]에서 생성한 test1과 test4를 merge() 함수를 이용하여 결합해 보자

merge(test1, test4)  # test1, test4를 결합한 형태
##   char1 num1
## 1     A    1
## 2     A    1
## 3     B    2
## 4     B    2
## 5     C    3
## 6     C    3