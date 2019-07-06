#read the data into R, selecting only rows with date values 1/2/2007 and 2/2/2007 using function read.csv.sql
House_Cons <- read.csv.sql(file = "C:/Users/gboye/datasciencecoursera/exp_data/household_power_consumption.txt", 
sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")

#convert class of the Date column from character to date
House_Cons$Date <- as.Date(House_Cons$Date, format = "%d/%m/%Y")

#create a new column by concatenating values the date and time columns
House_Cons$Date_Time <- paste(House_Cons$Date, House_Cons$Time, sep = " ")

#change class of the newly created Date_Time column from character to date format
House_Cons$Date_Time <- strptime(House_Cons$Date_Time, format = "%Y-%m-%d %H:%M:%S")

#make the plot labelling the y axis
with(House_Cons, plot(Date_Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", 
xlab = " "))

#save the plot to a file named plot2
dev.copy(png, "plot2.png")

#turns off the png device.
dev.off()