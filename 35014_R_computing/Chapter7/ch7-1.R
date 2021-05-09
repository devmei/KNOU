## 7.1. 두 변수 간의 상관관계를 표현한 그래프

# options("install.lock"=FALSE)
# install.packages("corrr")
# install.packages("Hmisc")


## 7.1.1. 상관도 그림
library(magrittr)

mtcars %>% head
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
## Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

mtcars %>% tan %>% cos %>% sin %>% head %>% round(2)
##                    mpg  cyl  disp    hp drat   wt  qsec   vs   am gear  carb
## Mazda RX4         0.04 0.82  0.83  0.84 0.55 0.74  0.56 0.84 0.01 0.39  0.39
## Mazda RX4 Wag     0.04 0.82  0.83  0.84 0.55 0.82 -0.72 0.84 0.01 0.39  0.39
## Datsun 710        0.48 0.39 -0.70 -0.84 0.61 0.46  0.83 0.01 0.01 0.39  0.01
## Hornet 4 Drive    0.71 0.82  0.79  0.84 0.84 0.84  0.71 0.01 0.84 0.84  0.01
## Hornet Sportabout 0.84 0.76 -0.83  0.23 0.84 0.82 -0.72 0.84 0.84 0.84 -0.54
## Valiant           0.56 0.82 -0.73 -0.59 0.80 0.81  0.21 0.01 0.84 0.84  0.01

library(corrr)

mtcars %>% correlate() %>% fashion()
## Correlation method: 'pearson'
## Missing treated using: 'pairwise.complete.obs'
##
##    term  mpg  cyl disp   hp drat   wt qsec   vs   am gear carb
## 1   mpg      -.85 -.85 -.78  .68 -.87  .42  .66  .60  .48 -.55
## 2   cyl -.85       .90  .83 -.70  .78 -.59 -.81 -.52 -.49  .53
## 3  disp -.85  .90       .79 -.71  .89 -.43 -.71 -.59 -.56  .39
## 4    hp -.78  .83  .79      -.45  .66 -.71 -.72 -.24 -.13  .75
## 5  drat  .68 -.70 -.71 -.45      -.71  .09  .44  .71  .70 -.09
## 6    wt -.87  .78  .89  .66 -.71      -.17 -.55 -.69 -.58  .43
## 7  qsec  .42 -.59 -.43 -.71  .09 -.17       .74 -.23 -.21 -.66
## 8    vs  .66 -.81 -.71 -.72  .44 -.55  .74       .17  .21 -.57
## 9    am  .60 -.52 -.59 -.24  .71 -.69 -.23  .17       .79  .06
## 10 gear  .48 -.49 -.56 -.13  .70 -.58 -.21  .21  .79       .27
## 11 carb -.55  .53  .39  .75 -.09  .43 -.66 -.57  .06  .27     

mtcars %>% correlate() %>% rplot()


## 7.1.2. 상관도 네트워크 그림
mtcars %>% correlate() %>% network_plot(min_cor=.3)


## 7.1.3. 변수 군집 그림(Variable Clustering Plot)
library(Hmisc)
library(MASS)

temp <- Cars93[, c('Price', 'MPG.city', 'Horsepower', 'RPM', 'Length', 'Wheelbase')]
plot(v <- varclus(~ ., data=temp, similarity="spear"))