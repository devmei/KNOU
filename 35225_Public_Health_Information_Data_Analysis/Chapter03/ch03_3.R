# 혈청 항원의 농도 면역 이상에 대한 일원 분산분석

# 자폐아
child_a <- c(755, 365, 820, 900, 170, 300, 325, 385, 380, 215, 400,
             343, 415, 345, 410, 460, 225, 440, 400, 360, 435, 450, 360)
# 정상아
child_n <- c(165, 390, 290, 435, 235, 345, 320, 330, 205, 375, 345, 305,
             220, 270, 355, 360, 335, 305, 325, 245, 285, 370, 345, 345,
             230, 370, 285, 315, 195, 270, 305, 375, 220)
# 지진아
child_d <- c(380, 510, 315, 565, 715, 380, 390, 245, 155, 335, 295, 200,
             105, 105, 245)

boxplot(child_a, child_n, child_d, col = "yellow", names = c("Autism", "Normal", "Dunce"))

library(vioplot)
vioplot(child_a, child_n, child_d, col = "yellow", names = c("Autism", "Normal", "Dunce"))

sapply(list(child_a, child_n, child_d), mean)
## [1] 419.9130 305.0000 329.3333

sapply(list(child_a, child_n, child_d), var)
## [1] 31693.356  4071.875 29224.524

concentration <- c(child_a, child_n, child_d)
concentration
##  [1] 755 365 820 900 170 300 325 385 380 215 400 343 415 345 410 460 225 440 400 360 435 450 360 165 390 290 435
## [28] 235 345 320 330 205 375 345 305 220 270 355 360 335 305 325 245 285 370 345 345 230 370 285 315 195 270 305
## [55] 375 220 380 510 315 565 715 380 390 245 155 335 295 200 105 105 245

group <- factor(rep(1:3, c(23, 33, 15)))
group
##  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
## [55] 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
## Levels: 1 2 3

# 등분산성검정
fligner.test(concentration ~ group)
##
## 	Fligner-Killeen test of homogeneity of variances
##
## data:  concentration by group
## Fligner-Killeen:med chi-squared = 6.8506, df = 2, p-value = 0.03254

# 일원분산분석
one_way_ANOVA <- aov(concentration ~ group)
one_way_ANOVA
## Call:
##    aov(formula = concentration ~ group)
##
## Terms:
##                     group Residuals
## Sum of Squares   185159.3 1236697.2
## Deg. of Freedom         2        68
##
## Residual standard error: 134.8582
## Estimated effects may be unbalanced

par(mfrow = c(2, 2))
plot(one_way_ANOVA)

plot.design(concentration ~ group)


# 다중비교(Multiple Comparison): Tukey's HSD(Honest Significant Differences)
hsd <- TukeyHSD(one_way_ANOVA)
hsd
##   Tukey multiple comparisons of means
##     95% family-wise confidence level
##
## Fit: aov(formula = concentration ~ group)
##
## $group
##           diff        lwr       upr     p adj
## 2-1 -114.91304 -202.68435 -27.14174 0.0070326
## 3-1  -90.57971 -197.82092  16.66150 0.1142305
## 3-2   24.33333  -76.28971 124.95638 0.8315432

plot(hsd)

# 다중비교: LSD
pairwise.t.test(concentration, group)
##
## 	Pairwise comparisons using t tests with pooled SD
##
## data:  concentration and group
##
##   1      2
## 2 0.0076 -
## 3 0.0938 0.5642
##
## P value adjustment method: holm