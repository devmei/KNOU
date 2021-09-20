# -*- coding: utf-8 -*-

# 5강. 파이썬과 R 구조적 프로그래밍

# iftest <- function(x) {
#   if (x %% 2 == 0) {
#     cat("x는 짝수입니다\n")
#   }else if (x %% 2 == 1) {
#     cat("x는 홀수입니다\n")
#   }else {
#     cat("x는 자연수가 아닙니다\n")
#   }
# }

iftest <- function(x) {
  if (x %% 2 == 0) {
    cat(x, " is even number\n")
  }else if (x %% 2 == 1) {
    cat(x, " is odd number\n")
  }else {
    cat(x, " is not numeric\n")
  }
}

iftest
## function(x) {
##   if (x %% 2 == 0) {
##     cat(x, " is even number\n")
##   }else if (x %% 2 == 1) {
##     cat(x, " is odd number\n")
##   }else {
##     cat(x, " is not numeric\n")
##   }
## }

iftest(100)
## 100  is even number

iftest(101)
## 101  is odd number

iftest(100.4)
## 100.4  is not numeric

sum1 <- 0
for (x in 1:10) {
  sum1 <- sum1 + x^2
}
print(sum1)
## [1] 385

x <- 1
sum <- 0
while (x <= 10) {
  sum <- sum + x^2
  x <- x + 1
}
print(sum)
## [1] 385

x <- 1:5
for (j in x) {
  if (j == 3) next
  cat(j, " ")
}
## 1  2  4  5

x <- 1:5
for (j in x) {
  if (j == 3) break
  cat(j, " ")
}
## 1  2

my_sums <- function(a = 0, b = 10) {
  data <- a:b
  sum1 <- 0; sum2 <- 0
  for (i in data) {
    sum1 = sum1 + i
    sum2 = sum2 + i^2
  }
  result <- list(sum1 = sum1, sum2 = sum2, n = length(data))
  return(result)
}

a <- my_sums(0, 10)
a
## $sum1
## [1] 55
##
## $sum2
## [1] 385
##
## $n
## [1] 11

a$sum1
## [1] 55

a$sum2
## [1] 385

a <- my_sums()
a
## $sum1
## [1] 55
##
## $sum2
## [1] 385
##
## $n
## [1] 11

a <- my_sums(a = 1, b = 20)
a
## $sum1
## [1] 210
##
## $sum2
## [1] 2870
##
## $n
## [1] 20
