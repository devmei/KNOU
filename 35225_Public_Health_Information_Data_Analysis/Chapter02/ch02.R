# 담즙의 과포화 비율 자료에 대한 양적 자료 기술

# 데이터파일 읽기
bile_data <- read.table("35225_Public_Health_Information_Data_Analysis/Chapter02/BileSupersaturationRatio.txt", header = T, encoding = "UTF-8")
bile_data

attach(bile_data)

# 자료를 순서대로 그림으로 나타내기
plot(bile_ratio, type = "p", xlab = "", ylab = "Ratio", main = "Bile Supersaturation Ratio")

par(new = T)
plot(bile_ratio, type = "h", xlab = "", ylab = "Ratio", main = "Bile Supersaturation Ratio")

n <- length(bile_ratio)
n
## [1] 60

sort(bile_ratio)
##  [1]  35  40  47  52  52  55  56  57  58  58  65  65  66  66  67  69  73  73  74  75  76  76  77  78  79  80  80
## [28]  80  82  84  84  86  86  86  87  87  88  88  88  89  90  91  98 106 106 107 110 110 111 112 116 118 120 123
## [55] 123 127 128 137 142 146

sort(bile_ratio, decreasing = T)
##  [1] 146 142 137 128 127 123 123 120 118 116 112 111 110 110 107 106 106  98  91  90  89  88  88  88  87  87  86
## [28]  86  86  84  84  82  80  80  80  79  78  77  76  76  75  74  73  73  69  67  66  66  65  65  58  58  57  56
## [55]  55  52  52  47  40  35

# 수치적 요약(중심경향, 흩어진 정도)
sum(bile_ratio)
## [1] 5185

# 누적 합
cumsum(bile_ratio)
##  [1]   40  126  237  323  429  495  618  708  820  872  960 1097 1185 1265 1330 1409 1496 1552 1662 1768 1878
## [22] 1956 2036 2083 2157 2215 2303 2376 2494 2561 2618 2683 2769 2845 2934 3076 3134 3232 3378 3458 3524 3576
## [43] 3611 3666 3793 3870 3961 4089 4164 4246 4315 4399 4515 4588 4675 4751 4858 4942 5062 5185

# 산술평균과 중앙값
mean(bile_ratio); median(bile_ratio)
## [1] 86.41667
## [1] 84

# 10% 절삭 평균
mean(bile_ratio, trim = 1 / 10)
## [1] 85.4375

# 분산과 표준편차
var(bile_ratio); sd(bile_ratio)
## [1] 657.1624
## [1] 25.63518

# 다섯 숫자 요약(최솟값, 제1사분위수, 중앙값, 제3분위수, 최댓값)
fivenum(bile_ratio)
## [1]  35.0  68.0  84.0 106.5 146.0

quantile(bile_ratio)
##     0%    25%    50%    75%   100%
##  35.00  68.50  84.00 106.25 146.00

# 수치적 측도 요약(다섯 숫자 요약 + 산술평균)
summary(bile_ratio)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
##   35.00   68.50   84.00   86.42  106.25  146.00

# 사분위수간 범위=제3사분위수-제1사분위수
IQR(bile_ratio)
## [1] 37.75

# MAD(Median Absolute Deviation): 각 데이터에서 중앙값을 뺀 후 절댓값을 취한 값들의 중앙값
mad(bile_ratio)
## [1] 26.6868

max(bile_ratio); min(bile_ratio)
## [1] 146
## [1] 35

# 범위 (R에서는 범위를 호출하면 최솟값과 최댓값을 출력)
range(bile_ratio)
## [1]  35 146

Range <- max(bile_ratio) - min(bile_ratio)
Range
## [1] 111


# 담즙의 과포화 비율 자료에 대한 표와 그래프

# 도수분포표(Frequency Table)
bile_class <- cut(bile_ratio, breaks = c(20, 40, 60, 80, 100, 120, 140, 160))
bile_class
##  [1] (20,40]   (80,100]  (100,120] (80,100]  (100,120] (60,80]   (120,140] (80,100]  (100,120] (40,60]
## [11] (80,100]  (120,140] (80,100]  (60,80]   (60,80]   (60,80]   (80,100]  (40,60]   (100,120] (100,120]
## [21] (100,120] (60,80]   (60,80]   (40,60]   (60,80]   (40,60]   (80,100]  (60,80]   (100,120] (60,80]
## [31] (40,60]   (60,80]   (80,100]  (60,80]   (80,100]  (140,160] (40,60]   (80,100]  (140,160] (60,80]
## [41] (60,80]   (40,60]   (20,40]   (40,60]   (120,140] (60,80]   (80,100]  (120,140] (60,80]   (80,100]
## [51] (60,80]   (80,100]  (100,120] (60,80]   (80,100]  (60,80]   (100,120] (80,100]  (100,120] (120,140]
## Levels: (20,40] (40,60] (60,80] (80,100] (100,120] (120,140] (140,160]

