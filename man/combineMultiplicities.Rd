% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tools.R
\name{combineMultiplicities}
\alias{combineMultiplicities}
\title{Combine workspaces for multiplicity filtering}
\usage{
combineMultiplicities(workspaces)
}
\arguments{
\item{workspaces}{A vector of \code{msmsWorkspace} items. The first item is
taken as the "authoritative" workspace, i.e. the one which will be used
for the record generation. The subsequent workspaces will only be used
for multiplicity filtering.}
}
\value{
A \code{msmsWorkspace} object prepared for step 8 processing.
}
\description{
Combines multiple msmsWorkspace items to one workspace which is used for
multiplicity filtering.
}
\details{
This feature is particularily meant to be used in 
conjunction with the \code{confirmMode} option of \code{\link{msmsWorkflow}}:
a file can be analyzed with \code{confirmMode = 0} (default) and subsequently
with \code{confirmMode = 1} (take second highest scan). The second analysis
should contain "the same" spectra as the first one (but less intense) and can
be used to confirm the peaks in the first spectra.

TO DO: Enable the combination of workspaces for combining e.g. multiple
energy settings measured separately.
}
\examples{
\dontrun{
	w <- newMsmsWorkspace
 w@files <- c("spec1", "spec2")
 w1 <- msmsWorkflow(w, steps=c(1:7), mode="pH")
 w2 <- msmsWorkflow(w, steps=c(1:7), mode="pH", confirmMode = 1)
 wTotal <- combineMultiplicities(c(w1, w2))
 wTotal <- msmsWorkflow(wTotal, steps=8, mode="pH", archivename = "output")
 # continue here with mbWorkflow 
}

}
\author{
Stravs MA, Eawag <michael.stravs@eawag.ch>
}
\seealso{
\code{\link{msmsWorkspace-class}}
}

