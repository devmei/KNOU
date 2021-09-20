# -*- coding: utf-8 -*-

# 6강. 파이썬과 R을 이용한 자료의 입력 및 출력

birthyear <- function() {
  age <- readline(prompt = "Enter age:")
  curyear <- as.numeric(format(Sys.Date(), "%Y"))
  b.year <- curyear - as.numeric(age)
  list(born.year = b.year)
}

birthyear()
## Enter age: 20
## $born.year
## [1] 2001

getwd()
## [1] "D:/workspace/KNOU"

setwd("D:/workspace/KNOU/35301_Python_R")
getwd()
## [1] "D:/workspace/KNOU/35301_Python_R"
