# 혈압 비교의 짝지은 t-검정

# 복용 전 혈압
bp_before <- c(90, 56, 49, 64, 65, 88, 62,
               91, 74, 93, 55, 71, 54, 64, 54)
# 복용 후 혈압
bp_after <- c(72, 55, 56, 57, 62, 79, 55,
              72, 73, 74, 58, 59, 58, 71, 61)
# 차이
gap <- bp_before - bp_after; gap
## [1] 18  1 -7  7  3  9  7 19  1 19 -3 12 -4 -7 -7

qqnorm(gap)
qqline(gap, col = "red")

shapiro.test(gap)
##
## 	Shapiro-Wilk normality test
##
## data:  gap
## W = 0.90982, p-value = 0.1345

mean(gap); sd(gap)
## [1] 4.533333
## [1] 9.425396

t.test(bp_before, bp_after, paired = T, alternative = "greater")
##
## 	Paired t-test
##
## data:  bp_before and bp_after
## t = 1.8628, df = 14, p-value = 0.0418
## alternative hypothesis: true difference in means is greater than 0
## 95 percent confidence interval:
##  0.2469617       Inf
## sample estimates:
## mean of the differences
##                4.533333