#Load Data onto R
getwd()
setwd("/Users/emilyroman/Desktop/ANS198")
list.files()

#Read Data
cardio = read.csv("cardio_train.csv")

#Overall structure of our data
str(cardio)

#Statistical summaries of our data
summary(cardio)

#Extract single column for statistical data
cardio$Height
sd(cardio$Height)
cardio$Weight
sd(cardio$Weight)
cardio$Ap_Hi
sd(cardio$Ap_Hi)
cardio$Ap_lo
sd(cardio$Ap_lo)

#Checking for NA's 
is.na(cardio$Height)
is.na(cardio$Weight)
is.na(cardio$Ap_Hi)
is.na(cardio$Ap_lo)

#Visualization of comparing the height and weight of individuals who have or don't have the disease
install.packages("ggplot2")
library("ggplot2")
ggplot(data=cardio)
ggplot(data = cardio) + geom_point(aes(x = Height, y = Weight, color = cardio))

#Visualizing Cardiovascular vs Smoking
cardio$cardio
cardio$cardio*10
cardio$cardio*10+cardio$Smoke
S=cardio$cardio*10+cardio$Smoke
table(S)
barplot(table(S))
barplot(table(S), main = "Smoking Consumption", xlab = "Patients Hospitalized", ylab = "Number of Patients", ylim = c(0,35000), names.arg = c("A", "B", "C", "D"), legend = c("Normal, Non-Smoker", "Normal, Smoker", "Disease, Non-Smoker", "Disease, Smoker"), args.legend = list(title = "Legend", x = "topright", cex = .6), col = c("lightblue", "mistyrose", "lavender", "lightgreen"))

#Visualizing Cholesterol vs Cardiovascular disease
cardio$cardio
cardio$cardio*10
cardio$cardio*10+cardio$Cholesterol
C=cardio$cardio*10+cardio$Cholesterol
table(C)
barplot(table(C), main = "Cholesterol Levels in Patients", xlab = "Patients Hospitalized", ylab = "Number of Patients", ylim = c(0,30000), names.arg = c("N1","N2","N3","D1","D2","D3"), legend = c("No Disease, Normal Lvls", "No Disease, Above Normal Lvls", "No Disease, Well Above Normal Levels", "Disease, Normal Lvls", "Disease, Above Normal Lvls", "Disease, Well Above Normal Lvls"), args.legend = list(title = "Legend", x = "topright", cex = .53), col = c("indianred", "lightgreen", "lightblue", "red", "green", "blue"))

#Visualizing Cholesterol levels in Males and Females

