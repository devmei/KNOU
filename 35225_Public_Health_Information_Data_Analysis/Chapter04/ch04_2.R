# 동질성 검정의 예

# 비타민 효과
vitamin_effect <- matrix(c(31, 109, 17, 122), nrow = 2, byrow = T)

# 비타민 복용 여부: 대조군, 처리군
# 감기 여부: 감기 걸림, 감기 안 걸림
dimnames(vitamin_effect) <- list(taking = c("Control", "Treatment"), cold = c("Catch", "NotCatch"))

vitamin_effect
##            cold
## taking      Catch NotCatch
##   Control      31      109
##   Treatment    17      122

# 분할표
table_v <- addmargins((vitamin_effect))
table_v
##            cold
## taking      Catch NotCatch Sum
##   Control      31      109 140
##   Treatment    17      122 139
##   Sum          48      231 279

# 카이검정
chisq.test(vitamin_effect)
##
## 	Pearson's Chi-squared test with Yates' continuity correction
##
## data:  vitamin_effect
## X-squared = 4.1407, df = 1, p-value = 0.04186

# 관찰도수
chisq.test(vitamin_effect)$observed
##            cold
## taking      Catch NotCatch
##   Control      31      109
##   Treatment    17      122

# 기대도수
chisq.test(vitamin_effect)$expected
##            cold
## taking         Catch NotCatch
##   Control   24.08602  115.914
##   Treatment 23.91398  115.086

# 피어슨 잔차
chisq.test(vitamin_effect)$residuals
##            cold
## taking          Catch   NotCatch
##   Control    1.408787 -0.6421849
##   Treatment -1.413846  0.6444908