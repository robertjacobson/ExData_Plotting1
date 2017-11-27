# If datas doesn't exist, load it into the environment.
if(length(datas) == 0){
  source('downloadDataset.R')
}

png(
  file='plot4.png',
  width=480,
  height=480
)

# Setup Grid
par(mfrow=c(2,2))
#Shared Vars
friIndex <- match(as.Date('2007-02-02'), datas$Date)
count <- nrow(datas)
dateXAxis <- function() {
  axis(1, at=0, lab=c("Thu"))
  axis(1, at=friIndex, lab=c("Fri"))
  axis(1, at=count, lab=c("Sat"))
}


#### Plot 1
plot(
  datas$Global_active_power,
  type="l",
  ann=FALSE,
  axes=FALSE
)

# X Labels/Axis
title(ylab="Global Active Power (kilowatts)")
dateXAxis()
axis(2)

box()


#### Plot 2
max_y <- max(datas$Voltage)
plot(
  datas$Voltage,
  type='l',
  ann=FALSE,
  axes=FALSE
)

# Labels/Axis
title(ylab='Voltage', xlab='datetime')
dateXAxis()
axis(2)
box()


#### Plot 3
plot_colors <- c('grey','red','blue')
max_y <- max(datas$Sub_metering_1, datas$Sub_metering_2, datas$Sub_metering_3)

# Lines
plot(
  datas$Sub_metering_1,
  type='l',
  ann=FALSE,
  axes=FALSE,
  col=plot_colors[1]
)
lines(
  datas$Sub_metering_2,
  type='l',
  ann=FALSE,
  col=plot_colors[2]
)
lines(
  datas$Sub_metering_3,
  type='l',
  ann=FALSE,
  col=plot_colors[3]
)

# X Labels
dateXAxis()

# Labels/Axis
title(ylab='Energy sub metering')
axis(2)
legend("topright",
  max_y, c('Sub_meterng_1', 'Sub_metering_2', 'Sub_metering_3'),
  cex=0.8,
  col=plot_colors,
  lwd=2,
  bty="n"
)

box()


#### Plot 4
max_y <- max(datas$Global_reactive_power)
plot(
  datas$Global_reactive_power,
  type='l',
  ann=FALSE,
  axes=FALSE
)

# Labels/Axis
title(ylab='Global_reactive_power', xlab='datetime')
dateXAxis()
axis(2)

box()

dev.off()