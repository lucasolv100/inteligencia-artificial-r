install.packages("expert")
library(expert)

x <- list(
  EXP1 <- list(
    SEM1 <- c(75,80,85),
    SEM2 <- c(10,15,20),
    INT <- c(650,800,850)),
  EXP2 <- list(
    SEM1 <- c(80,90,95),
    SEM2 <- c(25,30,35),
    INT <- c(500,600,700)),
  EXP3 <- list(
    SEM1 <- c(65,70,80),
    SEM2 <- c(20,25,30),
    INT <- c(450,650,800)))

prob <- c(0.1,0.5,0.9)

semverd <- c(80,25)

inf <- expert(x, "cooke", prob, semverd)

inf
hist(inf, col="blue")

par(bg="white")
split.screen(c(2,2))
screen(1)
hist(inf, col="gray", main="distribuição agregada")
screen(2)
s = density(c(650,800,850))
plot(s,main="Especialista 1")
polygon(s,col="blue")
screen(3)
s = density(c(500,600,700))
plot(s,main="Especialista 2")
polygon(s,col="blue")
screen(4)
s = density(c(450,650,800))
plot(s,main="Especialista 3")
polygon(s,col="blue")
close.screen(all = TRUE)

summary(inf)

quantile(inf)

mean(inf) #média

dc = cdf(inf)
plot(dc)