
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
    if (length(maxed.out) || length(i)) v <- v[-c(maxed.out, i)]
    i <- if (length(v) > 8 - length(i)) sample(v, 8 - length(i)) else v
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

validate_card <- function(m){
  stopifnot(identical(dim(m), c(18L, 9L)))
  stopifnot(all(rowSums(is.na(m)) == 4))
  for (col in 1:9){
    values <- setdiff(m[, col], NA)
    upr <- col * 10 - 1
    lwr <- upr - 9
    if (col == 9) upr <- upr + 1
    if (!all(values %in% lwr:upr)) {
      stop('Values out of range for column ', col, '\nValues: ', paste(sort(values), collapse=', '))
    }
  }
}
