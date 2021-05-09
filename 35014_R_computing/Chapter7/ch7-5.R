## 7.5. 고밀도 자료에 대한 그림

# options("install.lock"=FALSE)
# install.packages("SwissAir")
# install.packages("hexbin")
# install.packages("IDPmisc")


## 7.5.1. 상자그림 고밀도 산점도 (1)
library(ggplot2)

summary(diamonds)
##     carat               cut        color        clarity          depth      
## Min.   :0.2000   Fair     : 1610   D: 6775   SI1    :13065   Min.   :43.00  
## 1st Qu.:0.4000   Good     : 4906   E: 9797   VS2    :12258   1st Qu.:61.00
## Median :0.7000   Very Good:12082   F: 9542   SI2    : 9194   Median :61.80  
## Mean   :0.7979   Premium  :13791   G:11292   VS1    : 8171   Mean   :61.75
## 3rd Qu.:1.0400   Ideal    :21551   H: 8304   VVS2   : 5066   3rd Qu.:62.50  
## Max.   :5.0100                     I: 5422   VVS1   : 3655   Max.   :79.00
##                                    J: 2808   (Other): 2531
##     table           price             x                y
## Min.   :43.00   Min.   :  326   Min.   : 0.000   Min.   : 0.000  
## 1st Qu.:56.00   1st Qu.:  950   1st Qu.: 4.710   1st Qu.: 4.720
## Median :57.00   Median : 2401   Median : 5.700   Median : 5.710  
## Mean   :57.46   Mean   : 3933   Mean   : 5.731   Mean   : 5.735
## 3rd Qu.:59.00   3rd Qu.: 5324   3rd Qu.: 6.540   3rd Qu.: 6.540  
## Max.   :95.00   Max.   :18823   Max.   :10.740   Max.   :58.900
##
##       z
## Min.   : 0.000
## 1st Qu.: 2.910
## Median : 3.530
## Mean   : 3.539  
## 3rd Qu.: 4.040
## Max.   :31.800

head(diamonds)
## # A tibble: 6 x 10
##   carat cut       color clarity depth table price     x     y     z
##   <dbl> <ord>     <ord> <ord>   <dbl> <dbl> <int> <dbl> <dbl> <dbl>
## 1 0.23  Ideal     E     SI2      61.5    55   326  3.95  3.98  2.43
## 2 0.21  Premium   E     SI1      59.8    61   326  3.89  3.84  2.31
## 3 0.23  Good      E     VS1      56.9    65   327  4.05  4.07  2.31
## 4 0.290 Premium   I     VS2      62.4    58   334  4.2   4.23  2.63
## 5 0.31  Good      J     SI2      63.3    58   335  4.34  4.35  2.75
## 6 0.24  Very Good J     VVS2     62.8    57   336  3.94  3.96  2.48

ggplot(diamonds, aes(carat, price)) + stat_bin2d(bins=25, colour="grey50")


## 7.5.2. 상자그림 고밀도 산점도 (2)
ggplot(diamonds, aes(carat, price)) + stat_bin2d(bins=40, colour="grey50") +
scale_x_continuous(limits=c(0, 6))


## 7.5.3. 상자그림 고밀도 산점도 (3)
ggplot(diamonds, aes(carat, price)) + stat_bin2d(bins=40, colour="grey50") +
scale_x_continuous(limits=c(0, 6)) +
ggtitle("Price vs. Carat") + theme(plot.title=element_text(hjust=0.5)) +
scale_fill_gradientn(colours=c('yellow', 'green', 'blue', 'red')) + labs(x="Carat", y="Price")


## 7.5.4. 고밀도 자료에 대한 일반 산점도
library(SwissAir)

dim(AirQual)
## [1] 17568    22

head(AirQual)
##              start ad.O3 ad.NOx ad.NO ad.WS ad.WD ad.T  ad.Td sz.O3 sz.NOx
## 1 01.01.2004 00:00   1.0   19.7   6.3  0.46    46  0.1 -0.941   1.2   21.5
## 2 01.01.2004 00:30   1.1   21.9   9.0  0.10   179 -0.5 -1.172   1.4   27.5
## 3 01.01.2004 01:00   1.2   21.2   9.2  0.50   159 -0.7 -1.357   1.8   25.7
## 4 01.01.2004 01:30   1.2   20.4   8.4  1.70   158 -0.5 -1.844   1.4   23.7
## 5 01.01.2004 02:00   4.4   11.9   1.6  3.47   166 -0.1 -2.879   1.6   18.5
## 6 01.01.2004 02:30   4.7   12.3   1.5  2.45   140 -0.2 -2.927   1.9   17.8
##   sz.NO sz.WS sz.WD sz.T  sz.Td lu.O3 lu.NOx lu.NO lu.WS lu.WD lu.T  lu.Td
## 1   6.3  0.11    63  0.9 -1.158  16.4    7.2   0.7  2.42     5  0.2 -1.752
## 2  12.8  0.20   278  0.6 -1.453  16.3    6.6   0.4  2.40   352  0.2 -1.894
## 3  12.2  0.08    88  0.5 -1.536  16.1    6.7   0.6  1.84     2  0.0 -1.887
## 4   9.6  0.12    11  0.6 -1.692  15.9    7.0   0.6  1.49    19 -0.1 -2.076
## 5   4.7  0.53   279  0.3 -1.827  15.8    7.3   0.6  1.70   356  0.0 -2.106
## 6   4.4  0.17   333  0.1 -1.960  15.3    7.7   0.8  1.97   333  0.0 -2.137

with(AirQual, plot(ad.WS~ad.O3, xlab='O3', ylab='WS'))


## 7.5.5. Smoothed density 방법을 이용한 산점도
with(AirQual, smoothScatter(ad.WS~ad.O3, main='Scatter plot by smoothed densities', xlab='O3', ylab='WS'))


## 7.5.6. 고밀도 자료에 대한 육면 상자그림(Hexagonal Binning Plot) (1)
library(hexbin)

with(AirQual, plot(hexbin(ad.O3, ad.WS, xbins=100),
     main='Hexagonal binning(bins=100)', xlab='O3', ylab='WS'))


## 7.5.7. 고밀도 자료에 대한 육면 상자그림 (2)
with(AirQual, plot(hexbin(ad.O3, ad.WS, xbins=30),
     main='Hexagonal binning(bins=30)', xlab='O3', ylab='WS'))


## 7.5.8. 이미지 산점도(Image Scatter Plot)
library(IDPmisc)

with(AirQual, iplot(ad.O3, ad.WS, xlab='O3', ylab='WS',
     main='Image Scatter Plot with \n Color Indicating Density'))


## 7.5.9. 다변수 고밀도 자료에 대한 이미지 산점도
ipairs(subset(AirQual, select=c(ad.O3, ad.WS, ad.WD)))