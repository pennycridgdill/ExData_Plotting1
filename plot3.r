#This is the file for Penny Ridgdill for the third plot in Project 1 in the 
#Exploratory Data Analysis course in Coursera

#read in the file
household <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE,header=TRUE, sep=";",na.strings="?")

#transform the Date column to a Date object so that we can then subset the dataframe to pull only
#the two dates of interest in February 2007
household <- transform(household,Date=as.Date(household$Date,format="%d/%m/%Y"))
twodaypower <- subset(household,Date=="2007-02-01" | Date=="2007-02-02")

#create a DateTime column which contains both the date and time as a POSIXct object for plotting purposes
twodaypower$DateTime <- as.POSIXct(paste(twodaypower$Date,twodaypower$Time),format="%Y-%m-%d %H:%M:%S")


#plot the various Sub_metering data over DateTime as a lineplot with appropriate axis lables, size, etc.
#note: to keep this on the same plot, you must set new=T in par, so that it knows that this is just new data
#to be plotted on the same plot
#also, not that one needs to set the y-axis scale (and x-axis scale if need be),to accommodate all of the data
#on the same graph...thus the call to find the maximum y-val
maxy=max(max(twodaypower$Sub_metering_1),max(twodaypower$Sub_metering_2),max(twodaypower$Sub_metering_3))
png(filename="plot3.png",units="px",height=480, width=480)
plot(twodaypower$Sub_metering_1~twodaypower$DateTime,type="l", ylab="Energy sub metering",xlab="", 
     col="black",ylim=c(0,maxy))
par(new=T)
plot(twodaypower$Sub_metering_2~twodaypower$DateTime,type="l", ylab="",xlab="", 
     col="red",ylim=c(0,maxy))
par(new=T)
plot(twodaypower$Sub_metering_3~twodaypower$DateTime,type="l", ylab="",xlab="", 
     col="blue",ylim=c(0,maxy))
par(new=F)
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)
dev.off()

