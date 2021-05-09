## 7.7. 네트워크 그림

# options("install.lock"=FALSE)
# install.packages("maptools")


## 7.7.1. 네트워크 그림 (1)
library(igraph)

split.screen(figs=c(1, 2))

screen(1)
g1 <- graph(edges=c(1, 2, 2, 3, 3, 1), n=3, directed=F)
plot(g1)

screen(2)
g2 <- graph(edges=c(1, 2, 2, 3, 3, 1), n=3, directed=T)
plot(g2)


## 7.7.2. 네트워크 그림 (2)
split.screen(figs=c(1, 2))

screen(1)
g1 <- graph(edges=c(1, 2, 2, 3, 3, 1, 1, 3), n=3)
plot(g1, edge.arrow.size=0.5)

screen(2)
g2 <- graph(edges=c(1, 2, 2, 3, 3, 1), n=7)
plot(g2, edge.arrow.size=0.5)


## 7.7.3. 네트워크 그림 (3)
g3 <- graph(c("Seoul", "Busan", "Busan", "Gwangju", "Gwangju", "Seoul"))
plot(g3)


## 7.7.4. 네트워크 그림 (4)
g4 <- graph(c("Seoul", "Busan", "Busan", "Gwangju", "Gwangju", "Seoul", "Seoul", "Daegu", "Seoul", "Daejeon"),
            isolates=c("Sejong", "Ulsan"))
plot(g4, edge.arrow.size=1.5, vertex.color="gold", vertex.size=15,
     vertex.frame.color="gray", vertex.label.color="black",
     vertex.label.cex=1.2, vertex.label.dist=2, edge.curved=0.2)


## 7.7.5. 네트워크 그림 (5)
g4 <- graph(c("Seoul", "Busan", "Busan", "Gwangju", "Gwangju", "Seoul", "Seoul", "Daegu", "Seoul", "Daejeon"),
            isolates=c("Sejong", "Ulsan"))
E(g4)
## [1] Seoul  ->Busan   Busan  ->Gwangju Gwangju->Seoul   Seoul  ->Daegu
## [5] Seoul  ->Daejeon

V(g4)$name
## [1] "Seoul"   "Busan"   "Gwangju" "Daegu"   "Daejeon" "Sejong"  "Ulsan"

V(g4)$Type <- c("Special", "Metropolitan", "Metropolitan", "Metropolitan", "Metropolitan",
                "Multi-functional Administrative", "Metropolitan")
V(g4)$Pop <- c(9.7, 3.4, 5.5, 2.4, 1.5, 4.27, 2.1)
V(g4)$Type
## [1] "Special"                         "Metropolitan"
## [3] "Metropolitan"                    "Metropolitan"
## [5] "Metropolitan"                    "Multi-functional Administrative"
## [7] "Metropolitan"

E(g4)$traffic_volume <- c(2.8, 4.5, 8.7, 5.64, 4.9)
E(g4)$traffic <- c('train', 'plane', 'train', 'highway', 'highway')
E(g4)$ttype <- c('business', 'business', 'business', 'travel', 'travel')

# 색지정: 서울(pink), 광역시(skyblue), 세종시(peru)
plot(g4, edge.arrow.size=1.5, vertex.label.color="black", vertex.label.dist=2,
     vertex.color=c("pink", rep("skyblue", 4), "peru", "skyblue"), edge.curved=0.2)


## 7.7.6. 네트워크 그림 (6)
plot(g4, edge.arrow.size=1.5,
     vertex.label.color="black", vertex.label.dist=2,
     vertex.color=c("pink", rep("skyblue", 4), "peru", "skyblue"),
     edge.curved=c(0.1, 0.9, 0.3, 0.4, 0.1))


## 7.7.7. 네트워크 그림 (7)
plot(g4, edge.arrow.size=1.5, vertex.size=30, vertex.frame.color="gray",
     vertex.label.color="black", vertex.label.cex=1.2, vertex.label.dist=3.5,
     edge.curved=0.2, vertex.color=c("pink", rep("skyblue", 4), "peru", "skyblue"))


## 7.7.8. 네트워크 그림 (8)
E(g4)$width <- E(g4)$traffic_volume / 2
plot(g4, edge.arrow.size=1, vertex.size=V(g4)$Pop * 4, vertex.frame.color="gray",
     vertex.label.color="black", vertex.label.cex=1.2, vertex.label.dist=3.5,
     edge.curved=0.2, vertex.color=c("pink", rep("skyblue", 4), "peru", "skyblue"))


## 7.7.9. 네트워크 그림 (9)
# 교통수단 색시정, 기차: 1(black), 비행기: 2(maroon), 고속도로: 3(blue)
te <- c('train', 'plane', 'train', 'highway', 'highway')
line.col <- ifelse(te == 'train', 1, ifelse(te == 'plane', 2, 3))
colrs <- c("black", "maroon", "blue")
plot(g4, edge.color=colrs[line.col], vertex.size=V(g4)$Pop * 4, vertex.frame.color="gray",
     vertex.label.color="black", vertex.label.cex=1.2, vertex.label.dist=3.5,
     edge.curved=0.2, vertex.color=c("pink", rep("skyblue", 4), "peru", "skyblue"))


## 7.7.10. 네트워크 그림 (10)
line.curve <- c(0.1, 0.9, 0.3, 0.4, 0.1)
mycolrs <- c("gold", rep("tomato", 4), "lightpink", "tomato")
plot(g4, edge.color=colrs[line.col], vertex.size=V(g4)$Pop * 6, vertex.frame.color="gray",
     vertex.label.color="black", vertex.label.cex=1.2, edge.curved=line.curve, vertex.color=mycolrs)
legend('topleft', c("Special", "Metropolitan", "Metropolitan Autonomous"), pch=21,
       pt.bg=c("gold", "tomato", "lightpink"), pt.cex=2, bty="n", ncol=1)
legend(x=-1.5, y=-1.5, c('train', 'plane', 'highway'), lty=1, lwd=2, col=colrs, bty="n", ncol=3)