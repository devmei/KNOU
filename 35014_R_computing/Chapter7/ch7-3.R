## 7.3. ggplot2 패키지를 이용한 그림 그리기

library(MASS)


## 7.3.1. Subgroup이 존재하는 경우의 산점도
library(ggplot2)

qplot(Horsepower, Price, data=Cars93, colour=AirBags, size=AirBags)


## 7.3.2. facet을 이용한 영역분할 산점도
Cars93$manual <- with(Cars93, ifelse(Man.trans.avail=='No', 'Manual_Trans_No', 'Manual_Trans_Yes'))
with(Cars93, qplot(Horsepower, Price, data=Cars93, facets=manual~Origin))


## 7.3.3. qplot을 이용한 확률밀도함수 그림
qplot(Fuel.tank.capacity, data=Cars93, geom="density", fill=Origin, alpha=I(.2), main="Fuel tank capacity by Origin",
      xlab="Fuel tank capacity (US gallons)", ylab="Density") + theme(plot.title=element_text(hjust=0.5))


## 7.3.4. 회귀선 추가 산점도 (1)
ggplot(Cars93, aes(x=Horsepower, y=Price)) + geom_point(shape=16) + geom_smooth(method=lm)


## 7.3.5. 회귀선 추가 산점도 (2)
ggplot(Cars93, aes(x=Horsepower, y=Price)) + geom_point(shape=16) + geom_smooth(method=lm, se=FALSE)


## 7.3.6. Smoothing Line 산점도
qplot(Horsepower, Price, data=Cars93, geom=c("point", "smooth"), color=Origin, main="Price vs. Horsepower by Origin",
      xlab="Horsepower", ylab="Price") + theme(plot.title=element_text(hjust=0.5))


## 7.3.7. 연속형 변수가 추가된 산점도 (1)
ggplot(Cars93, aes(x=Horsepower, y=Price, color=Width)) + geom_point(shape=16) +
scale_color_gradient(low="yellow", high="red")


## 7.3.8. 연속형 변수가 추가된 산점도 (2)
ggplot(Cars93, aes(x=Horsepower, y=Price, color=Width)) + geom_point(shape=16) +
scale_color_gradientn(colours=rainbow(5))


## 7.3.9. 명목형 변수가 추가되는 경우의 산점도 (1)
library(RColorBrewer)

ggplot(Cars93, aes(x=Horsepower, y=Price, shape=AirBags, color=AirBags)) + geom_point(size=3) +
scale_shape_manual(values=c(16, 17, 18)) + scale_color_brewer(palette="Dark2")


## 7.3.10. 명목형 변수가 추가되는 경우의 산점도 (2)
ggplot(Cars93, aes(x=Horsepower, y=Price, shape=AirBags, color=AirBags)) + geom_point(size=3) +
scale_shape_manual(values=c(16, 17, 18)) + scale_color_brewer(palette="Dark2") +
geom_smooth(method=lm, se=FALSE)


## 7.3.11. 명목형 변수가 추가되는 경우의 산점도 (3)
ggplot(Cars93, aes(x=Horsepower, y=Price, shape=AirBags, color=AirBags)) + geom_point(size=3) +
scale_shape_manual(values=c(16, 17, 18)) + scale_color_brewer(palette="Dark2") +
geom_smooth(method=lm, se=FALSE, fullrange=TRUE)