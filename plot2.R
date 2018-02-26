setwd("/Users/SARATH/Desktop/R Programming")
df <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
df1 <- subset(df, Date %in% c("1/2/2007","2/2/2007"))
df1$Date <- as.Date(df1$Date, format = "%d/%m/%Y")
df1$Datetime <- as.POSIXct(paste(df1$Date, df1$Time))
with(df1, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()