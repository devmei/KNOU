## 2.3. 데이터 불러오기

## 예제 2-9  현재의 작업 디렉터리에서 "dat_exam1.csv"를 불러서 dat2라는 객체로 저장하라

dat2 <- read.csv('dat_exam1.csv')
dat2
##   X x  y
## 1 1 1 10
## 2 2 2 20
## 3 3 3 30
## 4 4 4 40
## 5 5 5 50


## 예제 2-10 현 작업 경로에 USArrestd.csv라는 데이터세트가 저장되어 있다고 가정하자
##           이 데이터세트는 1973년 50개의 미국 주(states)에 대한 범죄율에 대한 자료이다
##           read.csv() 함수를 이용하여 USArrestd.csv를 불러오고 us_dat라는 객체 명으로 저장해 보자

us_dat <- read.csv('USArrestd.csv', header=T)
head(us_dat)
##        State Murder Assault UrbanPop Rape
## 1    Alabama   13.2     236       58 21.2
## 2     Alaska   10.0     263       48 44.5
## 3    Arizona    8.1     294       80 31.0
## 4   Arkansas    8.8     190       50 19.5
## 5 California    9.0     276       91 40.6
## 6   Colorado    7.9     204       78 38.7


## 예제 2-11 read.csv() 함수를 이용하여 USArrestd.csv 데이터세트를 불러오되
##           "stringsAsFactors=F"라는 옵션을 이용하여 문자변수가 Factor 변수로 인식되지 않도록 지정하라

us_dat2 <- read.csv('USArrestd.csv', header=T, stringsAsFactors=F)
str(us_dat2)
## 'data.frame':   50 obs. of  5 variables:
##  $ State   : chr  "Alabama" "Alaska" "Arizona" "Arkansas" ...
##  $ Murder  : num  13.2 10 8.1 8.8 9 7.9 3.3 5.9 15.4 17.4 ...
##  $ Assault : int  236 263 294 190 276 204 110 238 335 211 ...
##  $ UrbanPop: int  58 48 80 50 91 78 77 72 80 60 ...
##  $ Rape    : num  21.2 44.5 31 19.5 40.6 38.7 11.1 15.8 31.9 25.8 ...


## 예제 2-12 현 작업 경로에 저장된 dat_exam2.txt라는 파일을 read.table() 함수를 이용하여 불러오라

read.table('dat_exam2.txt', header=T)
##   x  y
## 1 1 10
## 2 2 20
## 3 3 30
## 4 4 40
## 5 5 50

read.table('dat_exam2.txt')
##   x  y
## 1 1 10
## 2 2 20
## 3 3 30
## 4 4 40
## 5 5 50


## 예제 2-13 [예제 2-5]에서 저장된 객체 dat3가 현 작업경로에 'dat3_exam1.txt'라는 이름으로 저장되어 있다고 하자
##           데이터를 불러올 때, 관측값 'aa'를 결측치로 인식하여 불러오고자 한다
##           적절한 옵션을 주어 데이터를 불러오고 nadat라는 객체로 저장하라

write.table(dat3, 'dat3_exam1.txt')

nadat <- read.table('dat3_exam1.txt', na.strings='aa', header=T)
nadat
##   var1 var2
## 1   11 <NA>
## 2   22   bb
## 3   33   cc