#' Body Composition Phenotype Correlation Matrix
#'
#' This data set is a correlation matrix between eight Body Composition
#' phenotypes. These phenotypes are derived from the version 10.1 release of the
#' International Mouse Phenotyping Consortium (IMPC) Control Phenotype data.
#' Each cell in the matrix represents the correlation between a pair of these phenotypes.
#' Notably, before calculating the correlation coefficients, we performed a regression analysis
#' to eliminate the effect of variation between different phenotyping centers.
#'
#' @docType data
#'
#' @format An object of class 'matrix' with 8 rows and 8 columns, where each cell
#' contains the correlation value between two different phenotypes.
#'
#' @usage data(BC_Pheno_Cor)
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
#' data(BC_Pheno_Cor)
#' str(BC_Pheno_Cor)
#' }
#'
#' @name BC_Pheno_Cor
NULL
