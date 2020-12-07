
make_cards <- function(seed){
  set.seed(seed)
  
  m <- matrix(0, nrow=18, ncol=9)
  m[sample(18, 9), 1] <- NA
  for (col in 2:8) {
    cols.remaining <- 9 - col + 1
    i <- which(rowSums(!is.na(m[, 1:(col-1), drop=F])) == 5)
    m[i, col] <- NA
    
    maxed.out <- which(rowSums(is.na(m)) == 4)
    v <- 1:18
    if (length(maxed.out)) v <- v[-c(maxed.out, i)]
    i <- sample(v, 8 - length(i))
    m[i, col] <- NA
  }
  maxed.out <- which(rowSums(is.na(m)) == 4)
  v <- 1:18
  v <- v[-maxed.out]
  m[v, 9] <- NA
  
  i <- which(!is.na(m[, 1]))
  m[i, 1] <- sample(1:9)
  for (col in 2:8){
    i <- which(!is.na(m[, col]))
    lwr <- (col - 1) * 10
    m[i, col] <- sample(lwr:(lwr+9))
  }
  i <- which(!is.na(m[, 9]))
  m[i, 9] <- sample(80:90)
  
  return(m)
}
