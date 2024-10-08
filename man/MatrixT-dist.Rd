% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MatrixT-dist.R
\name{MatrixT-dist}
\alias{MatrixT-dist}
\alias{dMT}
\alias{rMT}
\alias{MatrixT}
\title{The Matrix-t distribution.}
\usage{
dMT(X, Lambda, SigmaR, SigmaC, nu, log = FALSE)

rMT(n, Lambda, SigmaR, SigmaC, nu)
}
\arguments{
\item{X}{Argument to the density function.  Either a \verb{p x q} matrix or a \verb{p x q x n} array.}

\item{Lambda}{Mean parameter.  Either a \verb{p x q} matrix or a \verb{p x q x n} array.}

\item{SigmaR}{Between-row covariance matrix.  Either a \verb{p x p} matrix or a \verb{p x p x n} array.}

\item{SigmaC}{Between-column covariance matrix  Either a \verb{q x q} matrix or a \verb{q x q x n} array.}

\item{nu}{Degrees-of-freedom parameter.  A scalar or vector of length \code{n}.}

\item{log}{Logical; whether or not to compute the log-density.}

\item{n}{Integer number of random samples to generate.}
}
\value{
A vector length \code{n} for density evaluation, or an array of size \verb{p x q x n} for random sampling.
}
\description{
Density and sampling for the Matrix-t distribution.
}
\details{
The Matrix-T distribution \eqn{\boldsymbol{X} \sim \textrm{Matrix-T}(\boldsymbol{\Lambda}, \boldsymbol{\Sigma}, \boldsymbol{\Psi}, \nu)}{X ~ Matrix-T(\Lambda, \Sigma, \Psi, \nu)} on a random matrix \eqn{\boldsymbol{X}_{p \times q}}{X_(p x q)} is the marginal distribution of \eqn{\boldsymbol{X}}{X} in \eqn{(\boldsymbol{X}, \boldsymbol{V}) \sim \textrm{MNIW}(\boldsymbol{\Lambda}, \boldsymbol{\Sigma}, \boldsymbol{\Psi}, \nu)}{(X, V) ~ MNIW(\Lambda, \Sigma, \Psi, \nu)}, where the Matrix-Normal Inverse-Wishart (MNIW) distribution is defined in \link{MNIW-dist}.
}
