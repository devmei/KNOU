# 호르몬 처리 후 혈액 칼슘 측정치의 이원분산분석

calcium_data <- read.table("35225_Public_Health_Information_Data_Analysis/Chapter03/BloodCalciumData.txt", header = T, encoding = "UTF-8")
calcium_data

attach(calcium_data)

# 이원분산분석
two_way_ANOVA <- aov(calcium ~ sex * treat)
two_way_ANOVA
## Call:
##    aov(formula = calcium ~ sex * treat)
##
## Terms:
##                       sex     treat sex:treat Residuals
## Sum of Squares     4.0627 1146.6420    3.8454   76.2924
## Deg. of Freedom         1         2         2        24
##
## Residual standard error: 1.782933
## Estimated effects may be unbalanced

summary(two_way_ANOVA)
##             Df Sum Sq Mean Sq F value   Pr(>F)
## sex          1    4.1     4.1   1.278    0.269
## treat        2 1146.6   573.3 180.355 3.47e-15 ***
## sex:treat    2    3.8     1.9   0.605    0.554
## Residuals   24   76.3     3.2
## ---
## Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# 다중비교: LSD
pairwise.t.test(calcium, sex)
##
## 	Pairwise comparisons using t tests with pooled SD
##
## data:  calcium and sex
##
##   F
## M 0.76
##
## P value adjustment method: holm

pairwise.t.test(calcium, treat)
##
## 	Pairwise comparisons using t tests with pooled SD
##
## data:  calcium and treat
##
##   A       B
## B 0.052   -
## C 8.4e-16 1.2e-14
##
## P value adjustment method: holm


# 병렬상자그림과 교호작용도(interaction plot)
plot(calcium ~ treat, calcium_data)
with(calcium_data, interaction.plot(treat, sex, calcium))