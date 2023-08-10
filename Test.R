#Test
distanceNK <- array(0, c(dim(NK)[1]))
for (i in 1:dim(NK)[1]){
  displacement <- NK1 - cbind(rep(NK[i,1],dim(NK1)[1]), rep(NK[i,2], dim(NK1)[1]))
  displacement2 <- sort(sqrt(rowSums(displacement^2)))
  distanceNK[i] <- displacement2[2]
}