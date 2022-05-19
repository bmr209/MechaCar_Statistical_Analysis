# Use the library function to load the dplyr package
library(dplyr)

# Import and read in the MechaCar_mpg.csv
MechaCarData <- read.csv(file='MechaCar_mpg.csv', check.names=F, stringsAsFactors=F)

# Perform linear regression using the lm() function
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCarData)
# Use summary() function to determine p-value and r-squared value for linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCarData))

# Import and read in the Suspension_Coil.csv file as a table
SuspensionCoilTable <- read.csv(file='Suspension_Coil.csv', check.names=F, stringsAsFactors=F)

# Create a total_summary dataframe using the summarise() function
total_summary <- SuspensionCoilTable %>% summarise(Mean=mean(PSI), Median=median(PSI), Variance=(sd(PSI))^2, SD=sd(PSI), .groups='keep')
# Create a lot_summary dataframe using the group_by() and summarise() functions
lot_summary <- SuspensionCoilTable %>% group_by(Manufacturing_Lot) %>% summarise(Mean=mean(PSI), Median=median(PSI), Variance=(sd(PSI))^2, SD=sd(PSI), .groups='keep')

# Use t.test() function to determine if the PSI across all manufacturing lots is statistically different from population mean of 1500 PSI
t.test(SuspensionCoilTable$PSI, mu=1500)

# Use subset() function to filter out rows with Lot1 as the Manufacturing Lot
lot1 <- subset(SuspensionCoilTable, Manufacturing_Lot == "Lot1")
# Use t.test() function to determine if the PSI across Lot1 is statistically different from population mean of 1500 PSI
t.test(lot1$PSI, mu=1500)

# Use subset() function to filter out rows with Lot2 as the Manufacturing Lot
lot2 <- subset(SuspensionCoilTable, Manufacturing_Lot == "Lot2")
# Use t.test() function to determine if the PSI across Lot2 is statistically different from population mean of 1500 PSI
t.test(lot2$PSI, mu=1500)

# Use subset() function to filter out rows with Lot3 as the Manufacturing Lot
lot3 <- subset(SuspensionCoilTable, Manufacturing_Lot == "Lot3")
# Use t.test() function to determine if the PSI across Lot3 is statistically different from population mean of 1500 PSI
t.test(lot3$PSI, mu=1500)
