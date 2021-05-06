## 6.1. 범주형 단변수 자료

library(MASS)


## 6.1.1. 기본 막대그림(barplot)
tab <- with(Cars93, table(Type))
barplot(tab, main="Type of Car", xlab="Type", ylab="Number of Car", col=1:6,
        legend=c('Compact', 'Large', 'Midsize', 'Small', 'Sporty', 'Van'),
        names.arg=c('Compact', 'Large', 'Midsize', 'Small', 'Sporty', 'Van'))


## 6.1.2. Side형 막대그림
tab <- with(Cars93, xtabs(~Type+AirBags))
barplot(tab, col=rainbow(6),
        legend=c('Compact', 'Large', 'Midsize', 'Small', 'Sporty', 'Van'),
        xlab="AirBags", ylab="Number of Cars", beside=TRUE)


## 6.1.3. Stacked 막대그림 (1)
barplot(tab, col=rainbow(6),
        legend=c('Compact', 'Large', 'Midsize', 'Small', 'Sporty', 'Van'),
        xlab="AirBags", ylab="Number of Cars", beside=FALSE)


## 6.1.4. Stacked 막대그림 (2)
barplot(tab, col=rainbow(6),
        legend=c('Compact', 'Large', 'Midsize', 'Small', 'Sporty', 'Van'),
        xlim=c(0, ncol(tab) + 2), xlab="AirBags", ylab="Number of Cars",
        args.legend=list(x=ncol(tab) + 2, y=max(colSums(tab)), bty="n"))


## 6.1.5. 파이차트(Pie Chart) (1)
tab <- with(Cars93, table(Type))
pie(tab, col=topo.colors(6))


## 6.1.6. 파이차트 (2)
names(tab) <- c('COMPACT', 'LARGE', 'MIDSIZE', 'SMALL', 'SPORTY', 'VAN')
pie(tab, col=topo.colors(6))