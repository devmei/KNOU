## 3.3. 행렬

## 예제 3-12 matrix() 함수를 이용하여 1에서 9까지의 원소를 갖는 3행 3열의 행렬을 생성하고 출력하자
##           이 행렬의 원소 개수, 원소의 형태 및 행과 열의 개수를 출력하여 확인해 보자

matr <- matrix(1:9, nrow=3)
matr
##      [,1] [,2] [,3]
## [1,]    1    4    7
## [2,]    2    5    8
## [3,]    3    6    9

length(matr)
## [1] 9

mode(matr)
## [1] "numeric"

dim(matr)
## [1] 3 3


## 예제 3-13 [예제 3-12]에서 matrix() 함수를 이용하여 생성된 행렬과 같은 형태의 행렬을 rbind(), cbind(), dim() 함수를 이용하여 만들어 보자
##           단, rbind()와 cbind() 함수를 이용할 때는 적당한 벡터를 먼저 생성해 주어야 한다

r1 <- c(1, 2, 3)    # r1, r2, r3 행 벡터 생성
r2 <- c(4, 5, 6)
r3 <- c(7, 8, 9)

rbind(r1, r2, r3)   # rbind : 행을 기준으로 결합
##    [,1] [,2] [,3]
## r1    1    2    3
## r2    4    5    6
## r3    7    8    9

c1 <- c(1:3)        # c1, c2, c3 열 벡터 생성
c2 <- c(4:6)
c3 <- c(7:9)

cbind(c1, c2, c3)   # cbind : 열을 기준으로 결합
##      c1 c2 c3
## [1,]  1  4  7
## [2,]  2  5  8
## [3,]  3  6  9

m1 <- 1:9           # : 만으로도 c(1:9)와 같은 기능을 수행
dim(m1) <- c(3, 3)  # dim : 차원을 지정
m1
##      [,1] [,2] [,3]
## [1,]    1    4    7
## [2,]    2    5    8
## [3,]    3    6    9


## 예제 3-14 1에서 9까지의 원소를 갖는 행 기준의 3행 3열 행렬을 만들고 특정 행과 열, 조건에 따른 원소 추출들을 실행하여 보자
##           apply()와 sweep() 함수를 통한 행 또는 열 연산의 사례도 살펴보자

# 1) 원소 추출
# byrow=T 옵션을 줌으로써 행 기준 3열의 행렬 생성
mat <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), ncol=3, byrow=T)
mat
##      [,1] [,2] [,3]
## [1,]    1    2    3
## [2,]    4    5    6
## [3,]    7    8    9

mat[1, ]              # 행렬 mat의 1행의 값
## [1] 1 2 3

mat[, 3]              # 행렬 mat의 3열의 값
## [1] 3 6 9

mat[mat[, 3] > 4, 2]  # 3열에서 4보다 큰 행의 값 중 2열의 모든 값
## [1] 5 8

mat[2, 3]             # 2행 3열의 값 추출
## [1] 6

# 2) apply() 함수
Height <- c(140, 155, 142, 175)
# size.1 행렬을 생성하고 dimnames로 행과 열의 이름을 부여
size.1 <- matrix(c(130, 26, 110, 24, 118, 25, 112, 25), ncol=2, byrow=T, dimnames=list(c("Lee", "Kim", "Park", "Choi"), c("Weight", "Waist")))
# size.1 행렬과 Height 벡터의 열 기준 결합
size <- cbind(size.1, Height)
size
##      Weight Waist Height
## Lee     130    26    140
## Kim     110    24    155
## Park    118    25    142
## Choi    112    25    175

colmean <- apply(size, 2, mean)  # 2 : 열의 평균값(mean)을 계산
colmean
## Weight  Waist Height
##  117.5   25.0  153.0

rowmean <- apply(size, 1, mean)  # 1 : 행의 평균값(mean)을 계산
rowmean
##      Lee       Kim      Park      Choi
## 98.66667  96.33333  95.00000 104.00000

colvar <- apply(size, 2, var)    # 2 : 열의 분산 값(var)을 계산
colvar
##     Weight       Waist      Height
## 81.0000000   0.6666667 259.3333333

rowvar <- apply(size, 1, var)    # 1 : 행의 분산 값(var)을 계산
rowvar
##      Lee      Kim     Park     Choi
## 3985.333 4430.333 3819.000 5673.000

# 3) sweep 함수(기본연산은 "-"로 지정되어 있음)
sweep(size, 2, colmean)             # size 각 열의 값과 colmean의 차
##      Weight Waist Height
## Lee    12.5     1    -13
## Kim    -7.5    -1      2
## Park    0.5     0    -11
## Choi   -5.5     0     22

sweep(size, 1, rowmean)             # size 각 행의 값과 rowmean의 차
##        Weight     Waist   Height
## Lee  31.33333 -72.66667 41.33333
## Kim  13.66667 -72.33333 58.66667
## Park 23.00000 -70.00000 47.00000
## Choi  8.00000 -79.00000 71.00000

sweep(size, 1, c(1, 2, 3, 4), "+")  # size 각 행의 값에 c(1, 2, 3, 4) 값을 더해 줌
##      Weight Waist Height
## Lee     131    27    141
## Kim     112    26    157
## Park    121    28    145
## Choi    116    29    179

sweep(size, 1, c(1, 2, 3, 4), "-")  # size 각 행의 값에서 c(1, 2, 3, 4) 값을 빼 줌
##      Weight Waist Height
## Lee     129    25    139
## Kim     108    22    153
## Park    115    22    139
## Choi    108    21    171


## 예제 3-15 1에서 4까지의 값을 갖는 열 기준 행렬 m1과 5에서 8까지의 값을 갖는 열 기준의 행렬 m2를 생성하고
##           두 행렬의 곱, m1의 전치행렬 및 m1의 역행렬을 구해 보자
m1 <- matrix(1:4, nrow=2)  # 1~4까지 2행 2열의 행렬 생성
m1
##      [,1] [,2]
## [1,]    1    3
## [2,]    2    4

m2 <- matrix(5:8, nrow=2)  # 5~8까지 2행 2열의 행렬 생성
m2
##      [,1] [,2]
## [1,]    5    7
## [2,]    6    8

m1 %*% m2                  # m1과 m2 행렬의 곱셈
##      [,1] [,2]
## [1,]   23   31
## [2,]   34   46

solve(m1)                  # m1 행렬의 역행렬 생성
##      [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5

t(m1)                      # m1 행렬의 전치행렬 생성
##      [,1] [,2]
## [1,]    1    2
## [2,]    3    4