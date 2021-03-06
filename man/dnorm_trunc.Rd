% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/densities.R
\name{dnorm_trunc}
\alias{dnorm_trunc}
\title{Truncated multivariate normal density function}
\usage{
dnorm_trunc(x, m, V_inv, d, p_trunc, chisq_val)
}
\arguments{
\item{x}{A vector of size \code{p}.}

\item{m}{The mean vector of size \code{p}.}

\item{V_inv}{The inverse of the covariance matrix of size \code{d * d}.}

\item{d}{The number of components.}

\item{p_trunc}{\code{1-p_trunc} is the degree of truncation (i.e. \code{p_trunc=1} is no truncation).}

\item{chisq_val}{The value in the corresponding chi-square distribution; if the normal quadratic form exceeds this, the pdf is 0.}
}
\value{
For \code{dmultn}: the evaluated density.\\n
For \code{rmultn}: \eqn{p} random numbers.
}
\description{
Density function for the truncated multivariate normal distribution
}
\keyword{internal}
