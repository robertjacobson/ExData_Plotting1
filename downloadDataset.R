library('curl')

# If file doesn't exist, download it, and unzip
datafile <- 'household_power_consumption.txt'
datasource <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
if (!file.exists(datafile)){
  zip <- curl_download(datasource, "dataset.zip")
  unzip(zip)
}

# Read CSV into sql, filter only data we care about, treat ? as NA
datas <- read.csv(
  datafile,
  header=TRUE,
  sep=';',
  na.strings='?'
)

# Format Date and Create Timestamp column
datas <- within(datas, {
  Date=as.Date(
    datas$Date, '%d/%m/%Y'
  )
  Timestamp=format(
    as.Date(strptime(paste(datas$Date, datas$Time), '%d/%m/%Y %H:%M:%S'))
  )
})
datas <- subset(datas, Timestamp >= as.Date("2007-02-01") & Timestamp < as.Date("2007-02-03"))
datas[order(datas$Timestamp),]
