## 6.3. 연속형 단변수와 범주형 단변수 자료의 표현

library(MASS)

# options("install.lock"=FALSE)
# install.packages("yarrr")
# install.packages("gridExtra")


## 6.3.1. 상자그림(Box Plot) (1)
boxplot(Min.Price~AirBags, data=Cars93)

boxplot(Min.Price~AirBags, data=Cars93)[]
## $stats
##       [,1]  [,2]  [,3]
## [1,] 13.40  7.80  6.70
## [2,] 15.75 13.15  7.90
## [3,] 22.10 16.30 10.45
## [4,] 33.85 22.50 14.70
## [5,] 43.80 34.60 22.90

summary(subset(Cars93, AirBags == 'Driver only')$Min.Price)
##   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   7.80   13.15   16.30   18.71   22.50   45.40 


## 6.3.2. 상자그림 (2)
boxplot(Min.Price~AirBags, data=Cars93, names=c("Driver & Passenger", "Driver only", "None"),
        col=c("orange", "cyan", "yellow"), ylab="Minimum Price", xlab="Airbag",
        ylim=c(0, 50), boxwex=0.25)


## 6.3.3. 상자그림 (3)
boxplot(Min.Price~AirBags, at=c(3, 2, 1), data=Cars93,
        names=c("Driver & Passenger", "Driver only", "None"), col=c("orange", "cyan", "yellow"),
        ylab="Minimum Price", xlab="Airbag", ylim=c(0, 50), boxwex=0.25)


## 6.3.4. 상자그림 (4)
library(ggplot2)

qplot(AirBags, Min.Price, data=Cars93, geom=c("boxplot", "jitter"), fill=AirBags,
      ylab="Minimum Price", xlab="Airbags", alpha=I(.2))


## 6.3.5. 상자그림 (5)
p <- ggplot(Cars93, aes(x=AirBags, y=Min.Price)) + 
     geom_boxplot(aes(fill=AirBags)) + scale_fill_viridis_d()
p


## 6.3.6. 상자그림 (6)
p + theme(legend.position="none") + xlab("Airbags") + ylab("Minimum Price")


## 6.3.7. Pirate 그림 (1)
library(yarrr)

pirateplot(formula=Price~AirBags, point.o=0.1, data=Cars93, main="Price by AirBag type", inf.method='iqr')


## 6.3.8. Pirate 그림 (2)
pirateplot(formula=MPG.city~Origin+DriveTrain, point.o=0.5, data=Cars93,
           main="City MPG by Origin and Drive Train", inf.method='iqr')


## 6.3.9. 그룹별 확률밀도함수 그림 (1)
ggplot(Cars93, aes(x=MPG.highway)) + geom_density(aes(group=Type, colour=Type)) +
labs(x="MPG.highway", y="Density") + ggtitle("Density of MPG in Highway by Type") + theme(plot.title=element_text(hjust=0.5))


## 6.3.10. 그룹별 확률밀도함수 그림 (2)
ggplot(Cars93, aes(x=MPG.highway)) + theme_bw() + geom_density(aes(group=Type, colour=Type)) +
labs(x="MPG.highway", y="Density") + ggtitle("Density of MPG in Highway by Type") + theme(plot.title=element_text(hjust=0.5))


## 6.3.11. 여러 가지 확률밀도함수 그림을 동시에 배열하기 (1)
p1 <- ggplot(Cars93, aes(x=MPG.highway)) + theme_bw() + geom_density(aes(group=Type, colour=Type)) +
      labs(x="MPG.highway", y="Density") + ggtitle("Density of MPG in Highway by Type") + theme(plot.title=element_text(hjust=0.5))
p2 <- ggplot(Cars93, aes(x=MPG.highway)) + theme_bw() + geom_density(aes(group=Origin, colour=Origin)) +
      labs(x="MPG.highway", y="Density") + ggtitle("Density of MPG in Highway by Origin") + theme(plot.title=element_text(hjust=0.5))

library(gridExtra)

grid.arrange(p1, p2, ncol=2)


## 6.3.12. 여러 가지 확률밀도함수 그림을 동시에 배열하기 (2)
p1 <- ggplot(Cars93, aes(x=MPG.highway)) + theme_bw() + geom_density(aes(group=Type, colour=Type)) +
      labs(x=expression("MPG"^highway), y=expression("Density"[value])) + ggtitle("Density of MPG in Highway by Type") +
      theme(plot.title=element_text(hjust=0.5)) + coord_cartesian(xlim=c(25, 40))  # zoom in for specific range
p2 <- ggplot(Cars93, aes(x=MPG.highway)) + theme_bw() + geom_density(aes(group=Origin, colour=Origin)) +
      labs(x=expression("MPG"^highway), y=expression("Density"[value])) + ggtitle("Density of MPG in Highway by Origin") +
      theme(plot.title=element_text(hjust=0.5))
p3 <- ggplot(Cars93, aes(x=MPG.highway)) + theme_bw() + geom_density(aes(group=Man.trans.avail, colour=Man.trans.avail)) +
      labs(x=expression("MPG"^highway), y=expression("Density"[value])) +
      ggtitle("Density of MPG in Highway \n by Manual Transmission Availability") + theme(plot.title=element_text(hjust=0.5))
p4 <- ggplot(Cars93, aes(x=MPG.highway)) + theme_bw() + geom_density(aes(group=AirBags, colour=AirBags)) +
      labs(x=expression("MPG"^highway), y=expression("Density"[value])) +
      ggtitle(expression(paste("Density of MPG(",mu,")")^highway)) + theme(plot.title=element_text(hjust=0.5))

grid.arrange(p1, p2, p3, p4, ncol=2, nrow=2)


## 6.3.13. 호흡곡선(Spinogram) (1)
library(vcd)

spine(Improved~Age, data=Arthritis, breaks=3)


## 6.3.14. 호흡곡선 (2)
with(Arthritis, spine(Improved~Age, breaks=quantile(Age)))


## 6.3.15. 호흡곡선 (3)
spine(Improved~Age, data=Arthritis, breaks='Scott')


## 6.3.16. 조건부 밀도함수 그림(Conditional Density Plot) (1)
cdplot(Improved~Age, data=Arthritis)


## 6.3.16. 조건부 밀도함수 그림 (2)
cdplot(Improved~Age, data=Arthritis)
with(Arthritis, rug(jitter(Age), col='white', quiet=TRUE))