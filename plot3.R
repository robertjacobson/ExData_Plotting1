# If datas doesn't exist, load it into the environment.
if(length(datas) == 0){
  source('downloadDataset.R')
}

friIndex <- match(as.Date('2007-02-02'), datas$Date)
count <- nrow(datas)
plot_colors <- c('grey','red','blue')
max_y <- max(datas$Sub_metering_1, datas$Sub_metering_2, datas$Sub_metering_3)

png(
  file='plot3.png',
  width=480,
  height=480
)

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
axis(1, at=0, lab=c('Thu'))
axis(1, at=friIndex, lab=c('Fri'))
axis(1, at=count, lab=c('Sat'))

# Y Labels
title(ylab='Energy sub metering')
axis(2, las=1, at=10*0:max_y)

# Legend
legend("topright", max_y, c('Sub_meterng_1', 'Sub_metering_2', 'Sub_metering_3'), cex=0.8, col=plot_colors, lwd=2)

# Box
box()

dev.off()