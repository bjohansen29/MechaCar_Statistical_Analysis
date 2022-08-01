library(dplyr)
MechaCar <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
head(MechaCar)
#MechaCarmpg df
lm(formula = MechaCar$mpg ~ MechaCar$vehicle_length + MechaCar$vehicle_weight + MechaCar$spoiler_angle +
     MechaCar$ground_clearance + MechaCar$AWD, data=MechaCar) #linear reg.
summary(lm(formula = MechaCar$mpg ~ MechaCar$vehicle_length + MechaCar$vehicle_weight + MechaCar$spoiler_angle +
             MechaCar$ground_clearance + MechaCar$AWD, data=MechaCar)) #linear reg.
        
#MechaCarsuscoildf
suscoil <- read.csv(file='Suspension_Coil.csv')

head(suscoil)

#summary df of suscoil
total_summary <- suscoil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'drop')
total_summary

#lot summary of suscoil
lot_summary <- suscoil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
lot_summary

#Ttest PSI for 1500 mean
t.test(suscoil$PSI, mu=1500)

#test PSI for each individual lot
t.test(subset(suscoil$PSI, suscoil$Manufacturing_Lot == "Lot1"), mu=1500)
t.test(subset(suscoil$PSI, suscoil$Manufacturing_Lot == "Lot2"), mu=1500)
t.test(subset(suscoil$PSI, suscoil$Manufacturing_Lot == "Lot3"), mu=1500)