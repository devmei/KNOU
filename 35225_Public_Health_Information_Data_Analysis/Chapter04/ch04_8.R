# 로짓 분석 - 비타민 E와 임신에 대한 관계

# 용량
capacity <- c(3.75, 5.0, 6.25, 7.5, 10.0, 15.0)
# 쥐 숫자
mice <- c(5, 10, 10, 10, 11, 11)
# 임신 숫자
pregnancy <- c(0, 2, 4, 8, 10, 11)

# 확률 = 임신 숫자 / 쥐 숫자
probability <- pregnancy / mice
probability
## [1] 0.0000000 0.2000000 0.4000000 0.8000000 0.9090909 1.0000000

# 용량의 상용로그별 임신 비율
plot(log10(capacity), probability, ylab = "probability")

# 로짓 분석
logit <- glm(probability ~ log10(capacity), family = "binomial")
## Warning in eval(family$initialize) :
##   non-integer #successes in a binomial glm!

summary(logit)
##
## Call:
## glm(formula = probability ~ log10(capacity), family = "binomial")
##
## Deviance Residuals:
##        1         2         3         4         5         6
## -0.23099   0.11888  -0.09852   0.15618  -0.16518   0.08464
##
## Coefficients:
##                 Estimate Std. Error z value Pr(>|z|)
## (Intercept)       -12.42      10.39  -1.195    0.232
## log10(capacity)    15.35      12.76   1.203    0.229
##
## (Dispersion parameter for binomial family taken to be 1)
##
##     Null deviance: 4.29706  on 5  degrees of freedom
## Residual deviance: 0.13603  on 4  degrees of freedom
## AIC: 6.3152
##
## Number of Fisher Scoring iterations: 6

# 오즈비
exp(coef(logit))
##     (Intercept) log10(capacity)
##    4.033060e-06    4.631322e+06


# 로짓 분석
logit2 <- glm(probability ~ log10(capacity), weights = mice, family = "binomial")

summary(logit2)
##
## Call:
## glm(formula = probability ~ log10(capacity), family = "binomial",
##     weights = mice)
##
## Deviance Residuals:
##       1        2        3        4        5        6
## -0.5613   0.2695  -0.3534   0.5266  -0.4628   0.3128
##
## Coefficients:
##                 Estimate Std. Error z value Pr(>|z|)
## (Intercept)      -11.884      3.301  -3.601 0.000317 ***
## log10(capacity)   14.707      4.022   3.656 0.000256 ***
## ---
## Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
##
## (Dispersion parameter for binomial family taken to be 1)
##
##     Null deviance: 35.849  on 5  degrees of freedom
## Residual deviance:  1.102  on 4  degrees of freedom
## AIC: 14.564
##
## Number of Fisher Scoring iterations: 5

# 오즈비
exp(coef(logit2))
##     (Intercept) log10(capacity)
##    6.898844e-06    2.439749e+06