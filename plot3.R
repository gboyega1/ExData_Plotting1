#read the data into R, selecting only rows with date values 1/2/2007 and 2/2/2007 using function read.csv.sql
House_Cons <- read.csv.sql(file = "C:/Users/gboye/datasciencecoursera/exp_data/household_power_consumption.txt", 
                           sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")

#convert class of the Date column from character to date
House_Cons$Date <- as.Date(House_Cons$Date, format = "%d/%m/%Y")

#create a new column by concatenating values the date and time columns
House_Cons$Date_Time <- paste(House_Cons$Date, House_Cons$Time, sep = " ")

#change class of the newly created Date_Time column from character to date format
House_Cons$Date_Time <- strptime(House_Cons$Date_Time, format = "%Y-%m-%d %H:%M:%S")

#1st part plot
with(House_Cons, plot(Date_Time, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = " ", 
                      col = "black", fg = "black"))

#2nd part plot
lines(House_Cons$Date_Time, House_Cons$Sub_metering_2, type = "s", col = "red")

#3rd part plot
lines(House_Cons$Date_Time, House_Cons$Sub_metering_3, type = "S", col = "blue")

#adding legend to the plot
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, 
       col = c("black", "red", "blue"), text.col = "black")

#save the plot to a file named plot3
dev.copy(png, "plot3.png")

#turns off the png device.
dev.off()


