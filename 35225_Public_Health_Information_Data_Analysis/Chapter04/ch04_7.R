# 로짓 분석 - 바르샤바 소녀의 초경 나이

warszawa_data <- read.table("35225_Public_Health_Information_Data_Analysis/Chapter04/WarszawaData.txt", header = T, encoding = "UTF-8")
warszawa_data

attach(warszawa_data)

# 확률 = 초경 경험자 / 군의 총수
probability <- menarche / total
probability
##  [1] 0.00000000 0.00000000 0.00000000 0.01666667 0.02222222 0.05681818 0.09523810 0.15315315 0.16000000
## [10] 0.31182796 0.39000000 0.47222222 0.47474747 0.63207547 0.77142857 0.75213675 0.80612245 0.92783505
## [19] 0.94166667 0.93137255 0.95901639 0.96396396 0.97872340 0.98245614 1.00000000

# 나이별 초경 비율 그리기
plot(age, probability)

# 로짓 분석
logit <- glm(probability ~ age, data = warszawa_data, weights = total, family = "binomial")

summary(logit)
##
## Call:
## glm(formula = probability ~ age, family = "binomial", data = warszawa_data,
##     weights = total)
##
## Deviance Residuals:
##     Min       1Q   Median       3Q      Max
## -2.0363  -0.9953  -0.4900   0.7780   1.3675
##
## Coefficients:
##              Estimate Std. Error z value Pr(>|z|)
## (Intercept) -21.22639    0.77068  -27.54   <2e-16 ***
## age           1.63197    0.05895   27.68   <2e-16 ***
## ---
## Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
##
## (Dispersion parameter for binomial family taken to be 1)
##
##     Null deviance: 3693.884  on 24  degrees of freedom
## Residual deviance:   26.703  on 23  degrees of freedom
## AIC: 114.76
##
## Number of Fisher Scoring iterations: 4

# 오즈비
exp(coef(logit))
##  (Intercept)          age
## 6.046358e-10 5.113931e+00