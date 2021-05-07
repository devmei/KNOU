## 6.5. 다변수 자료의 요약

# options("install.lock"=FALSE)
# install.packages("treemap")
# install.packages("gplots")


## 6.5.1. vcd 패키지를 활용한 모자이크 그림(Mosaic Plot) (1)
library(vcd)

summary(Arthritis)
##       ID          Treatment      Sex          Age          Improved
## Min.   : 1.00   Placebo:43   Female:59   Min.   :23.00   None  :42
## 1st Qu.:21.75   Treated:41   Male  :25   1st Qu.:46.00   Some  :14
## Median :42.50                            Median :57.00   Marked:28  
## Mean   :42.50                            Mean   :53.36
## 3rd Qu.:63.25                            3rd Qu.:63.00
## Max.   :84.00                            Max.   :74.00

art <- xtabs(~Treatment+Improved, data=Arthritis, subset=Sex=="Female")
art
##          Improved
## Treatment None Some Marked
##   Placebo   19    7      6
##   Treated    6    5     16

mosaic(art, gp=shading_max)


## 6.5.2. vcd 패키지를 활용한 모자이크 그림 (2)
mosaic(~Sex+Age+Survived, data=Titanic, main="Survival on the Titanic", shade=TRUE, legend=TRUE)


## 6.5.3. 다중 산점도
library(MASS)

dat1 <- subset(Cars93, select=c(Min.Price, Price, Max.Price, MPG.city, MPG.highway))
pairs(dat1)


## 6.5.4. 단순 산점도 (1)
with(Cars93, plot(Price, MPG.city, xlab='Price', ylab='MPG in City', main='Mileage'))


## 6.5.5. 단순 산점도 (2)
with(Cars93, plot(Price, MPG.city, xlab='Price', ylab='MPG in City', type='n'))
with(subset(Cars93, DriveTrain=='Front'), points(Price, MPG.city, col='orange', pch=19))
with(subset(Cars93, DriveTrain=='Rear'), points(Price, MPG.city, col='firebrick',pch=17))
with(subset(Cars93, DriveTrain=='4WD'), points(Price, MPG.city, col='black', pch=8))
legend("topright", legend=c('Front', 'Rear', '4WD'), col=c('orange', 'firebrick', 'black'), pch=c(19, 17, 8), bty='n')


## 6.5.6. 단순 산점도에 회귀선 추가하기
fit1 <- with(subset(Cars93, DriveTrain=='Front'), lm(MPG.city~Price))
fit2 <- with(subset(Cars93, DriveTrain=='Rear'), lm(MPG.city~Price))
fit3 <- with(subset(Cars93, DriveTrain=='4WD'), lm(MPG.city~Price))

xx1 <- subset(Cars93, DriveTrain=='Front')$Price
yy1 <- fit1$coef[1] + fit1$coef[2] * xx1

xx2 <- subset(Cars93, DriveTrain=='Rear')$Price
yy2 <- fit2$coef[1] + fit2$coef[2] * xx2

xx3 <- subset(Cars93, DriveTrain=='4WD')$Price
yy3 <- fit3$coef[1] + fit3$coef[2] * xx3

with(Cars93, plot(Price, MPG.city, xlab='Price', ylab='MPG in City', type='n'))
with(subset(Cars93, DriveTrain=='Front'), points(Price, MPG.city, col='orange', pch=19))
with(subset(Cars93, DriveTrain=='Rear'), points(Price, MPG.city, col='firebrick',pch=17))
with(subset(Cars93, DriveTrain=='4WD'), points(Price, MPG.city, col='black', pch=8))
legend("topright", legend=c('Front', 'Rear', '4WD'), col=c('orange', 'firebrick', 'black'), pch=c(19, 17, 8), bty='n')

lines(xx1, yy1, col='orange', lwd=2)
lines(xx2, yy2, col='firebrick', lwd=2)
lines(xx3, yy3, col='black', lwd=2)


## 6.5.7. 여러 개의 그림을 동시에 표현하기
par(mfrow=c(2, 2))

with(subset(Cars93, DriveTrain=='Front'), plot(Price, MPG.city, col='orange', pch=19, main='Front'))
with(subset(Cars93, DriveTrain=='Rear'), plot(Price, MPG.city, col='firebrick',pch=17, main='Rear'))
with(subset(Cars93, DriveTrain=='4WD'), plot(Price, MPG.city, col='black', pch=8, main='4WD'))


## 6.5.8. 그룹별 산점도
library(ggplot2)

qplot(Wheelbase, Width, data=Cars93, shape=Type, color=Type, facets=Origin~AirBags, size=I(2), xlab="Wheelbase", ylab="Car Width")


## 6.5.9. 나무지도 그림(Treemap) (1)
library(treemap)

data(GNI2014)
head(GNI2014)
##   iso3          country     continent population    GNI
## 3  BMU          Bermuda North America      67837 106140
## 4  NOR           Norway        Europe    4676305 103630
## 5  QAT            Qatar          Asia     833285  92200
## 6  CHE      Switzerland        Europe    7604467  88120
## 7  MAC Macao SAR, China          Asia     559846  76270
## 8  LUX       Luxembourg        Europe     491775  75990

treemap(GNI2014, index=c("continent", "iso3"), vSize="population", vColor="GNI", type="value")


## 6.5.10. 나무지도 그림 (2)
treemap(Cars93, index=c("Manufacturer", "Make"), vSize="Price", vColor="AirBags", type="categorical")


## 6.5.11. 풍선그림(Ballon Plot) (1)
library(gplots)

dt <- with(Cars93, xtabs(~AirBags+Type))
balloonplot(dt, main="Airbags by Car type", xlab="", ylab="", label=FALSE, show.margins=FALSE)


## 6.5.12. 풍선그림 (2)
balloonplot(dt, main="Airbags by Car type", xlab="", ylab="", label=TRUE, show.margins=TRUE)


## 6.5.13. graphics 패키지를 활용한 두 변수 모자이크 그림
library(graphics)

mosaicplot(dt, color=TRUE, las=1, main="Airbags by Car type")


## 6.5.14. graphics 패키지를 활용한 다변수 모자이크 그림
mosaicplot(~DriveTrain+AirBags+Origin, las=1, main="Drive Train by Airbags and Origin", ylab='Airbag type', xlab='Drive Train', data=Cars93, color=TRUE)
with(Cars93, xtabs(~DriveTrain+AirBags+Origin))
## , , Origin = USA
##
##           AirBags
## DriveTrain Driver & Passenger Driver only None
##      4WD                    0           3    2
##      Front                  6          15   13
##      Rear                   3           5    1
##
## , , Origin = non-USA
##
##           AirBags
## DriveTrain Driver & Passenger Driver only None
##      4WD                    0           2    3
##      Front                  5          13   15
##      Rear                   2           5    0