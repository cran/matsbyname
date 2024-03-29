% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Unary.R
\name{fractionize_byname}
\alias{fractionize_byname}
\title{Compute fractions of matrix entries}
\usage{
fractionize_byname(a, margin, inf_becomes = .Machine$double.xmax)
}
\arguments{
\item{a}{The matrix to be fractionized.}

\item{margin}{If \code{1} (rows), each entry in \code{a} is divided by its row's sum.
If \code{2} (columns), each entry in \code{a} is divided by its column's sum.
If \code{c(1,2)} (both rows and columns),
each entry in \code{a} is divided by the sum of all entries in \code{a}.}

\item{inf_becomes}{A value to be substitute for any \code{Inf} produced by division.
Default is \code{.Machine$double.xmax}.
Another reasonable value is \code{Inf}.
Set to \code{NULL} to disable substitution.
\code{inf_becomes} is passed to \code{hatinv_byname()}.}
}
\value{
A fractionized matrix of same dimensions and same row and column types as \code{a}.
}
\description{
This function divides all entries in \code{a} by the specified sum,
thereby "fractionizing" the matrix.
}
\examples{
M <- matrix(c(1, 5,
              4, 5),
            nrow = 2, ncol = 2, byrow = TRUE, 
            dimnames = list(c("p1", "p2"), c("i1", "i2"))) \%>\% 
            setcoltype("Products") \%>\% setrowtype("Industries")
fractionize_byname(M, margin = c(1,2))
fractionize_byname(M, margin = 1)
fractionize_byname(M, margin = 2)
}
