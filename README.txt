This code demonstrates the utility of graph stability for paring down the parameter space of a given ERGM for parameter optimization by demonstrating its application to parameterizing a network statistical model of amyloid fibril formation. The parameter space is shown in the file sampleSimsPlot.pdf, where, in region A, the stable parameters are plotted using a color scale ranging from black (zero fibril yield) to orange (fibril yield = 1, i.e. all nodes are part of a fibril). A selection of parameters from this space were then used in ERGM simulations, including high yield parameters from inside the stable region (B), lower yield parameters from within the stable region (C), as well as parameters from outside the stable region that produced a fibril yield of zero (D).

This ERGM model for amyloid fibril aggregation was first introduced in this work:

Grazioli, G., Yu, Y., Unhelkar, M. H., Martin, R. W., & Butts, C. T. (2019). 
Network-based classification and modeling of amyloid fibrils. 
The Journal of Physical Chemistry B, 123(26), 5452-5462.
https://doi.org/10.1021/acs.jpcb.9b03494

and then revisited in the later work:

Yu, Y., Grazioli, G., Unhelkar, M. H., Martin, R. W., & Butts, C. T. (2020). 
Network Hamiltonian models reveal pathways to amyloid fibril formation. 
Scientific reports, 10(1), 1-11.
https://doi.org/10.1038/s41598-020-72260-8
 
This code was created in support of the publication:

Yu, Y., Grazioli, G., Phillips, N. E., & Butts, C. T.  
Local Graph Stability in Exponential Family Random Graph Models. 
(under R&R with the Society for Industrial and Applied Mathematics)
Preprint: arXiv:1908.09470

This code and the accompanying figure were created by Gianmarc Grazioli.
