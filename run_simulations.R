# This code demonstrates the utility of graph stability for paring down
# the parameter space of a given ERGM for parameter optimization. In this 
# example, the ERGM is a model for amyloid fibril aggregation first introduced
# in the work:
# 
# Grazioli, G., Yu, Y., Unhelkar, M. H., Martin, R. W., & Butts, C. T. (2019). 
# Network-based classification and modeling of amyloid fibrils. 
# The Journal of Physical Chemistry B, 123(26), 5452-5462.
# https://doi.org/10.1021/acs.jpcb.9b03494
# 
# and revisited in the later work:
#
# Yu, Y., Grazioli, G., Unhelkar, M. H., Martin, R. W., & Butts, C. T. (2020). 
# Network Hamiltonian models reveal pathways to amyloid fibril formation. 
# Scientific reports, 10(1), 1-11.
# https://doi.org/10.1038/s41598-020-72260-8
# 
# This particular code was created in support of the publication:
#
# Yu, Y., Grazioli, G., Phillips, N. E., & Butts, C. T.  
# Local Graph Stability in Exponential Family Random Graph Models. 
# (under R&R with the Society for Industrial and Applied Mathematics)
#
# This code was written by Gianmarc Grazioli.
#


library(ergm)
library(sna)

# Please see the sampleSimsPlot.pdf file for a graphical representation
# of the parameter space points used for these simulations. The points are
# imported into data.frames here:
cyanPoints<-read.csv("cyanPoints.csv", header = F)
greenPoints<-read.csv("greenPoints.csv", header = F)
redPoints<-read.csv("redPoints.csv", header = F)

# Here we define the parameters for the simulation:
nCount=48 #number of nodes
t<-2^(1:22) #array of incremental times 
simsEq<-vector(mode="list",length=length(t)) 
simsEq[[1]]<-network.initialize(nCount,directed=F)

# Here we define the parameter to be used for the simulations. If you would
# like to simulate using a different point, simply change cyanPoints to either
# greenPoints or redPoints to select from a different set, and change the row
# selection value to choose a different point from that set.
myPoint <- cyanPoints[1,]
theta=as.numeric(c(109-log(nCount), myPoint))

for(i in 1:length(t)){
  set.seed(301656)
  cat("Working on t=",t[i],"i.e. 2^(",i,")","\n", sep = "") 
  simsEq[[i+1]]<-simulate(simsEq[[i]]~edges+kstar(2)+nsp(1:2),
                          coef=theta, control=control.simulate.formula(MCMC.burn=t[i],
                          MCMC.interval=1), constraint=~bd(maxout=12)) 
  gplot(simsEq[[i+1]],gmode="graph",vertex.col = rgb(1,.6,0))
  Sys.sleep(.5)
}
