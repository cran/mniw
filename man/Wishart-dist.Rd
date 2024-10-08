% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Wishart-dist.R
\name{Wishart-dist}
\alias{Wishart-dist}
\alias{dwish}
\alias{rwish}
\alias{diwish}
\alias{riwish}
\alias{dwishart}
\alias{rwishart}
\alias{Wishart}
\title{Wishart and Inverse-Wishart distributions.}
\usage{
dwish(X, Psi, nu, log = FALSE)

rwish(n, Psi, nu)

diwish(X, Psi, nu, log = FALSE)

riwish(n, Psi, nu)

dwishart(X, Psi, nu, inverse = FALSE, log = FALSE)

rwishart(n, Psi, nu, inverse = FALSE)
}
\arguments{
\item{X}{Argument to the density function.  Either a \verb{q x q} matrix or a \verb{q x q x n} array.}

\item{Psi}{Scale parameter.  Either a \verb{q x q} matrix or a \verb{q x q x n} array.}

\item{nu}{Degrees-of-freedom parameter.  A scalar or vector of length \code{n}.}

\item{log}{Logical; whether or not to compute the log-density.}

\item{n}{Integer number of random samples to generate.}

\item{inverse}{Logical; whether or not to use the Inverse-Wishart distribution.}
}
\value{
A vector length \code{n} for density evaluation, or an array of size \verb{q x q x n} for random sampling.
}
\description{
Densities and random sampling for the Wishart and Inverse-Wishart distributions.
}
\details{
The Wishart distribution \eqn{\boldsymbol{X} \sim \textrm{Wishart}(\boldsymbol{\Psi}, \nu)}{X ~ Wishart(\Psi, \nu)} on a symmetric positive-definite random matrix \eqn{\boldsymbol{X}}{X} of size \eqn{q \times q}{q x q} has PDF
\deqn{
f(\boldsymbol{X} \mid \boldsymbol{\Psi}, \nu) = \frac{|\boldsymbol{X}|^{(\nu-q-1)/2}\exp\big\{-\textrm{tr}(\boldsymbol{\Psi}^{-1}\boldsymbol{X})/2\big\}}{2^{q\nu/2}|\boldsymbol{\Psi}|^{\nu/2} \Gamma_q(\frac \nu 2)},
}{
f(X | \Psi, \nu) = [ |X|^((\nu-q-1)/2) * e^(-trace(\Psi^{-1} X)/2) ] / [ 2^(q\nu/2) * |\Psi|^(\nu/2) * \Gamma_q(\nu/2) ],
}
where \eqn{\Gamma_q(\alpha)} is the multivariate gamma function,
\deqn{
\Gamma_q(\alpha) = \pi^{q(q-1)/4} \prod_{i=1}^q \Gamma(\alpha + (1-i)/2).
}{
\Gamma_q(\alpha) = \pi^(q(q-1)/4) \prod_{i=1}^q \Gamma(\alpha + (1-i)/2).
}
The Inverse-Wishart distribution \eqn{\boldsymbol{X} \sim \textrm{Inverse-Wishart}(\boldsymbol{\Psi}, \nu)}{X ~ Inverse-Wishart(\Psi, \nu)} is defined as \eqn{\boldsymbol{X}^{-1} \sim \textrm{Wishart}(\boldsymbol{\Psi}^{-1}, \nu)}{X^{-1} ~ Wishart(\Psi^{-1}, \nu)}.

\code{dwish()} and \code{diwish()} are convenience wrappers for \code{dwishart()}, and similarly \code{rwish()} and \code{riwish()} are wrappers for \code{rwishart()}.
}
\examples{
# Random sampling

n <- 1e5
q <- 3
Psi1 <- crossprod(matrix(rnorm(q^2),q,q))
nu <- q + runif(1, 0, 5)

X1 <- rwish(n,Psi1,nu) # Wishart

# plot it
plot_fun <- function(X) {
  q <- dim(X)[1]
  par(mfrow = c(q,q))
  for(ii in 1:q) {
    for(jj in 1:q) {
      hist(X[ii,jj,], breaks = 100, freq = FALSE,
           xlab = "", main = parse(text = paste0("X[", ii, jj, "]")))
    }
  }
}

plot_fun(X1)

# "vectorized" scale parameeter
Psi2 <- 5 * Psi1
vPsi <- array(c(Psi1, Psi2), dim = c(q, q, n))
X2 <- rwish(n, Psi = vPsi, nu = nu)
plot_fun(X2)

# Inverse-Wishart
X3 <- riwish(n, Psi2, nu)
plot_fun(X3)

# log-density calculation for sampled values
par(mfrow = c(1,1))
hist(dwish(X2, vPsi, nu, log = TRUE),
     breaks = 100, freq = FALSE, xlab = "",
     main = expression("log-p"*(X[2]*" | "*list(Psi,nu))))
}
