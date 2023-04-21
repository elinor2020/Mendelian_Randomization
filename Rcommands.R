# Import libraries
library(MRPracticals)
library(TwoSampleMR)

# Create exposure file: (TCadj.tsv is an unmodified copy of TC.tsv)
tc_exp_dat2 <- read_exposure_data("~/Desktop/Research-Challenge/data/TCadj.tsv", clump = FALSE, sep = "\t", phenotype_col = "TRAIT", snp_col = "SNP", beta_col = "BETA", se_col = "SE", eaf_col = "AF", effect_allele_col = "REF", other_allele_col = "ALT", pval_col = "P", samplesize_col = "N", min_pval = 1e-200, chr_col = "CHROM", pos_col = "POS")

# Pre-processing for Exposure file:
# Remove NAs
tc_exp_dat3 <- na.omit(tc_exp_dat2)
# Remove duplicates
tc_exp_dat4 <- tc_exp_dat[!duplicated(tc_exp_dat3), ]

# Clump data
tc_exp_dat <- clump_data(tc_exp_dat4)

# Create Outcome file: (ADadj.tsv is an unmodified copy of AD.tsv)
outcome_dat2 <- read_outcome_data(snps = tc_exp_dat$SNP, filename = "~/Desktop/Research-Challenge/data/ADadj.tsv", sep = "\t", phenotype_col = "TRAIT", snp_col = "SNP", beta_col = "BETA", se_col = "SE", eaf_col = "AF", effect_allele_col = "REF", other_allele_col = "ALT", pval_col = "P", samplesize_col = "N", min_pval = 1e-200, log_pval = FALSE, chr_col = "CHROM", pos_col = "POS")

# Pre-processing for Outcome file:
outcome_dat3 <- na.omit(outcome_dat2)
ad_outcome_dat <- outcome_dat3[!duplicated(outcome_dat3), ]

# Harmonize data:
H_dat <- harmonise_data(exposure_dat = tc_exp_dat, outcome_dat = ad_outcome_dat)

# Power prune the data:
H_dat_prune <- power_prune(H_dat) # This is pruning duplicate summary sets

# Sensitivity analyses: it is useful to evaluate heterogeneity as a measure of possible pleiotropic bias
sen <- mr_pleiotropy_test(H_dat_prune)

# Obtain Q statistics for heterogeneity with respect to IVW and MR-Egger: 
Qstat <- mr_heterogeneity(H_dat_prune, method_list=c("mr_egger_regression", "mr_ivw_fe"))

# MR statistics
res_full <- mr(H_dat_prune, method_list=c("mr_ivw_fe", "mr_egger_regression", "mr_weighted_median", "mr_weighted_mode"))

# Plots
# plot1: scatter plot
plot1 <- mr_scatter_plot(res_full, H_dat_prune)

# plot2: forest plot
res_single <- mr_singlesnp(H_dat_prune) 
plot2 <- mr_forest_plot(res_single)

# plot3: leaveoneout plot
res_loo <- mr_leaveoneout(H_dat_prune) 
plot3 <- mr_leaveoneout_plot(res_loo)

# plot4: funnel plot
plot4 <- mr_funnel_plot(res_single)

