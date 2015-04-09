#This is the file for Penny Ridgdill for the second plot in Project 1 in the 
#Exploratory Data Analysis course in Coursera

#read in the file
household <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE,header=TRUE, sep=";",na.strings="?")

#transform the Date column to a Date object so that we can then subset the dataframe to pull only
#the two dates of interest in February 2007
household <- transform(household,Date=as.Date(household$Date,format="%d/%m/%Y"))
twodaypower <- subset(household,Date=="2007-02-01" | Date=="2007-02-02")

#create a DateTime column which contains both the date and time as a POSIXct object for plotting purposes
twodaypower$DateTime <- as.POSIXct(paste(twodaypower$Date,twodaypower$Time),format="%Y-%m-%d %H:%M:%S")


#plot GAP over DateTime as a lineplot with appropriate axis lables, size, etc.
png(filename="plot2.png",units="px",height=480, width=480)
plot(twodaypower$Global_active_power~twodaypower$DateTime,type="l", ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
