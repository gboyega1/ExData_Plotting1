#read the data into R, selecting only rows with date values 1/2/2007 and 2/2/2007 using function read.csv.sql
House_Cons <- read.csv.sql(file = "C:/Users/gboye/datasciencecoursera/exp_data/household_power_consumption.txt", 
                          sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")

#set the plot window
par(mfrow = c(1,1))

#make the plot, labelling the x-axis and naming the plot
hist(House_Cons$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
col = "red")

#save the plot to file named plot1
dev.copy(png, "plot1.png")

#turns off the png device.
dev.off()

