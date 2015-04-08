#This is the file for Penny Ridgdill for plotting the first graph
#in Project 1 for the Exploratory Data Analysis course in Coursera


#read in the data from the table
household <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE,header=TRUE, sep=";",na.strings="?")

#transform the date column
household <- transform(household,Date=as.Date(household$Date,format="%d/%m/%Y"))

#We are only concerned with two days in February, so we subset the dataframe to create a new dataframe
#with which to work
twodaypower <- subset(household,Date=="2007-02-01" | Date=="2007-02-02")


#plot the desired histogram to a png file, with the appropriate dimensions
png(filename="plot1.png",units="px",height=480, width=480)
hist(twodaypower$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power", col="red")
dev.off()


