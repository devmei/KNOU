# 실험용 쥐 자료에 대한 분할표 및 비율표

drug_data <- read.table("35225_Public_Health_Information_Data_Analysis/Chapter04/DrugAdministration.txt", header = T, encoding = "UTF-8")
drug_data

attach(drug_data)

# 분할표
# 약물 투여 여부, 생존 여부
drug_administration <- table(medication, survival)

# 생존 여부: 사망, 생존
colnames(drug_administration) <- c("Death", "Survival")
# 약물 투여 여부: 대조군, 처리군
rownames(drug_administration) <- c("Control", "Treatment")

drug_administration
##            survival
## medication  Death Survival
##   Control       1        4
##   Treatment     3        2

table_m <- margin.table(drug_administration, 1)
table_m
## medication
##   Control Treatment
##         5         5

table_s <- margin.table(drug_administration, 2)
table_s
## survival
##    Death Survival
##        4        6

table <- addmargins(drug_administration)
table
##            survival
## medication  Death Survival Sum
##   Control       1        4   5
##   Treatment     3        2   5
##   Sum           4        6  10


# 백분율표
percentage_c <- drug_administration[1,] / table_m[1]
percentage_t <- drug_administration[2,] / table_m[2]

percentage_row <- cbind(percentage_c, percentage_t)
percentage_row
##          percentage_c percentage_t
## Death             0.2          0.6
## Survival          0.8          0.4

percentage_d <- drug_administration[, 1] / table_s[1]
percentage_s <- drug_administration[, 2] / table_s[2]

percentage_col <- cbind(percentage_d, percentage_s)
percentage_col
##           percentage_d percentage_s
## Control           0.25    0.6666667
## Treatment         0.75    0.3333333

total <- drug_administration / sum(drug_administration)
total
##            survival
## medication  Death Survival
##   Control     0.1      0.4
##   Treatment   0.3      0.2