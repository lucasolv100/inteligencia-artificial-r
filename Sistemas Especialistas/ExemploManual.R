#install.packages("expert")
library(expert)

x <- list(
  EXP1 <- list(
    INT <- c(650,800,850)),
  EXP2 <- list(
    INT <- c(500,600,700)),
  EXP3 <- list(
    INT <- c(450,650,800)))

prob <- c(0.1,0.5,0.9)

inf <- expert(x, "weights", prob, w=c(.1,.7,.2))

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