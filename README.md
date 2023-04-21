# Mendelian_Randomization
## Background 
In statistical epidemiology, genetic variants may be used to consider the causal effect of an exposure on an outcome. In this study, single nucleotide polymorphisms (SNPs) are the genetic variants, total cholesterol (TC) is the exposure, and Alzheimer’s disease (AD) is the outcome. The data are two summary datasets from a Genome-Wide Association Study (GWAS) for TC and AD, respectively. The present goal is to estimate the casual effect of TC on AD, using these two GWAS summary datasets.

<p align="center">
<img src="https://user-images.githubusercontent.com/71567055/233743010-301b2bc3-5a51-4a54-9636-6f03f04eee29.png" width="400" height="200" />
</p>

Figure 1. Z represents the instrument variables (SNPs), U equals any confounder variables (possibly additional, unknown diseases or health-related states), X represents the exposure (TC), and Y equals the outcome (AD). The black “X”s show MR assumptions. The figure is taken from [1].

## Methods 
The R software package, TwoSampleMR [2], is employed to perform Mendelian Randomization (MR) on the two sample datasets. The summary data from the TC GWAS is imported as the exposure dataset and clumping is performed to identify and exclude SNPs in linkage disequilibrium (LD). The summary data from the AD GWAS is imported as the outcome dataset. Preprocessing is performed on both datasets. The data is harmonized and pruned for duplicate summary sets.

Sensitivity analyses are performed to check for pleiotropic bias. 

The causal effect of TC on AD is estimated by the following methods, namely, Fixed Effects Inverse Variance Weighted meta-analysis, MR-Egger, Weighted Median Estimators, and Weighted Mode Estimators. 

Lastly, a number of data visualizations are created to highlight certain aspects of the causal effect analysis.

## Results

<p align="center">
<img src="https://user-images.githubusercontent.com/71567055/233743409-41941d4c-61fd-421e-aae6-20f3299cae0e.png" width="400" height="200" />
</p>

Table 1. The MR-Egger intercept is not significant (p-value > 0.05), but the Q p-values show that the Q values are significant. It may be that some of the SNPs are pleiotropic.

<p align="center">
<img src="https://user-images.githubusercontent.com/71567055/233743630-8eb4137d-8662-4af3-bf3b-ca0c6eae04f3.png" width="400" height="200" />
</p>

Table 2. The causal effect of TC levels on AD is computed using IVW (Fixed Effects), MR- Egger, Weighted Median Estimators, and Weighted Mode Estimators. The p-values exceed 0.05, so the results are not significant at the 95% threshold.

<p align="center">
<img src="https://user-images.githubusercontent.com/71567055/233743863-dbd0f858-d1c3-4326-b994-989eca5980c3.png" width="400" height="200" />
</p>

Figure 2. A scatterplot of the SNP effects on the outcome as a function of the SNP effects on the exposure. 

<p align="center">
<img src="https://user-images.githubusercontent.com/71567055/233744072-938cb994-4223-45b4-9baf-975d68e42747.png" width="400" height="200" />
</p>

Figure 3. This forest plot helps to determine that there is some heterogeneity in the range of the MR estimates.

<p align="center">
<img src="https://user-images.githubusercontent.com/71567055/233744260-e6e47743-2424-4987-9104-86c96be97a68.png" width="400" height="200" />
</p>

Figure 4. This leave-one-out plot examines which SNP has a significant effect: One SNP is left out and an IVW analysis is performed using the remaining SNPs.

<p align="center">
<img src="https://user-images.githubusercontent.com/71567055/233744395-2daa3598-a586-4232-9d2f-99af3c32910d.png" width="400" height="200" />
</p>

Figure 5. A funnel plot is useful for checking heterogeneity. Here the data points lie asymmetrically about the vertical lines (IVW and MR Egger are represented by vertical lines), meaning that there appears to be evidence for a pleiotropic effect. 

## Conclusion 
The R package TwoSampleMR is used to assess the effect of TC on AD. Significance p-values are not found for each of the MR methods, possibly because the “LD Reference Panel” was used for clumping.

## References
[1] https://en.wikipedia.org/wiki/Mendelian_randomization

[2] Hemani G, et al., The MR-Base Collaboration. The MR-Base platform supports systematic causal inference across the human phenome. eLife 2018;7:e34408.









