% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Binary.R
\name{samestructure_byname}
\alias{samestructure_byname}
\title{Test whether matrices or lists of matrices have same structure}
\usage{
samestructure_byname(..., .summarise = FALSE)
}
\arguments{
\item{...}{Operands to be compared.}

\item{.summarise}{Tells whether the operation should be accomplished
across lists (\code{FALSE}) or down lists (\code{TRUE}).}
}
\value{
\code{TRUE} if all operands have the same structure, \code{FALSE} otherwise.
}
\description{
Matrices are said to have the same structure
if row and column types are identical
and
if row and column names are identical.
Values can be different.
}
\examples{
samestructure_byname(2, 2)
productnames <- c("p1", "p2")
industrynames <- c("i1", "i2")
U <- matrix(1:4, ncol = 2, dimnames = list(productnames, industrynames)) \%>\%
  setrowtype("Products") \%>\% setcoltype("Industries")
samestructure_byname(U, U)
samestructure_byname(U, U \%>\% setrowtype("row"))
samestructure_byname(U \%>\% setcoltype("col"), U)
# Also works with lists
samestructure_byname(list(U, U), list(U, U))
}
