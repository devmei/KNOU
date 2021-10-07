# 의보장구 사용 숙지 시간의 이원분산분석

time_data <- read.table("35225_Public_Health_Information_Data_Analysis/Chapter03/AssistingDevicesTimes.txt", header = T, encoding = "UTF-8")
time_data

attach(time_data)

# 이원분산분석
two_way_ANOVA <- aov(time ~ age + way)
two_way_ANOVA
## Call:
##    aov(formula = time ~ age + way)
##
## Terms:
##                       age       way Residuals
## Sum of Squares  24.933333 18.533333  3.466667
## Deg. of Freedom         4         2         8
##
## Residual standard error: 0.6582806
## Estimated effects may be unbalanced

summary(two_way_ANOVA)
##             Df Sum Sq Mean Sq F value   Pr(>F)
## age          4 24.933   6.233   14.38 0.001002 **
## way          2 18.533   9.267   21.39 0.000617 ***
## Residuals    8  3.467   0.433
## ---
## Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# 모형적합성 검토 = 오차 검토
par(mfrow = c(2, 2))
plot(two_way_ANOVA)

# 다중비교: LSD
pairwise.t.test(time, age)
##
## 	Pairwise comparisons using t tests with pooled SD
##
## data:  time and age
##
##       20   20-29 30-39 40-49
## 20-29 1.00 -     -     -
## 30-39 1.00 1.00  -     -
## 40-49 1.00 1.00  1.00  -
## 50    0.13 0.18  0.66  0.91
##
## P value adjustment method: holm

pairwise.t.test(time, way)
##
## 	Pairwise comparisons using t tests with pooled SD
##
## data:  time and way
##
##   A     B
## B 0.549 -
## C 0.061 0.125
##
## P value adjustment method: holm


# average response profile plot(평균 반응 프로파일 그림) - 효과 크기를 알 수 있는 그림
# install.packages("ggplot2")
library(ggplot2)

ggplot(time_data, aes(x = age, y = time, group = way, linetype = way)) +
  geom_line() +
  theme(legend.position = "top", legend.direction = "horizontal")

ggplot(time_data, aes(x = way, y = time, group = age, linetype = age)) +
  geom_line() +
  theme(legend.position = "top", legend.direction = "horizontal")