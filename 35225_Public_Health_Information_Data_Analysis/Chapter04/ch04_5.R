# McNemar 검정

# 선거 유세 효과
# 유세 이전, 유세 이후: 여당, 야당
campaign_effect <- matrix(c(63, 4, 21, 12), 2, 2, byrow = T,
                          dimnames = list(before_campaign = c("Ruling", "Opposition"),
                                          after_campaign = c("Ruling", "Opposition")))
campaign_effect
##                after_campaign
## before_campaign Ruling Opposition
##      Ruling         63          4
##      Opposition     21         12

# McNemar 검정
mcnemar.test(campaign_effect, correct = F)
##
## 	McNemar's Chi-squared test
##
## data:  campaign_effect
## McNemar's chi-squared = 11.56, df = 1, p-value = 0.0006739

# McNemar 검정 - 연속성 수정
mcnemar.test(campaign_effect)
##
## 	McNemar's Chi-squared test with continuity correction
##
## data:  campaign_effect
## McNemar's chi-squared = 10.24, df = 1, p-value = 0.001374

# 정확 McNemar 검정
# install.packages("exact2x2")
library(exact2x2)

exact2x2(campaign_effect, paired = T)
##
## 	Exact McNemar test (with central confidence intervals)
##
## data:  campaign_effect
## b = 4, c = 21, p-value = 0.0009105
## alternative hypothesis: true odds ratio is not equal to 1
## 95 percent confidence interval:
##  0.04753664 0.56452522
## sample estimates:
## odds ratio
##  0.1904762