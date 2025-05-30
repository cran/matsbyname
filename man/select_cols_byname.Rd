% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Utilities.R
\name{select_cols_byname}
\alias{select_cols_byname}
\title{Select columns of a matrix (or list of matrices) by name}
\usage{
select_cols_byname(
  a,
  retain_pattern = "$^",
  remove_pattern = "$^",
  ignore.case = FALSE,
  perl = FALSE,
  fixed = FALSE,
  useBytes = FALSE
)
}
\arguments{
\item{a}{a matrix or a list of matrices}

\item{retain_pattern}{an extended regex or list of extended regular expressions that specifies which columns of \code{m} to retain.
Default pattern ("$^") retains nothing.}

\item{remove_pattern}{an extended regex or list of extended regular expressions that specifies which columns of \code{m} to remove.
Default pattern ("$^") removes nothing.}

\item{ignore.case, perl, fixed, useBytes}{Arguments passed to \code{grep()}.}
}
\value{
a matrix that is a subset of \code{a} with columns selected by \code{retain_pattern} and \code{remove_pattern}.
}
\description{
Arguments indicate which columns are to be retained and which are to be removed.
For maximum flexibility, arguments are extended regex patterns
that are matched against column names.
}
\details{
If \code{a} is \code{NULL}, \code{NULL} is returned.

Patterns are compared against column names using extended regex.
If no column names of \code{a} match the \code{retain_pattern}, \code{NULL} is returned.
If no column names of \code{a} match the \code{remove_pattern}, \code{a} is returned.

Retaining columns takes precedence over removing columns, always.

Some typical patterns are:
\itemize{
\item{"^Electricity$|^Oil$": column names that are EXACTLY "Electricity" or "Oil".}
\item{"^Electricity|^Oil": column names that START WITH "Electricity" or "Oil".}
\item{"Electricity|Oil": column names that CONTAIN "Electricity" or "Oil" anywhere within them.}
}

Given a list of column names, a pattern can be constructed easily using
\code{\link[RCLabels:make_or_pattern]{RCLabels::make_or_pattern()}}.
\code{\link[RCLabels:make_or_pattern]{RCLabels::make_or_pattern()}} escapes regex strings using \code{\link[Hmisc:escapeRegex]{Hmisc::escapeRegex()}}.
This function assumes that \code{retain_pattern} and \code{remove_pattern} have already been
suitably escaped.

Note that the default \code{retain_pattern} and \code{remove_pattern} ("$^")
retain nothing and remove nothing.

If the row or column labels contain "[" or "]",
care should be taken to escape those characters.
\code{\link[Hmisc:escapeRegex]{Hmisc::escapeRegex()}} is helpful in such situations.

Note that if all columns are removed from \code{a}, \code{NULL} is returned.
}
\examples{
m <- matrix(1:16, ncol = 4, dimnames=list(c(paste0("i", 1:4)), paste0("p", 1:4))) \%>\%
  setrowtype("Industries") \%>\% setcoltype("Commodities")
select_cols_byname(m, 
                   retain_pattern = RCLabels::make_or_pattern(c("p1", "p4"), 
                   pattern_type = "exact"))
select_cols_byname(m, 
                   remove_pattern = RCLabels::make_or_pattern(c("p1", "p3"), 
                   pattern_type = "exact"))
# Also works for lists and data frames
select_cols_byname(list(m,m), retain_pattern = "^p1$|^p4$")
}
