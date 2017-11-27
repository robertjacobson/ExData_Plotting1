# If datas doesn't exist, load it into the environment.
if(length(datas) == 0){
  source("downloadDataset.R")
}

friIndex <- match(as.Date('2007-02-02'), datas$Date)
count <- nrow(datas)

png(
  file="plot2.png",
  width=480,
  height=480
)
plot(
  datas$Global_active_power,
  type="l",
  ann=FALSE,
  axes=FALSE
)

# X Labels
axis(1, at=0, lab=c("Thu"))
axis(1, at=friIndex, lab=c("Fri"))
axis(1, at=count, lab=c("Sat"))

# Y Labels
title(ylab="Global Active Power (kilowatts)")
axis(2, las=1, at=2*0:count)

# Box
box()

dev.off()