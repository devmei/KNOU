# 적합도 검정

# 폭탄의 수
bombs <- c(0, 1, 2, 3, 4, 5)
# 단위 지역의 수(관찰도수)
observation_frequency <- c(229, 211, 93, 35, 7, 1)

names(observation_frequency) <- bombs
observation_frequency
##   0   1   2   3   4   5
## 229 211  93  35   7   1

probability <- c(dpois(0:4, 1), 1 - sum(dpois(0:4, 1)))
probability
## [1] 0.367879441 0.367879441 0.183939721 0.061313240 0.015328310 0.003659847

chisq.test(observation_frequency, p = probability)
## Warning in chisq.test(observation_frequency, p = probability) :
##   Chi-squared approximation may be incorrect
##
## 	Chi-squared test for given probabilities
##
## data:  observation_frequency
## X-squared = 3.9309, df = 5, p-value = 0.5594