table(bile_class)
##   (20,40]   (40,60]   (60,80]  (80,100] (100,120] (120,140] (140,160]
##         2         8        18        15        10         5         2

# 히스토그램(Histogram)
hist(bile_ratio, breaks = c(20, 40, 60, 80, 100, 120, 140, 160), main = "Histogram")
rug(bile_ratio)

# 줄기 잎 그림(Stem and Leaf Plot)
stem(bile_ratio)
##
##   The decimal point is 1 digit(s) to the right of the |
##
##    2 | 5
##    4 | 072256788
##    6 | 556679334566789
##    8 | 000244666778889018
##   10 | 667001268
##   12 | 033787
##   14 | 26

# 줄기의 마디 2배로 늘이기
stem(bile_ratio, scale = 2)
##
##   The decimal point is 1 digit(s) to the right of the |
##
##    3 | 5
##    4 | 07
##    5 | 2256788
##    6 | 556679
##    7 | 334566789
##    8 | 000244666778889
##    9 | 018
##   10 | 667
##   11 | 001268
##   12 | 03378
##   13 | 7
##   14 | 26

# install.packages("vioplot")

# 바이올린 그림 (히스토그램 + 상자 그림 시너지 효과)
library(vioplot)
vioplot(bile_ratio, names = "Ratio")

# Ogive 경험 누적분포함수
plot(sort(bile_ratio), (1:n) / n, type = "s", ylim = c(0, 1),
     main = "Ogive of Bile Supersaturation", xlab = "Ratio", ylab = "ECDF")
rug(bile_ratio)


# 담즙의 과포화 비율 자료에 대한 남녀 간 비교

man <- subset(bile_data, sex == "m")
man

man_bile_ratio <- man$bile_ratio
man_count <- length(man_bile_ratio)
man_count
## [1] 31

woman <- bile_data[which(sex == "f"),]
woman

woman_bile_ratio <- woman$bile_ratio
woman_count <- length(woman_bile_ratio)
woman_count
## [1] 29

mean(man_bile_ratio); sd(man_bile_ratio)
## [1] 84.45161
## [1] 23.95807

mean(woman_bile_ratio); sd(woman_bile_ratio)
## [1] 88.51724
## [1] 27.58444

par(mfrow = c(2, 1))

hist(man_bile_ratio, xlim = c(20, 160), main = "Histogram of man_bile_ratio")
rug(man_bile_ratio)

hist(woman_bile_ratio, xlim = c(20, 160), main = "Histogram of woman_bile_ratio")
rug(woman_bile_ratio)

stem(man_bile_ratio)
##
##   The decimal point is 1 digit(s) to the right of the |
##
##    4 | 07
##    5 | 2678
##    6 | 567
##    7 | 3489
##    8 | 00667888
##    9 | 0
##   10 | 66
##   11 | 00128
##   12 | 3
##   13 | 7

stem(woman_bile_ratio, scale = 2)
##
##   The decimal point is 1 digit(s) to the right of the |
##
##    3 | 5
##    4 |
##    5 | 258
##    6 | 569
##    7 | 35667
##    8 | 0244679
##    9 | 18
##   10 | 7
##   11 | 6
##   12 | 0378
##   13 |
##   14 | 26

vioplot(man_bile_ratio, woman_bile_ratio, names = c("Male", "Female"))

plot(sort(man_bile_ratio), (1:man_count) / man_count, type = "s", xlim = c(30, 150), ylim = c(0, 1),
     main = "Ogive of Bile Supersaturation", xlab = "Ratio", ylab = "ECDF")
plot(sort(woman_bile_ratio), (1:woman_count) / woman_count, type = "s", lty = 2, xlim = c(30, 150), ylim = c(0, 1),
     main = "Ogive of Bile Supersaturation", xlab = "Ratio", ylab = "ECDF")

legend(40, 1.0, c("Male", "Female"), lty = c(1, 2))


blood_type <- c(22, 20, 7, 11)
names(blood_type) <- c("A", "B", "AB", "O")

blood_type
##  A  B AB  O
## 22 20  7 11

prop.table(blood_type)
##         A         B        AB         O
## 0.3666667 0.3333333 0.1166667 0.1833333

barplot(blood_type, col = "cyan", main = "Bar Graph")
barplot(blood_type, horiz = T, col = "cyan", main = "Bar Graph")

pie(blood_type, main = "Pie Graph")

slices <- c("white", "gray25", "gray50", "gray75")
pie(blood_type, col = slices, main = "Pie Graph")