# 카이제곱 검정과 McNemar 검정

# 호지킨병 - 잘못된 자료
hodgkin_wrong <- matrix(c(41, 44, 33, 52), nrow = 2, byrow = T)

# 그룹: 사례군, 대조군
# 편도 적출 여부: 편도 적출, 편도 비적출
dimnames(hodgkin_wrong) <- list(group = c("Case", "Control"), tonsillectomy = c("Yes", "No"))

hodgkin_wrong
##          tonsillectomy
## group     Yes No
##   Case     41 44
##   Control  33 52

# 분할표
table_hodgkin <- addmargins(hodgkin_wrong)
table_hodgkin
##          tonsillectomy
## group     Yes No Sum
##   Case     41 44  85
##   Control  33 52  85
##   Sum      74 96 170

# 카이검정
chisq.test(hodgkin_wrong, correct = F)
##
## 	Pearson's Chi-squared test
##
## data:  hodgkin_wrong
## X-squared = 1.5315, df = 1, p-value = 0.2159

# 카이검정 - 연속성 수정
chisq.test(hodgkin_wrong)
##
## 	Pearson's Chi-squared test with Yates' continuity correction
##
## data:  hodgkin_wrong
## X-squared = 1.1726, df = 1, p-value = 0.2789

# 올바른 통계적 절차: 카이제곱검정
hodgkin <- matrix(c(26, 15, 7, 37), nrow = 2, byrow = T)

# 그룹: 사례군, 대조군 / 편도 적출 여부: 편도 적출, 편도 비적출
dimnames(hodgkin) <- list(group = c("Case", "Control"), tonsillectomy = c("Yes", "No"))

hodgkin
##          tonsillectomy
## group     Yes No
##   Case     26 15
##   Control   7 37

# 분할표
table_hodgkin <- addmargins(hodgkin)
table_hodgkin
##          tonsillectomy
## group     Yes No Sum
##   Case     26 15  41
##   Control   7 37  44
##   Sum      33 52  85

# McNemar 검정
mcnemar.test(hodgkin, correct = F)
##
## 	McNemar's Chi-squared test
##
## data:  hodgkin
## McNemar's chi-squared = 2.9091, df = 1, p-value = 0.08808

# McNemar 검정 - 연속성 수정
mcnemar.test(hodgkin)
##
## 	McNemar's Chi-squared test with continuity correction
##
## data:  hodgkin
## McNemar's chi-squared = 2.2273, df = 1, p-value = 0.1356

# 정확 McNemar 검정
library(exact2x2)

exact2x2(hodgkin, paired = T)
##
## 	Exact McNemar test (with central confidence intervals)
##
## data:  hodgkin
## b = 15, c = 7, p-value = 0.1338
## alternative hypothesis: true odds ratio is not equal to 1
## 95 percent confidence interval:
##  0.8224084 6.2125863
## sample estimates:
## odds ratio
##   2.142857