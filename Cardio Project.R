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
cardio$cardio
sd(cardio$cardio)

#Seeing how many of our population has the disease and doesn't
table(cardio$cardio)

#Visualizing our population based on gender
library("ggplot2")
ggplot(data=cardio)
ggplot(data = cardio) + geom_point(aes(x = Height, y = Weight, color = Gender)) + ggtitle("Population Distrubition by Gender")


#Visualization of comparing the height and weight of individuals who have or don't have the disease
ggplot(data=cardio)
ggplot(data = cardio) + geom_point(aes(x = Height, y = Weight, color = cardio)) + ggtitle("Cardiovascular disease in Population")

#Visualizing Cardiovascular vs Smoking
cardio$cardio
cardio$cardio*10
cardio$cardio*10+cardio$Smoke
S=cardio$cardio*10+cardio$Smoke
table(S)
barplot(table(S))
barplot(table(S), main = "Smoking Consumption", xlab = "Patients Hospitalized", ylab = "Number of Patients", ylim = c(0,35000), names.arg = c("A", "B", "C", "D"), legend = c("Normal, Non-Smoker", "Normal, Smoker", "Disease, Non-Smoker", "Disease, Smoker"), args.legend = list(title = "Legend", x = "topright", cex = .6), col = c("lightblue", "mistyrose", "lavender", "lightgreen"))

#Visualizing Cardiovascular vs Alcohol
cardio$cardio
cardio$cardio*10
cardio$cardio*10+cardio$Alco
A=cardio$cardio*10+cardio$Alco
table(A)
barplot(table(A), main = "Alcohol", xlab= "Patients Hospitalized", ylab= "Number of Patients", names.arg = c("NN", "DN", "ND", "DD"), ylim = c(0,35000), legend = c("No Drink, No Disease", "Drink, No Disease", "No Drink, Disease", "Drink, Disease"), args.legend = list(title = "Legend", x = "topright", cex = .51), col = c("pink", "lightyellow", "lightblue", "darkblue"))

#Visualizing Cholesterol vs Cardiovascular disease
cardio$cardio
cardio$cardio*10
cardio$cardio*10+cardio$Cholesterol
C=cardio$cardio*10+cardio$Cholesterol
table(C)
barplot(table(C), main = "Cholesterol Levels in Patients", xlab = "Patients Hospitalized", ylab = "Number of Patients", ylim = c(0,30000), names.arg = c("N1","N2","N3","D1","D2","D3"), legend = c("No Disease, Normal Lvls", "No Disease, Above Normal Lvls", "No Disease, Well Above Normal Levels", "Disease, Normal Lvls", "Disease, Above Normal Lvls", "Disease, Well Above Normal Lvls"), args.legend = list(title = "Legend", x = "topright", cex = .4), col = c("indianred", "lightgreen", "lightblue", "red", "green", "blue"))

#Visualizing individuals who have cardiovascular disease and Systolic and Diastolic Blood Pressure 
library("ggplot2")
ggplot(data = cardio) + geom_point(aes(x = Ap_Hi, y = Height, color = cardio))
ggplot(data = cardio) + geom_point(aes(x = Ap_lo, y = Height, color = cardio))

#Comparing Age and those who have the Disease
boxplot(Age~cardio, data = cardio, main = "Age and Cardiovascular disease", ylab = "Age of Patients (days)", xlab = "Cardiovascular Disease", col = (c("lightblue", "blue" )))

#Comparing Age and Cholesterol
boxplot(Age~Cholesterol, data = cardio, main = "Age and Cholesterol", xlab = "Cholesterol Levels of Patients", ylab = "Age of Patients (days)", col = (c("indianred1", "red2", "red4")))

#Visualizing Weight and Cholesterol Levels
ggplot(data = cardio) + geom_point(aes(x = Cholesterol, y = Weight, color = cardio)) + labs(y = "Weight of Patients (kgs)", x = "Cholesterol Levels") + ggtitle("Cardiovascular Disease and Cholesterol Levels")

#Visualizing Gender and Cardiovascular disease
cardio$cardio
cardio$cardio*10 + cardio$Gender
G = cardio$cardio*10 + cardio$Gender
table(G)
barplot(table(G), main = "Cardiovascular Disease in Gender", xlab = "Hospitalized Patients", ylab = "Number of Patients", ylim = c(0,25000), names.arg = c("NF", "NM", "DF", "DM"), legend = c("No Disease, Female", "No Disease, Male", "Disease, Female", "Disease, Male"), args.legend = list(title = "Legend", x = "topright", cex = 0.5), col = c("lightpink","lightskyblue", "hotpink", "royalblue"))


#Cardiovascular and glucose
cardio$cardio
cardio$cardio*10
cardio$cardio*10+cardio$Gluc
G=cardio$cardio*10+cardio$Gluc
table(G)
barplot(table(G), main = "Glucose Levels in Patients", xlab = "Patients Hospitalized", ylab = "Number of Patients", ylim = c(0,35000), names.arg = c("N1","N2","N3","D1","D2","D3"), legend = c("No Disease, Normal Lvls", "No Disease, Above Normal Lvls", "No Disease, Well Above Normal Levels", "Disease, Normal Lvls", "Disease, Above Normal Lvls", "Disease, Well Above Normal Lvls"), args.legend = list(title = "Legend", x = "topright", cex = .4), col = c("indianred", "lightgreen", "lightblue", "red", "green", "blue"))

