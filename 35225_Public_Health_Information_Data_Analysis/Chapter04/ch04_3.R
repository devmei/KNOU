# 독립성 검정의 예

# 눈 색, 머리카락 색
eye_hair_color <- matrix(c(1768, 807, 189, 47, 946, 1387, 746, 53, 115, 438, 288, 16),
                         nrow = 3, byrow = T)
dimnames(eye_hair_color) <- list(eye_color = c("Eye A1", "Eye A2", "Eye A3"),
                                 hair_color = c("Hair B1", "Hair B2", "Hair B3", "Hair B4"))

eye_hair_color
##          hair_color
## eye_color Hair B1 Hair B2 Hair B3 Hair B4
##    Eye A1    1768     807     189      47
##    Eye A2     946    1387     746      53
##    Eye A3     115     438     288      16

# 분할표
table_color <- addmargins(eye_hair_color)
table_color
##          hair_color
## eye_color Hair B1 Hair B2 Hair B3 Hair B4  Sum
##    Eye A1    1768     807     189      47 2811
##    Eye A2     946    1387     746      53 3132
##    Eye A3     115     438     288      16  857
##    Sum       2829    2632    1223     116 6800

# 카이제곱검정
chisq.test(eye_hair_color)
##
## 	Pearson's Chi-squared test
##
## data:  eye_hair_color
## X-squared = 1073.5, df = 6, p-value < 2.2e-16

# 관찰도수
chisq.test(eye_hair_color)$observed
##          hair_color
## eye_color Hair B1 Hair B2 Hair B3 Hair B4
##    Eye A1    1768     807     189      47
##    Eye A2     946    1387     746      53
##    Eye A3     115     438     288      16

# 기대도수
chisq.test(eye_hair_color)$expected
##          hair_color
## eye_color   Hair B1   Hair B2  Hair B3  Hair B4
##    Eye A1 1169.4587 1088.0224 505.5666 47.95235
##    Eye A2 1303.0041 1212.2682 563.2994 53.42824
##    Eye A3  356.5372  331.7094 154.1340 14.61941

# 피어슨 잔차
chisq.test(eye_hair_color)$residuals
##          hair_color
## eye_color    Hair B1   Hair B2    Hair B3     Hair B4
##    Eye A1  17.502565 -8.519654 -14.079133 -0.13752858
##    Eye A2  -9.890092  5.018483   7.697865 -0.05858643
##    Eye A3 -12.791799  5.836008  10.782543  0.36107650


# 모자이크 그림(mosaic plot)
mosaicplot(t(eye_hair_color), shade = T, main = "")


# install.packages("DescTools")
library(DescTools)

Lambda(eye_hair_color)
## [1] 0.2076188

# lambda의 95% 신뢰구간
Lambda(eye_hair_color, conf.level = 0.95)
##    lambda    lwr.ci    upr.ci
## 0.2076188 0.1871747 0.2280629

# Lambda(R|C)
Lambda(eye_hair_color, direction = "row")
## [1] 0.2241003

# Lambda(C|R)
Lambda(eye_hair_color, direction = "column")
## [1] 0.1923949