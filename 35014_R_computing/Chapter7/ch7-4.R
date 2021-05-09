## 7.4. 레이더 차트

# options("install.lock"=FALSE)
# install.packages("doBy")
# install.packages("fmsb")

library(doBy)
library(MASS)

mean_by_Type2 <- summaryBy(MPG.highway+RPM+Horsepower+Weight+Length+Price~Type, data=Cars93, FUN=c(mean))
mean_by_Type2
##      Type MPG.highway.mean RPM.mean Horsepower.mean Weight.mean Length.mean
## 1 Compact         29.87500 5362.500        131.0000    2918.125    182.1250
## 2   Large         26.72727 4672.727        179.4545    3695.455    204.8182
## 3 Midsize         26.72727 5336.364        173.0909    3400.000    192.5455
## 4   Small         35.47619 5633.333         91.0000    2312.857    167.1905
## 5  Sporty         28.78571 5392.857        160.1429    2899.643    175.2143
## 6     Van         21.88889 4744.444        149.4444    3830.556    185.6667
##   Price.mean
## 1   18.21250
## 2   24.30000
## 3   27.21818
## 4   10.16667
## 5   19.39286
## 6   19.10000

df2 <- mean_by_Type2[, c(2:7)]
df_radarchart <- function(df) {
    df <- data.frame(df)
    dfmax <- apply(df, 2, max)
    dfmin <- apply(df, 2, min)
    as.data.frame(rbind(dfmax, dfmin, df))
}
mean_by_Type <- df_radarchart(df2)
row.names(mean_by_Type) <- c('max', 'min', names(table(Cars93$Type)))
mean_by_Type
##         MPG.highway.mean RPM.mean Horsepower.mean Weight.mean Length.mean
## max             35.47619 5633.333        179.4545    3830.556    204.8182
## min             21.88889 4672.727         91.0000    2312.857    167.1905
## Compact         29.87500 5362.500        131.0000    2918.125    182.1250
## Large           26.72727 4672.727        179.4545    3695.455    204.8182
## Midsize         26.72727 5336.364        173.0909    3400.000    192.5455
## Small           35.47619 5633.333         91.0000    2312.857    167.1905
## Sporty          28.78571 5392.857        160.1429    2899.643    175.2143
## Van             21.88889 4744.444        149.4444    3830.556    185.6667
##         Price.mean
## max       27.21818
## min       10.16667
## Compact   18.21250
## Large     24.30000
## Midsize   27.21818
## Small     10.16667
## Sporty    19.39286
## Van       19.10000


## 7.4.1. 육각 레이더 차트
library(fmsb)

radarchart(df=mean_by_Type,  # The data frame to be used to draw radarchart
           seg=6,            # The number of segments for each axis
           pty=16,           # A vector to specify point symbol: Default 16(closed circle)
           pcol=1:6,         # A vector of color codes for plot data
           plty=1,           # A vector of line types for plot data
           plwd=2,           # A vector of line widths for plot data
           title=c("Radar chart by Car Types")  # putting title at the top-middle
)
legend("topleft", legend=mean_by_Type$Type, col=c(1:6), lty=1, lwd=2)


## 7.4.2. 오각 레이더 차트
dat <- Cars93[2:6, c('Price', 'Horsepower', 'Turn.circle', 'Rear.seat.room', 'Luggage.room')]
datmax <- apply(dat, 2, max)
datmin <- apply(dat, 2, min)
dat <- rbind(datmax, datmin, dat)
radarchart(dat, seg=5, plty=1,
           vlabels=c('Price', 'Horsepower', 'U-turn space\n(feet)', 'Rear seat room\n(inches)', 'Luggage capacity\n(cubic feet)'),
           title="5 segments, with specified vlabels", vlcex=0.8, pcol=rainbow(5))
legend("topleft", legend=Cars93[2:6, 'Make'], col=rainbow(5), lty=1, lwd=1)