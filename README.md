mfbvar
================

<!-- README.md is generated from README.Rmd. Please edit that file -->
``` r
library(mfbvar)
#> 
#> Attaching package: 'mfbvar'
#> The following object is masked from 'package:stats':
#> 
#>     smooth
Y <- mf_list$data[[192]][-1, -6]
n_burnin <- 5000
n_reps <- 10000
n_fcst <- 8
n_lags <- 4
n_vars <- ncol(Y)
n_T <- nrow(Y)
d <- matrix(1, nrow = n_T, ncol = 1, dimnames = list(1:nrow(Y), "const"))
d_fcst <- matrix(1, nrow = n_fcst, ncol = 1)
prior_nu <- n_vars + 2 
prior_Pi_AR1 <- rep(0, 5)
lambda1 <- 0.2
lambda2 <- 1
intervals <- matrix(c(6.5, 7.5,
                      0.4/3, 0.6/3,
                      0, 1,
                      -0.1, 0.1,
                      0.5, 0.65), ncol = 2, byrow = TRUE)
prior_psi_mean <- interval_to_moments(intervals)$prior_psi_mean
prior_psi_Omega <- interval_to_moments(intervals)$prior_psi_Omega

Lambda <- build_Lambda(c("identity", "identity", "identity", "identity", "average"), n_lags)
set.seed(10237)
mfbvar_obj <- mfbvar(Y, d, d_fcst, Lambda, prior_Pi_AR1, lambda1, lambda2, 
                     prior_nu, prior_psi_mean, prior_psi_Omega, 
                     n_lags, n_fcst, n_burnin, n_reps, verbose = FALSE) 
```

``` r
all(abs(mfbvar_obj$Z_new[,,10]-mfbvar_obj$Z[,,10])<1e-13)
#> [1] TRUE
all(abs(mfbvar_obj$Z_new[,,9999]-mfbvar_obj$Z[,,9999])<1e-13)
#> [1] TRUE
all(abs(mfbvar_obj$Sigma_new[,,10]-mfbvar_obj$Sigma[,,10])<1e-13)
#> [1] TRUE
all(abs(mfbvar_obj$Sigma_new[,,9999]-mfbvar_obj$Sigma[,,9999])<1e-13)
#> [1] TRUE
all(abs(mfbvar_obj$Pi_new[,,10]-mfbvar_obj$Pi[,,10])<1e-13)
#> [1] TRUE
all(abs(mfbvar_obj$Pi_new[,,9999]-mfbvar_obj$Pi[,,9999])<1e-13)
#> [1] TRUE
```
