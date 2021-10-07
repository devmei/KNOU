# 폐 파괴지수 자료의 t-검정

# 흡연자
smoker <- c(16.6, 13.9, 11.3, 26.5, 17.4, 15.3, 15.8, 12.3,
            18.6, 12.0, 24.1, 16.5, 21.8, 16.3, 23.4, 18.8)
smoker
##  [1] 16.6 13.9 11.3 26.5 17.4 15.3 15.8 12.3 18.6 12.0 24.1 16.5 21.8 16.3 23.4 18.8

# 비흡연자
non_smoker <- c(18.1, 6.0, 10.8, 11.0, 7.7, 17.9, 8.5, 13.0, 18.9)
non_smoker
## [1] 18.1  6.0 10.8 11.0  7.7 17.9  8.5 13.0 18.9

qqnorm(smoker, main = "Smoker")
qqline(smoker, col = "red")

qqnorm(non_smoker, main = "Non-Smoker")
qqline(non_smoker, col = "red")

shapiro.test(smoker)
##
## 	Shapiro-Wilk normality test
##
## data:  smoker
## W = 0.94511, p-value = 0.4163

shapiro.test(non_smoker)
##
## 	Shapiro-Wilk normality test
##
## data:  non_smoker
## W = 0.90366, p-value = 0.274

# 병렬 상자 그림
boxplot(smoker, non_smoker, col = "yellow", names = c("Smoker", "Non-Smoker"))

# 병렬 바이올린 그림
library(vioplot)
vioplot(smoker, non_smoker, col = "yellow", names = c("Smoker", "Non-Smoker"))

# 두 모분산 비교(양측검정)
sd(smoker); sd(non_smoker)
## [1] 4.475247
## [1] 4.849227

var.test(smoker, non_smoker)
##
## 	F test to compare two variances
##
## data:  smoker and non_smoker
## F = 0.8517, num df = 15, denom df = 8, p-value = 0.7498
## alternative hypothesis: true ratio of variances is not equal to 1
## 95 percent confidence interval:
##  0.2076714 2.7243799
## sample estimates:
## ratio of variances
##          0.8517046

# 두 모평균 비교(양측검정) - 등분산 가정
t.test(smoker, non_smoker, var.equal = T)
##
## 	Two Sample t-test
##
## data:  smoker and non_smoker
## t = 2.658, df = 23, p-value = 0.01405
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  1.131680 9.076653
## sample estimates:
## mean of x mean of y
##  17.53750  12.43333

# 두 모평균 비교(양측검정) - 이분산 가정
t.test(smoker, non_smoker)
##
## 	Welch Two Sample t-test
##
## data:  smoker and non_smoker
## t = 2.5964, df = 15.593, p-value = 0.01978
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  0.9279143 9.2804190
## sample estimates:
## mean of x mean of y
##  17.53750  12.43333