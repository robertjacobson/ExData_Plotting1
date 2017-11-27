# If datas doesn't exist, load it into the environment.
if(length(datas) == 0){
  source("downloadDataset.R")
}


png(
  file="plot1.png",
  width=480,
  height=480
)
hist(
  datas$Global_active_power,
  col=c("red"),
  xlab="Global Active Power (kilowatts)",
  ylab="Frequency",
  main="Global Active Power"
)
dev.off()