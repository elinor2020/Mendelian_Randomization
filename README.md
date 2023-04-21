# Mendelian_Randomization
## Background 
In statistical epidemiology, genetic variants may be used to consider the causal effect of an exposure on an outcome. 
This method of exploration is called Mendelian randomization (MR). 
For this present study, single nucleotide polymorphisms (SNPs) are taken to be the genetic variants, total cholesterol (TC) 
is taken as the exposure, and Alzheimer’s disease (AD) is taken to be the outcome. The data are two summary datasets, 
each from a Genome-Wide Association Study (GWAS), with one dataset involving TC and the other dataset involving AD. 
The present goal is to estimate the casual effect of TC on AD, using the two GWAS summary datasets.

<p align="center">
<img src="https://user-images.githubusercontent.com/71567055/233535110-e3724732-c85d-4e7b-877b-6ec66bffacfe.png" width="400" height="200" />
</p>

Figure 1. Z represents the instrument variables (SNPs), U represents any confounder variables (possibly additional, unknown diseases or health-related states), X represents the exposure (TC), and Y represents the outcome (AD). The black “X”s show MR assumptions. The figure is taken from [1].

## Methods 
The R software package, TwoSampleMR [2], is employed to perform MR on the two sample datasets. The summary data from the TC GWAS was imported as the exposure dataset and clumping was performed to identify and exclude SNPs in linkage disequilibrium (LD). The data was then pre-processed: Missing values and duplicates were deleted from this dataset, now termed “exposure.” The summary data from the AD GWAS was imported as the “outcome” dataset and was pre-processed in a similar way as the exposure dataset. The data was then harmonized and lastly, pruned (pruned duplicate summary sets).

Sensitivity analyses were performed, using functions from the TwoSampleMR package, to check for pleiotropic bias. 

The causal effect of TC on AD was estimated by the following methods, namely, Fixed Effects Inverse Variance Weighted meta-analysis, MR- Egger, Weighted Median Estimators, and Weighted Mode Estimators. 

Lastly, a number of data visualizations were created, in order to highlight certain aspects of the causal effect analysis: a scatterplot of the SNP effects on the exposure versus the SNP effects on the outcome, a forest plot involving SNPs, a plot with leave-one-out analysis, and a funnel plot for examining heterogeneity.

## Results 








