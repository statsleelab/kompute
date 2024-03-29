% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/OF_Pheno_Cor.R
\docType{data}
\name{OF_Pheno_Cor}
\alias{OF_Pheno_Cor}
\title{Open Field Phenotype Correlation Matrix}
\format{
An object of class 'matrix' with 14 rows and 14 columns, where each cell
contains the correlation value between two different phenotypes.
}
\usage{
data(OF_Pheno_Cor)
}
\description{
This data set is a correlation matrix between 14 Open Field
phenotypes. These phenotypes are derived from the version 10.1 release of the
International Mouse Phenotyping Consortium (IMPC) Control Phenotype data.
Each cell in the matrix represents the correlation between a pair of these phenotypes.
Notably, before calculating the correlation coefficients, we performed a regression analysis
to eliminate the effect of variation between different phenotyping centers.
}
\examples{
\dontrun{
data(OF_Pheno_Cor)
str(OF_Pheno_Cor)
}

}
\references{
Warkentin et al. (2023). KOMPUTE: Imputing summary statistics of missing
phenotypes in high-throughput model organism data. bioRxiv.
\href{https://www.biorxiv.org/content/10.1101/2023.01.12.523855v1}{Link to article}
}
\keyword{datasets}
