
#First, an example of calculation of mutual distances using all NK cells.
#In this example, the (x, y) localization information of each NK cell extracted from the 2D image is imported.
Bulk_NK <- read.csv(file = "./Bulk_NK.csv")

#Calculate the distances of NK cells to each other by vector compositing.
#For 3D information, you should calculate with the (x,y,z) value using the cbind function.
#Note that in this calculation, the closest NK cells is specified as the same NK cells, so "displacement2" should be specified as [2].
distance_Bulk_NK <- array(0, c(dim(Bulk_NK)[1]))
for (i in 1:dim(Bulk_NK)[1]){
displacement <- Bulk_NK - cbind(rep(Bulk_NK[i,1],dim(Bulk_NK)[1]), rep(Bulk_NK[i,2], dim(Bulk_NK)[1]))
displacement2 <- sort(sqrt(rowSums(displacement^2)))
distance_Bulk_NK[i] <- displacement2[2] 
}

#To calculate the 6th nearest distance, specify [7] in "displacement2".
distance_Bulk_NK_6th <- array(0, c(dim(Bulk_NK)[1]))
for (i in 1:dim(Bulk_NK)[1]){
  displacement <- Bulk_NK - cbind(rep(Bulk_NK[i,1],dim(Bulk_NK)[1]), rep(Bulk_NK[i,2], dim(Bulk_NK)[1]))
  displacement2 <- sort(sqrt(rowSums(displacement^2)))
  distance_Bulk_NK_6th[i] <- displacement2[7] 
}


#Below is the analysis of the nearest distances of Ki67nega NK cells from Ki67posi NK cells.
#Here, the location information of Ki67posi and Ki67nega NK cells are imported as separate objects.
Ki67posi_NK <- read.csv(file = "./Ki67posi_NK.csv")
Ki67nega_NK <- read.csv(file = "./Ki67nega_NK.csv")

#Calculate the distances using vector compositing.
#Note that in this calculation, Ki67posi NK and Ki67nega NK cells do not overlap, so you should be specify as [1] in "displacement2".
distance_Ki67posi_NK <- array(0, c(dim(Ki67posi_NK)[1]))
for (i in 1:dim(Ki67posi_NK)[1]){
displacement <- Ki67nega_NK - cbind(rep(Ki67posi_NK[i,1],dim(Ki67nega_NK)[1]), rep(Ki67posi_NK[i,2], dim(Ki67nega_NK)[1]))
displacement2 <- sort(sqrt(rowSums(displacement^2)))
distance_Ki67posi_NK[i] <- displacement2[1] 
}
