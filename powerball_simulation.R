# powerball simulation

c = 0





m <- replicate(1560, sample(1:69, 5, replace = FALSE))
n <-  replicate(1560, sample(1:69, 5, replace = FALSE))



bot <- function(m,n) { 
  m <- replicate(1560, sample(1:69, 5, replace = FALSE))
  n <-  replicate(1560, sample(1:69, 5, replace = FALSE))
  
  for(i in 1:1560) {
if(length(intersect(m[,i],n[,i])) == 0){
  c = c - 2
} else if(length(intersect(m[,i],n[,i])) == 1) {
  c = c + 2
} else if(length(intersect(m[,i],n[,i])) == 2) {
  c = c + 4
} else if(length(intersect(m[,i],n[,i])) == 3) {
  c = c + 7
} else if(length(intersect(m[,i],n[,i])) == 4) {
  c = c + 100
} else {
  c = c + 1000000
}
}
print(c)}


bam <- replicate(1000, bot(m,n))


hist <- hist(bam, main = "Histogram of Powerball Totals", 
    xlab = "Amount")
text(hist$mids, hist$counts, labels = hist$counts, 
     adj = c(1, -1))



