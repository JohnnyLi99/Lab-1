EPI_data <- read.csv("/Users/johnnyli1/Desktop/2010EPI_data.csv")

names(EPI_data) <- as.matrix(EPI_data[1, ])
EPI_data <- EPI_data[-1, ]
EPI_data[] <- lapply(EPI_data, function(x)
  type.convert(as.character(x)))
EPI_data
View(EPI_data)

#AIR_E
attach(EPI_data)
fix(EPI_data)
AIR_E
tf <- is.na(AIR_E)
E <- AIR_E[!tf]

summary(AIR_E) #stats
fivenum(AIR_E,na.rm=TRUE)
stem(AIR_E)
hist(AIR_E)
hist(AIR_E, seq(8., 90., 1.0), prob=TRUE)
lines(density(AIR_E,na.rm=TRUE,bw=1.))
rug(AIR_E)

plot(ecdf(AIR_E), do.points=FALSE, verticals=TRUE)
par(pty="s")
qqline(AIR_E)

x<-seq(8,90,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for AIR_E")
qqline(x)

#DALY
attach(EPI_data)
fix(EPI_data)
DALY
tf <- is.na(DALY)
E <- DALY[!tf]

summary(DALY) #stats
fivenum(DALY,na.rm=TRUE)
stem(DALY)
hist(DALY)
hist(DALY, seq(0., 93., 1.0), prob=TRUE)
lines(density(DALY,na.rm=TRUE,bw=1.))
rug(DALY)

plot(ecdf(DALY), do.points=FALSE, verticals=TRUE)
par(pty="s")
qqline(DALY)

x<-seq(0,93,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for DALY")
qqline(x)

#EPI
attach(EPI_data)
fix(EPI_data)
EPI
tf <- is.na(EPI)
E <- EPI[!tf]

summary(EPI) #stats
fivenum(EPI,na.rm=TRUE)
stem(EPI)
hist(EPI)
hist(EPI, seq(30., 95., 1.0), prob=TRUE)
lines(density(EPI,na.rm=TRUE,bw=1.))
rug(EPI)

plot(ecdf(EPI), do.points=FALSE, verticals=TRUE)
par(pty="s")
qqline(EPI)

x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for tdsn")
qqline(x)

EPILand <- EPI[!Landlock]
Eland <- EPILand[!is.na(EPILand)]
hist(ELand)
hist(ELand, seq(30., 95., 1.0), prob=TRUE)

#for comparison
boxplot(EPI,AIR_E) #boxplot
qqplot(EPI,AIR_E) #qqplot
boxplot(DALY,AIR_E)
qqplot(DALY,AIR_E)
