#' Clinical Chemistry Association Z-score Matrix
#'
#' This data set provides an association Z-score matrix comprising 5342 genes and 19 Clinical Chemistry
#' phenotypes. The data originates from the International Mouse Phenotyping Consortium (IMPC) summary
#' data, specifically from the version 16 release. Each entry in the matrix represents the Z-score of the
#' association between a particular gene and phenotype.
#'
#' @docType data
#'
#' @format An object of class 'matrix' with 5342 rows representing genes and 19 columns representing phenotypes.
#' Each entry contains the Z-score quantifying the strength of the association between a gene and a phenotype.
#'
#' @usage data(CC_Zscore_Mat)
#'
#' @keywords datasets
#'
#' @references
#' Warkentin et al. (2023). KOMPUTE: Imputing summary statistics of missing
#' phenotypes in high-throughput model organism data. bioRxiv.
#' \href{https://www.biorxiv.org/content/10.1101/2023.01.12.523855v1}{Link to article}
#'
#' @examples
#' \dontrun{
#' data(CC_Zscore_Mat)
#' str(CC_Zscore_Mat)
#' }
#'
#' @name CC_Zscore_Mat
NULL
