\name{Calc.Expr}
\alias{Calc.Expr}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
calculate the relative expression
}
\description{
use control gene and ddCT methods to calculate the difference

}
\usage{
Calc.Expr(filename, con_group_name, tr_group_name, con_gene_name = "18s", tr_gene_name, repeatnum = 3, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{filename}{
%%     ~~Describe \code{filename} here~~
}
  \item{con_group_name}{
%%     ~~Describe \code{con_group_name} here~~
}
  \item{tr_group_name}{
%%     ~~Describe \code{tr_group_name} here~~
}
  \item{con_gene_name}{
%%     ~~Describe \code{con_gene_name} here~~
}
  \item{tr_gene_name}{
%%     ~~Describe \code{tr_gene_name} here~~
}
  \item{repeatnum}{
%%     ~~Describe \code{repeatnum} here~~
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
YZ Pan, XY Yan, JX Li
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
function(filename, con_group_name, tr_group_name, 
                    con_gene_name= "18s",tr_gene_name, 
                    repeatnum = 3, ... )
{
#load data
  rawdata<-read.csv(filename)
#subset data
  unknown<-   subset(rawdata, Type != "NTC")
  num    <-   length(unknown$Type)
  groupnum <- num/repeatnum
  con_group<- subset(unknown, Identifier == con_group_name)
  tr_group <- subset(unknown, Identifier == tr_group_name)
  con_group_con<- subset(con_group, Fluor == con_gene_name)
  tr_group_con <- subset(tr_group, Fluor == con_gene_name)
  con_group_tr <- subset(con_group, Fluor == tr_gene_name)
  tr_group_tr  <- subset(tr_group, Fluor == tr_gene_name)
#read CT value, convert the factors into CT number
  con.con<-con_group_con[6]
  con.con<-as.numeric(paste(con.con[[1]]))
  tr.con<- tr_group_con[6]
  tr.con<- as.numeric(paste(tr.con[[1]]))
  con.tr<- con_group_tr[6]
  con.tr<- as.numeric(paste(con.tr[[1]]))
  tr.tr <- tr_group_tr[6]
  tr.tr <- as.numeric(paste(tr.tr[[1]]))
#calculate 
  cal.CT <- cal_ct(con.con,tr.con,con.tr,tr.tr)
#output data
  names(cal.CT) <- c(con_group_name , tr_group_name)
#return data
  return(cal.CT)

  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
