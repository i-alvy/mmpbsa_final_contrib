#mmpbsa_residue_sorting

#here you have to read the dat file
res <-read.table("final_contrib.dat") 
res

#for loop is needed to find out most negative values according to MM energy and Total energy
prominentres <- c()
for (row in 1:nrow(res)) {
  res[res$V2<0 & res$V8<0,] -> sortedres
  sortedres[order(sortedres$V8, decreasing = F),] -> orderedres
  prominentres = cbind(orderedres$V1, orderedres$V2, orderedres$V4, orderedres$V6, orderedres$V8)
  colnames(prominentres) <- c('Residue', 'MMenergy', 'Polar', 'Apolar', 'Totalenergy')
  data.frame(prominentres) -> Finalizedres

}

#finally you can save the sorted list as a csv file
write.csv(Finalizedres,"sorted.csv", row.names = T)
