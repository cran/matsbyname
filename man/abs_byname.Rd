% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Unary.R
\name{abs_byname}
\alias{abs_byname}
\title{Absolute value of matrix elements}
\usage{
abs_byname(a)
}
\arguments{
\item{a}{A matrix or list of matrices.}
}
\value{
\code{a} with each element replaced by its absolute value.
}
\description{
Absolute value of matrix elements
}
\examples{
abs_byname(1)
abs_byname(-1)
m <- matrix(c(-10,1,1,100), nrow = 2, dimnames = list(paste0("i", 1:2), paste0("c", 1:2))) \%>\%
  setrowtype("Industry") \%>\% setcoltype("Commodity")
m
abs_byname(m)
}
