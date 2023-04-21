# Mendelian_Randomization
## Background 
In statistical epidemiology, genetic variants may be used to consider the causal effect of an exposure on an outcome. 
This method of exploration is called Mendelian randomization (MR). 
For this present study, single nucleotide polymorphisms (SNPs) are taken to be the genetic variants, total cholesterol (TC) 
is taken as the exposure, and Alzheimer’s disease (AD) is taken to be the outcome. The data are two summary datasets, 
each from a Genome-Wide Association Study (GWAS), with one dataset involving TC and the other dataset involving AD. 
The present goal is to estimate the casual effect of TC on AD, using the two GWAS summary datasets.

![image](https://user-images.githubusercontent.com/71567055/233535110-e3724732-c85d-4e7b-877b-6ec66bffacfe.png)
Figure 1. Z represents the instrument variables (SNPs), U represents any confounder variables (possibly additional, unknown diseases or health-related states), X represents the exposure (TC), and Y represents the outcome (AD). The black “X”s show MR assumptions. The figure is taken from [1].




