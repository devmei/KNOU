# 담즙의 과포화 비율 자료에 대한 양적 자료 기술

# 데이터파일 읽기
bile_data <- read.table("35225_Public_Health_Information_Data_Analysis/Chapter02/BileSupersaturationRatio.txt", header = T, encoding = "UTF-8")
bile_data

attach(bile_data)

# 자료를 순서대로 그림으로 나타내기
# plot(bile_data, type = "p", xlab = "", ylab = "Ratio", main = "Bile Supersaturation Ratio")
plot(x = bile_data$Index, y = bile_data$Ratio, type = "p", xlab = "", ylab = "Ratio", main = "Bile Supersaturation Ratio")

par(new = T)
# plot(bile_data, type = "h", xlab = "", ylab = "Ratio", main = "Bile Supersaturation Ratio")
plot(x = bile_data$Index, y = bile_data$Ratio, type = "h", xlab = "", ylab = "Ratio", main = "Bile Supersaturation Ratio")
