% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/interface.R
\name{summary.mfbvar_ss}
\alias{summary.mfbvar_ss}
\title{Summary method for class \code{mfbvar_ss}}
\usage{
\method{summary}{mfbvar_ss}(object, ...)
}
\arguments{
\item{object}{object of class \code{mfbvar_ss}}

\item{...}{Currently not in use.}
}
\description{
Method for summarizing \code{mfbvar_ss} objects.
}
\examples{
prior_obj <- set_prior(Y = mf_sweden[, 4:5], d = "intercept",
                       freq = c("m", "q"), n_lags = 4, n_burnin = 20, n_reps = 20,
                       n_fcst = 4)

prior_intervals <- matrix(c(-0.1, 0.1,
                            0.4, 0.6), ncol = 2, byrow = TRUE)
psi_moments <- interval_to_moments(prior_intervals)
prior_psi_mean <- psi_moments$prior_psi_mean
prior_psi_Omega <- psi_moments$prior_psi_Omega
prior_obj <- update_prior(prior_obj,
                          prior_psi_mean = prior_psi_mean,
                          prior_psi_Omega = prior_psi_Omega)

mod_ss <- estimate_mfbvar(prior_obj, prior_type = "ss")
summary(mod_ss)

}
