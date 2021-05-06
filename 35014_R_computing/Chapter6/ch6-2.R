## 6.2. 연속형 단변수 자료

library(MASS)

# options("install.lock"=FALSE)
# install.packages("vcd")


## 6.2.1. 히스토그램(Histogram)
with(Cars93, hist(MPG.highway, xlab='MPG in Highway', main='MPG in Highway'))


## 6.2.2. 확률밀도함수 그림(Density Plot) (1)
library(vcd)

summary(Arthritis)
##       ID          Treatment      Sex          Age          Improved
## Min.   : 1.00   Placebo:43   Female:59   Min.   :23.00   None  :42
## 1st Qu.:21.75   Treated:41   Male  :25   1st Qu.:46.00   Some  :14
## Median :42.50                            Median :57.00   Marked:28  
## Mean   :42.50                            Mean   :53.36
## 3rd Qu.:63.25                            3rd Qu.:63.00
## Max.   :84.00                            Max.   :74.00

head(Arthritis)
##   ID Treatment  Sex Age Improved
## 1 57   Treated Male  27     Some
## 2 46   Treated Male  29     None
## 3 77   Treated Male  30     None
## 4 17   Treated Male  32   Marked
## 5 36   Treated Male  46   Marked
## 6 23   Treated Male  58   Marked

with(Arthritis, plot(density(Age)))


## 6.2.3. 확률밀도함수 그림 (2)
with(Cars93, hist(MPG.highway, xlab='MPG in Highway', main='MPG in Highway', probability=T))
with(Cars93, lines(density(MPG.highway), col='red', lwd=2))


## 6.2.4. Quantile-Quantile(Q-Q) 그림
with(Cars93, qqnorm(Turn.circle, main='Q-Q plot of Turn.circle \n (U-turn space, feet)'))
with(Cars93, qqline(Turn.circle, col='orange', lwd=2))