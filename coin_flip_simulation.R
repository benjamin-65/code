
#Simulation of coin flips 


library(ggplot2)
library(tinytex)


coin_flip_sim <- function(x,y) {
  r_10 <- rbinom(10, x, y)
  rf_10 <- sum(r_10) / 10
  r_50 <- c(r_10, rbinom(40, x, y))
  rf_50 <- sum(r_50) / 50
  r_100 <- c(r_50, rbinom(50, x, y))
  rf_100 <- sum(r_100) / 100
  r_200 <- c(r_100, rbinom(100, x, y))
  rf_200 <- sum(r_200) / 200
  r_500 <- c(r_200, rbinom(300, x, y))
  rf_500 <- sum(r_500) / 500
  dat <- data.frame(flips <- c(10, 50, 100, 200, 500), 
                    rel_freq <- c(rf_10, rf_50, rf_100, rf_200, rf_500))
  
  return(ggplot(data = dat, aes(x = as.character(flips), y = rel_freq)) + geom_bar(stat = "identity") +
           scale_x_discrete(limits = c("10", "50", "100", "200", "500")) +
           geom_text(aes(label = rel_freq), vjust = 2, color = "white") +
           ggtitle("Simulation of the Relative Frequency of Getting Heads") +
           xlab("Number of Flips") + ylab("Relative Frequency"))
}

coin_flip_sim(1, .5)


