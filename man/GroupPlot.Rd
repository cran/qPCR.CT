\name{GroupPlot}
\alias{GroupPlot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
 ~~PLOT all graph in the group ... ~~
}
\description{
  ~~ Plot all in barplot with Error Bar(se or sd) ~~
}
\usage{
GroupPlot(filename, con_group_name, tr_group_name, con_gene_name, repeatnum, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{filename}{
    ~~specific \code{filename} such as c: pcr.csv~~
}
  \item{con_group_name}{
     ~~set \code{con_group_name} ~~
}
  \item{tr_group_name}{
     ~~set \code{tr_group_name} here~~
}
  \item{con_gene_name}{
     ~~set \code{con_gene_name} here~~
}
  \item{repeatnum}{
     ~~set \code{repeatnum} here~~
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
 ~~yz pan, xy yan, jx li~~
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
function(filename, 
                  con_group_name,tr_group_name, 
                  con_gene_name, repeatnum, ... ){
                    
rawdata<-read.csv(filename)
unknown<-   subset(rawdata, Type != "NTC")
suppressWarnings(aggdata <-aggregate.data.frame(unknown, by=list(unknown$Fluor),FUN=mean, na.rm=TRUE))
#print(aggdata[1])
groups<-paste(aggdata[,1])
lengr <- length(groups)
temp<- data.frame()
i<- 1
for(i in 1: lengr)
{
   if(groups[i] != con_gene_name ){
     
          tr_gene_name <- groups[i] # assign group names
          temp <- Calc.Expr(filename=filename, con_group_name, tr_group_name, 
          con_gene_name = con_gene_name,tr_gene_name = tr_gene_name, repeatnum = repeatnum)
          plot.CT(temp)
   }
  }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
