% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/selacSim.R
\name{SelonSimulator}
\alias{SelonSimulator}
\title{Simulate DNA under the SELON model}
\usage{
SelonSimulator(phy, pars, nuc.optim_array, nuc.model, diploid = TRUE)
}
\arguments{
\item{phy}{The phylogenetic tree with branch lengths.}

\item{pars}{A vector of parameters used for the simulation. They are ordered as follows: a0, a1, a2, Ne, base.freqs for A C G, and the nucleotide rates.}

\item{nuc.optim_array}{A vector of optimal nucleotide for each site to be simulated.}

\item{nuc.model}{Indicates what type nucleotide model to use. There are three options: "JC", "GTR", or "UNREST".}

\item{diploid}{A logical indicating whether or not the organism is diploid or not.}
}
\description{
Simulates nucleotide data based on parameters under the SELAC model
}
\details{
Simulates a nucleotide matrix using parameters under the SELON model. Note that the output can be written to a fasta file using the write.dna() function in the \code{ape} package.
}

