## 3.5. 리스트

## 예제 3-19 다음은 리스트를 생성하는 데 사용되는 list() 함수를 이용하여
##           2개의 벡터와 1개의 문자열을 가진 리스트를 생성하고 속성을 출력하는 예제이다

a <- 1:10
b <- 11:15
# 리스트를 생성
klist <- list(vec1=a, vec2=b, descript="example")

length(klist)  # 리스트 klist의 자료의 개수
## [1] 3

mode(klist)    # 리스트 klist의 자료의 형태
## [1] "list"

names(klist)   # 리스트 klist의 각 성분의 이름
## [1] "vec1"    "vec2"    "descript"


## 예제 3-20 list() 함수를 이용하여 "A"라는 문자와 1에서 8까지의 원소를 갖는 벡터를 성분으로 하는 list1이라는 리스트를 생성하자
##           list1의 세 번째 성분으로 논릿값 T, F를 갖는 벡터를 추가하고, 두 번째 성분의 아홉 번째 원소로 9를 추가해보자

list1 <- list("A", 1:8)       # list1 리스트 생성
list1
## [[1]]
## [1] "A"
##
## [[2]]
## [1] 1 2 3 4 5 6 7 8

list1[[3]] <- list(c(T, F))   # 세 번째 성분을 추가
list1[[2]][9] <- 9            # 두 번째 성분에 원소 추가
list1
## [[1]]
## [1] "A"
##
## [[2]]
## [1] 1 2 3 4 5 6 7 8 9
##
## [[3]]
## [[3]][[1]]
## [1]  TRUE FALSE

list1[3] <- NULL              # 세 번째 성분 삭제
list1[[2]] <- list1[[2]][-9]  # 두 번째 성분의 아홉 번째 원소 삭제
list1
## [[1]]
## [1] "A"
##
## [[2]]
## [1] 1 2 3 4 5 6 7 8


## 예제 3-21 1에서 10까지의 원소를 갖는 벡터 a와 11에서 15까지의 원소를 갖는 벡터 b를 생성하고 "example"이라는 문자와 함께 nlist라는 리스트를 만들어 보자
##           각 성분의 이름은 벡터 a는 vec1, 벡터 b는 vec2, "example"은 descript라고 지정하도록 한다

# 벡터 a, b 생성
a <- 1:10
b <- 11:15

# a, b 벡터 및 descript 변수에 example 문자 부여
nlist <- list(vec1=a, vec2=b, descript="example")
nlist
## $vec1
## [1]  1  2  3  4  5  6  7  8  9 10
##
## $vec2
## [1] 11 12 13 14 15
##
## $descript
## [1] "example"

nlist[[2]][5]        # 두 번째 성분 vec2의 다섯 번째 원소
## [1] 15

nlist$vec2[c(2, 3)]  # vec2의 두 번째와 세 번째 원소
## [1] 12 13