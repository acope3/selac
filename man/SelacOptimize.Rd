% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/selac.R
\name{SelacOptimize}
\alias{SelacOptimize}
\title{Efficient optimization of the SELAC model}
\usage{
SelacOptimize(codon.data.path, n.partitions = NULL, phy,
  data.type = "codon", codon.model = "selac", edge.length = "optimize",
  edge.linked = TRUE, optimal.aa = "optimize", nuc.model = "GTR",
  include.gamma = FALSE, gamma.type = "quadrature", ncats = 4,
  numcode = 1, diploid = TRUE, k.levels = 0, aa.properties = NULL,
  verbose = FALSE, n.cores.by.gene = 1, n.cores.by.gene.by.site = 1,
  max.tol = .Machine$double.eps^0.5, max.evals = 1e+06, max.restarts = 3,
  user.optimal.aa = NULL, fasta.rows.to.keep = NULL,
  recalculate.starting.brlen = TRUE, output.by.restart = TRUE,
  output.restart.filename = "restartResult",
  user.supplied.starting.param.vals = NULL, tol.step = 1,
  optimizer.algorithm = "NLOPT_LN_SBPLX")
}
\arguments{
\item{codon.data.path}{Provides the path to the directory containing the gene specific fasta files of coding data. Must have a ".fasta" line ending.}

\item{n.partitions}{The number of partitions to analyze. The order is based on the Unix order of the fasta files in the directory.}

\item{phy}{The phylogenetic tree to optimize the model parameters.}

\item{data.type}{The data type being tested. Options are "codon" or "nucleotide".}

\item{codon.model}{The type of codon model to use. There are four options: "none", "GY94", "FMutSel0", "selac".}

\item{edge.length}{Indicates whether or not edge lengths should be optimized. By default it is set to "optimize", other option is "fixed", which user-supplied branch lengths.}

\item{edge.linked}{A logical indicating whether or not edge lengths should be optimized separately for each gene. By default, a single set of each lengths is optimized for all genes.}

\item{optimal.aa}{Indicates what type of optimal.aa should be used. There are five options: "none", "majrule", "averaged, "optimize", or "user".}

\item{nuc.model}{Indicates what type nucleotide model to use. There are three options: "JC", "GTR", or "UNREST".}

\item{include.gamma}{A logical indicating whether or not to include a discrete gamma model.}

\item{gamma.type}{Indicates what type of gamma distribution to use. Options are "quadrature" after the Laguerre quadrature approach of Felsenstein 2001 or median approach of Yang 1994.}

\item{ncats}{The number of discrete categories.}

\item{numcode}{The ncbi genetic code number for translation. By default the standard (numcode=1) genetic code is used.}

\item{diploid}{A logical indicating whether or not the organism is diploid or not.}

\item{k.levels}{Provides how many levels in the polynomial. By default we assume a single level (i.e., linear).}

\item{aa.properties}{User-supplied amino acid distance properties. By default we assume Grantham (1974) properties.}

\item{verbose}{Logical indicating whether each iteration be printed to the screen.}

\item{n.cores.by.gene}{The number of cores to dedicate to parallelize analyses across gene.}

\item{n.cores.by.gene.by.site}{The number of cores to decidate to parallelize analyses by site WITHIN a gene. Note n.cores.by.gene*n.cores.by.gene.by.site is the total number of cores dedicated to the analysis.}

\item{max.tol}{Supplies the relative optimization tolerance.}

\item{max.evals}{Supplies the max number of iterations tried during optimization.}

\item{max.restarts}{Supplies the number of random restarts.}

\item{user.optimal.aa}{If optimal.aa is set to "user", this option allows for the user-input optimal amino acids. Must be a list. To get the proper order of the partitions see "GetPartitionOrder" documentation.}

\item{fasta.rows.to.keep}{Indicates which rows to remove in the input fasta files.}

\item{recalculate.starting.brlen}{Whether to use given branch lengths in the starting tree or recalculate them.}

\item{output.by.restart}{Logical indicating whether or not each restart is saved to a file. Default is TRUE.}

\item{output.restart.filename}{Designates the file name for each random restart.}

\item{user.supplied.starting.param.vals}{Designates user-supplied starting values for C.q.phi.Ne, Grantham alpha, and Grantham beta. Default is NULL.}

\item{tol.step}{If > 1, makes for coarser tolerance at earlier iterations of the optimizer}

\item{optimizer.algorithm}{The optimizer used by nloptr.}
}
\description{
Efficient optimization of model parameters under the SELAC model
}
\details{
Here we optimize parameters across each gene separately while keeping the shared parameters, alpha, beta, edge lengths, and nucleotide substitution parameters constant across genes. We then optimize alpha, beta, gtr, and the edge lengths while keeping the rest of the parameters for each gene fixed. This approach is potentially more efficient than simply optimizing all parameters simultaneously, especially if fitting models across 100's of genes.
}

