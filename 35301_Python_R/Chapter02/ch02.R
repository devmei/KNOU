# -*- coding: utf-8 -*-

# 2강. 파이썬과 R의 기본 사용법

2^10
## [1] 1024

2**10
## [1] 1024

a <- 10
print(a)
## [1] 10

cat("\n a = ", a, "\n")
##
## a =  10

a <- c(1:10)
a
##  [1]  1  2  3  4  5  6  7  8  9 10

a / 3
## [1] 0.3333333 0.6666667 1.0000000 1.3333333 1.6666667 2.0000000 2.3333333 2.6666667 3.0000000 3.3333333

a %/% 3
##  [1] 0 0 1 1 1 2 2 2 3 3

a %% 3
##  [1] 1 2 0 1 2 0 1 2 0 1

source("35301_Python_R/Chapter02/test1.R")
## [1] 2

paste("a", as.character(10.1), "cc", sep = "+")
# [1] "a+10.1+cc"

paste("a", as.character(10.1), "cc", sep = " ")
# [1] "a 10.1 cc"

paste("a", as.character(10.1), "cc", sep = "")
# [1] "a10.1cc"

utils:::menuInstallPkgs()

library(ggplot2)
data(mtcars)

head(mtcars)
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
## Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

tail(mtcars)
##                 mpg cyl  disp  hp drat    wt qsec vs am gear carb
## Porsche 914-2  26.0   4 120.3  91 4.43 2.140 16.7  0  1    5    2
## Lotus Europa   30.4   4  95.1 113 3.77 1.513 16.9  1  1    5    2
## Ford Pantera L 15.8   8 351.0 264 4.22 3.170 14.5  0  1    5    4
## Ferrari Dino   19.7   6 145.0 175 3.62 2.770 15.5  0  1    5    6
## Maserati Bora  15.0   8 301.0 335 3.54 3.570 14.6  0  1    5    8
## Volvo 142E     21.4   4 121.0 109 4.11 2.780 18.6  1  1    4    2

?mtcars

qplot(wt, mpg, data = mtcars)

dev.new()
plot(mtcars$wt, mtcars$mpg, pch = 19, col = "BLUE")

Sys.Date()
## [1] "2021-08-31"

Sys.time()
## [1] "2021-08-31 22:52:42 KST"

# format(Sys.Date(), "%Y년%m 월 %d일")
# invalid multibyte character in parser at line 1

dob <- c("1999-10-01")
as.Date(dob)
## [1] "1999-10-01"
format(as.Date(dob), "%Y/%m/%d/%a")
## [1] "1999/10/01/금"
