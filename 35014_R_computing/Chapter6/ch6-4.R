## 6.4. 연속형 이변수 변수들에 대한 자료의 표현

library(MASS)


## 6.4.1. 기본 산점도
with(Cars93, plot(Price, MPG.city, main="Price vs. MPG.city", xlab="Price", ylab="MPG in City", pch=19))
with(Cars93, abline(lm(MPG.city~Price), col="red", lwd=2))
with(Cars93, lines(lowess(Price, MPG.city), col="blue", lwd=2))
legend(40, 40, lty=1, col=c("red", "blue"), c('regression', 'lowess'), lwd=2, bty='n')