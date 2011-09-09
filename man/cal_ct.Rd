\name{cal_ct}
\alias{cal_ct}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
 ~~caculate CT in PCR ... ~~
}
\description{
  ~~ USE delta delta CT method to calculate the expression differnce ~~
}
\usage{
cal_ct(con.con, tr.con, con.tr, tr.tr)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{con.con}{
    CT value of control group control gene  
    ~~Describe \code{con.con} here~~
}
  \item{tr.con}{
     CT value of treat group control gene  
	 ~~Describe \code{tr.con} here~~
}
  \item{con.tr}{
    CT value of control group target gene  
	~~Describe \code{con.tr} here~~
}
  \item{tr.tr}{
  CT value of treat group target gene  
    ~~Describe \code{tr.tr} here~~
}
}
\details{
  These are CT values from the dataset!
}
\value{
  ~Describe the value returned
  If it is a LIST, use
  \item{comp1 }{Description of 'comp1'}
  \item{comp2 }{Description of 'comp2'}
 ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
  ~~YZ Pan, XY Yan, JX Li~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(con.con, tr.con, con.tr, tr.tr)
{
  #get length of data
  lcc <- length(con.con)
  ltc <- length(tr.con)
  lct <- length(con.tr)
  ltt <- length(tr.tr)
  #check length
  if(lcc == 0 || ltc == 0 || lct == 0 || ltt ==0)
  {
    cat("Invalid dataset! Length of dataset is 0. Please check dataset!")
  } else if ((lcc != ltc) || (lcc != lct) || (lcc!=ltt) || (ltc != lct) || (lct != ltt)) {
    cat("Invalid dataset! The length of dataset is not equal.Please check dataset!")
  } else {
    mean.cc <- mean(con.con)
    mean.tc <- mean(tr.con)
    mean.ct <- mean(con.tr)
    mean.tt <- mean(tr.tr)
    dcon.tr <- con.tr - mean.cc
    dtr.tr  <- tr.tr  - mean.tc
    mean.dcon.tr <- mean(dcon.tr)
    mean.dtr.tr <- mean(dtr.tr)
    ddcon.tr <- dcon.tr - mean.dcon.tr
    ddtr.tr  <- dtr.tr  - mean.dcon.tr
    two.ddcon.tr <- 2^ddcon.tr
    two.ddtr.tr <- 2^ddtr.tr
    mean.two.ddcon.tr <- mean(two.ddcon.tr)
    mean.two.ddtr.tr <- mean(two.ddtr.tr)
    final.con <- two.ddcon.tr / mean.two.ddcon.tr
    final.tr  <- two.ddtr.tr /  mean.two.ddcon.tr
    final <- data.frame(final.con, final.tr)
    return(final)
  }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
