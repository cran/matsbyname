% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Utilities.R
\name{ncol_byname}
\alias{ncol_byname}
\title{Get the number of columns in a "byname" matrix.}
\usage{
ncol_byname(a)
}
\arguments{
\item{a}{A matrix or a column of a data frame populated with "byname" matrices.}
}
\value{
The number of columns of the matrix, or a list containing the number of columns
in each of the matrices contained in the column of a data frame.
}
\description{
The function gets the number of columns in a "byname" matrix, or for each "byname" matrix contained
in a column of a data frame.
}
\examples{
productnames <- c("p1", "p2")
industrynames <- c("i1", "i2")
U <- matrix(1:4, ncol = 2, dimnames = list(productnames, industrynames)) \%>\% 
  setrowtype("Products") \%>\% 
  setcoltype("Industries")
productnames <- c("p1", "p2")
industrynames <- c("i1", "i2", "i3")
U2 <- matrix(1:3, ncol = length(industrynames), 
             nrow = length(productnames), dimnames = list(productnames, industrynames)) \%>\% 
  setrowtype("Products") \%>\% 
  setcoltype("Industries")
productnames <- c("p1", "p2", "p3")
industrynames <- c("i1", "i2", "i3", "i4")
U3 <- matrix(1:4, ncol = length(industrynames), 
             nrow = length(productnames), dimnames = list(productnames, industrynames)) \%>\% 
  setrowtype("Products") \%>\% 
  setcoltype("Industries")
dfUs <- data.frame(
  year = numeric(),
  matrix_byname = I(list())
)
  dfUs <- data.frame(
year = numeric(),
matrix_byname = I(list())
)
dfUs[[1, "matrix_byname"]] <- U
dfUs[[2, "matrix_byname"]] <- U2
dfUs[[3, "matrix_byname"]] <- U3
dfUs[[1, "year"]] <- 2000
dfUs[[2, "year"]] <- 2001
dfUs[[3, "year"]] <- 2002
number_cols <- ncol_byname(dfUs$matrix_byname) \%>\% 
print()
}
