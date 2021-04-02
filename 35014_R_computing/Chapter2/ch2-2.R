## 2.2. 데이터 저장

## 예제 2-6  R의 기본 패키지에 내장된 데이터 중에는 iris라는 데이터세트가 있다
##           sink() 함수를 이용하여 iris의 기술 통계량을 외부 파일 printa.txt로 저장해 보라
##           단, 기술 통계량을 산출하기 위해서는 summary() 함수를 사용하라

sink('printa.txt')
summary(iris)
sink()

##  Sepal.Length    Sepal.Width     Petal.Length    Petal.Width   
## Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100  
## 1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300  
## Median :5.800   Median :3.000   Median :4.350   Median :1.300  
## Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199  
## 3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800  
## Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
##       Species  
## setosa    :50  
## versicolor:50  
## virginica :50  


## 예제 2-7  [예제 2-3]에서 생성한 객체를 이 디렉터리에 "dat_exam1.csv"라는 파일로 저장하여 보라
##           또한, 해당 경로에 csv 파일이 저장되어 있는지 확인하라

write.csv(dat, 'dat_exam1.csv')


## 예제 2-8  R의 객체 dat를 다음과 같이 dat_exam2.txt라는 텍스트 파일로 저장하고
##           write.csv() 함수를 사용할 경우와 비교하여 어떠한 차이점이 발생하는지 논하여 보라

write.table(dat, 'dat_exam2.txt')

write.table(dat, 'dat_exam3.txt', sep=",")