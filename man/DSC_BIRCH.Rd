\name{DSC_BIRCH}
\alias{DSC_BIRCH}
\alias{BIRCH}
\alias{birch}
\title{Balanced Iterative Reducing Clustering using Hierarchies}
\usage{
DSC_BIRCH(treshold, branching, maxLeaf, maxMem = 0, outlierThreshold = 0.25)
}
\arguments{
\item{treshold}{treshold used to check whether a new datapoint can be absorbed or not}

\item{branching}{branching factor (maximum amount of child nodes for a nonleaf node) of the CF-Tree.}

\item{maxLeaf}{maximum number of entries within a leaf node}

\item{outlierThreshold}{threshold for identifying outliers when rebuilding the CF-Tree}

\item{maxMem}{memory limitation for the whole CFTree in bytes. Default is 0, indicating no memory restriction.}
}
\description{
BIRCH builds a balanced-tree of Clustering Features (CFs) to summarize the stream.
A CF is a tuple (n, LS, SS) which represents a cluster by storing the number of elements (n), their linear sum (LS) and their squared sum (SS).
Each new observation descends the tree by following its closest CF until a leaf node is reached.
It is either merged into its closest leaf-CF or inserted as a new one.
All leaf-CFs form the micro-clusters. Rebuilding the tree is realized by inserting all leaf-CF nodes into a new tree structure with an increased treshold.
}
\examples{
stream <- DSD_Gaussians(k = 3, d = 2)

BIRCH <- DSC_BIRCH(treshold = .1, branching = 8, maxLeaf = 20)
update(BIRCH, stream, n = 500)

plot(BIRCH,stream)

}
\author{
Dennis Assenmacher (\email{Dennis.Assenmacher@uni-muenster.de}),
Matthias Carnein (\email{Matthias.Carnein@uni-muenster.de})
}
\references{
Zhang T, Ramakrishnan R and Livny M (1996), "BIRCH: An Efficient Data Clustering Method for Very Large Databases", \emph{In Proceedings of the 1996 ACM SIGMOD International Conference on Management of Data.} Montreal, Quebec, Canada , pp. 103-114. ACM.

Zhang T, Ramakrishnan R and Livny M (1997), "BIRCH: A new data clustering algorithm and its applications", \emph{Data Mining and Knowledge Discovery.} Vol. 1(2), pp. 141-182.
}

