% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ols.R
\name{ols_initialization}
\alias{ols_initialization}
\title{Initialize Gibbs sampler using OLS}
\usage{
ols_initialization(z, d, n_lags, n_T, n_vars, n_determ)
}
\arguments{
\item{z}{A matrix of size \code{(n_T + n_lags) * n_vars} of data.}

\item{d}{The matrix of size \code{(n_T + n_lags) * n_determ} of deterministic terms.}

\item{n_lags}{The number of lags.}

\item{n_T}{The number of time points.}

\item{n_vars}{The number of variables.}

\item{n_determ}{The number of deterministic terms.}
}
\value{
A list with components:
\item{Gam}{A matrix of size \code{n_vars * (n_vars*n_lags +n_determ)} of estimated parameters.}
\item{S}{Estimated error covariance matrix.}
\item{psi}{The estimated steady-state parameters.}
}
\description{
Initializes the Gibbs sampler using OLS.
}
\keyword{internal}
