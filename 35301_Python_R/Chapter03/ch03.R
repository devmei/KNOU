# -*- coding: utf-8 -*-

# 4강. 파이썬과 R의 배열, 리스트, 데이터프레임

xm <- matrix(1:9, nrow = 3, byrow = T, dimnames = list(c('r1', 'r2', 'r3'), c('col1', 'col2', 'col3')))
xm
##    col1 col2 col3
## r1    1    2    3
## r2    4    5    6
## r3    7    8    9

xm <- matrix(1:9, nrow = 3, byrow = T)
xm
##      [,1] [,2] [,3]
## [1,]    1    2    3
## [2,]    4    5    6
## [3,]    7    8    9

colnames(xm) <- c('col1', 'col2', 'col3')
rownames(xm) <- c('r1', 'r2', 'r3')
xm
##    col1 col2 col3
## r1    1    2    3
## r2    4    5    6
## r3    7    8    9

xm[1,]
## col1 col2 col3
##    1    2    3

xm[, 1]
## r1 r2 r3
##  1  4  7

xm[, 2:3]
##    col2 col3
## r1    2    3
## r2    5    6
## r3    8    9

xm[, c(1, 3)]
##    col1 col3
## r1    1    3
## r2    4    6
## r3    7    9

x <- seq(1, 10, by = 2)
y <- letters[1:length(x)]
df <- data.frame(id = x, name = y)
df
##   id name
## 1  1    a
## 2  3    b
## 3  5    c
## 4  7    d
## 5  9    e

df[1,]
##   id name
## 1  1    a

df[, 2]
## [1] a b c d e
## Levels: a b c d e

df$id
## [1] 1 3 5 7 9

df$name
## [1] a b c d e
## Levels: a b c d e
