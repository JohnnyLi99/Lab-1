EPI_data <- read.csv("/Users/johnnyli1/Desktop/2010EPI_data.csv")

names(EPI_data) <- as.matrix(EPI_data[1, ])
EPI_data <- EPI_data[-1, ]
EPI_data[] <- lapply(EPI_data, function(x)
  type.convert(as.character(x)))
EPI_data
View(EPI_data)

attach(EPI_data)
fix(EPI_data)
EPI

library(dplyr)
EPI_h <- filter(EPI,Landlock>0)
EPILand<-EPI_h[!Landlock]
Eland <- EPILand[!is.na(EPILand)]
hist(ELand)
hist(ELand, seq(30., 95., 1.0), prob=TRUE)