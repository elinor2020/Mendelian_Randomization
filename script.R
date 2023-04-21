# Import libraries
library(MRPracticals)
library(TwoSampleMR)

# Create exposure file: (TCadj.tsv is an unmodified copy of TC.tsv)
tc_exp_datadj <- read_exposure_data("~/Desktop/Research-Challenge/data/TCadj.tsv", clump = FALSE, sep = "\t", phenotype_col = "TRAIT", snp_col = "SNP", beta_col = "BETA", se_col = "SE", eaf_col = "AF", effect_allele_col = "REF", other_allele_col = "ALT", pval_col = "P", samplesize_col = "N", min_pval = 1e-200, chr_col = "CHROM", pos_col = "POS")

# Pre-processing for Exposure file:
# Remove NAs
tc_exp_dat2 <- na.omit(tc_exp_datadj)
# Remove duplicates
tc_exp_dat3 <- tc_exp_dat[!duplicated(tc_exp_dat2), ]

# Clumping
tc_exp_dat <- clump_data(tc_exp_dat3)

# Create Outcome file: (ADadj.tsv is an unmodified copy of AD.tsv)
outcome_dat2 <- read_outcome_data(snps = tc_exp_dat$SNP, filename = "~/Desktop/Research-Challenge/data/ADadj.tsv", sep = "\t", phenotype_col = "TRAIT", snp_col = "SNP", beta_col = "BETA", se_col = "SE", eaf_col = "AF", effect_allele_col = "REF", other_allele_col = "ALT", pval_col = "P", samplesize_col = "N", min_pval = 1e-200, log_pval = FALSE, chr_col = "CHROM", pos_col = "POS")

# Pre-processing for Outcome file:
# Remove NAs
outcome_dat3 <- na.omit(outcome_dat2)
# Remove duplicates
ad_outcome_dat <- outcome_dat3[!duplicated(outcome_dat3), ]

# Harmonize data:
H_dat <- harmonise_data(exposure_dat = tc_exp_dat, outcome_dat = ad_outcome_dat)

# Power prune the data:
H_dat_prune <- power_prune(H_dat)

# MR statistics
res <- mr(H_dat_prune, method_list=c("mr_ivw_fe", "mr_egger_regression", "mr_weighted_median", "mr_weighted_mode"))
res

# Plots

# Plot1 - scatterplot with four methods
# Depict the relationship of the SNP effects on the exposure against the SNP effects on the outcome using a scatter plot:
plot1 <- mr_scatter_plot(res, H_dat_prune)
plot1

# Plot2
# Produce a forest plot using estimates obtained from individual SNPs:
res_single <- mr_singlesnp(H_dat_prune)
plot2 <- mr_forest_plot(res_single)
plot2

# Plot3
# Plot showing results from performing leave-one-out analyses:
res_loo <- mr_leaveoneout(H_dat_prune)
plot3 <- mr_leaveoneout_plot(res_loo)
plot3

# Plot4 - funnel plot
plot4 <- mr_funnel_plot(res_single)
plot4

# Sensitivity analyses: It is useful to evaluate heterogeneity as a measure of possible pleiotropic bias
sens <- mr_pleiotropy_test(H_dat_prune)
sens

# Obtain Q statistics for heterogeneity with respect to IVW and MR-Egger:
Qstats <- mr_heterogeneity(H_dat_prune, method_list=c("mr_egger_regression", "mr_ivw"))
Qstats

# end of script









