#' Imputation of association Z-scores of missing phenotypes
#'
#' This fuction estimates association Z-scores of unmeasured phenotypes.
#' @param zmat The matrix of Z-scores, row: number of phenotypes, col: number of genes
#' @param pheno.cor The phenotype correlation matrix
#' @param ridge The ridge panelty
#' @export

kompute <- function(zmat, pheno.cor, ridge=0.001){
  # error handling
  stopifnot(is.matrix(zmat), is.matrix(pheno.cor), is.numeric(ridge))
  message("\nKOMPute running...")
  npheno <- nrow(zmat)
  ngene <- ncol(zmat)
  infomat <- matrix(NA,nrow=npheno,ncol=ngene)
  num.imputed <- 0

  for (q in c(1:ngene)) {
    #q <- 15
    z.gene = as.data.frame(zmat[,q])
    colnames(z.gene)=c("zscore")
    z.gene$index = seq.int(nrow(z.gene))
    z.gene$info <- 1

    # reorder phenotypes in order to corresponding to conditional expectation formula
    z.gene = z.gene[order(z.gene$zscore, na.last = F), ]

    # number of measured zscores
    num.unmeasured = sum(is.na(z.gene$zscore))
    num.measured = npheno - num.unmeasured

    if(num.unmeasured>0 & num.unmeasured<npheno){
      # reorder phenotypic matrix according to gene10 phnotype order
      cor_ordered = as.data.frame(pheno.cor[z.gene$index, z.gene$index])
      sigma11 = as.matrix(cor_ordered[1:num.unmeasured,1:num.unmeasured])
      sigma12 = as.matrix(cor_ordered[1:num.unmeasured, (num.unmeasured+1):npheno])
      sigma21 = as.matrix(cor_ordered[(num.unmeasured+1):npheno, 1:num.unmeasured])
      sigma22 = as.matrix(cor_ordered[(num.unmeasured+1):npheno,(num.unmeasured+1):npheno])
      z2 = as.matrix(z.gene[(num.unmeasured+1):npheno,1,drop=FALSE]) # z2: measured Z-scores
      # z1: imputed Z-scores
      z1 = sigma12%*%solve(sigma22+diag(num.measured)*ridge)%*%z2 # Z1: unmeasured Z-scores
      # imputation information
      info = 1 - diag(sigma11 - sigma12%*%solve(sigma22+diag(num.measured)*ridge)%*%sigma21)

      z.gene$zscore[1:num.unmeasured] <- z1
      z.gene$info[1:num.unmeasured] <- info
      z.gene <- z.gene[order(z.gene$index),]

      zmat[,q] <- z.gene$zscore
      infomat[,q] <- z.gene$info
    } else if(num.unmeasured==npheno){
      infomat[,q] <- NA
    }

    num.imputed <- num.imputed + num.unmeasured
    #message(q)
  }

  #infomat <- pmax(infomat,0) #convert negative info values to zero
  #infomat <- pmin(infomat,1) #convert info>1 to 1

  message("# of genes: ", ngene)
  message("# of phenotypes: ", npheno)
  message("# of imputed Z-scores: ", num.imputed)
  return(list(zmat=zmat, infomat=infomat))
}
