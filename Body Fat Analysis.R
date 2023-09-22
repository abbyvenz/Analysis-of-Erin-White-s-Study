# Read in and Name the data 
bodyfat = read.csv("https://raw.githubusercontent.com/abbyvenz/bodyfat/main/bodyfat.csv")

# Load necessary libraries
library(dplyr); library(rstatix); library(ggplot2)

# Name the columns of interest, for use in the analysis
HAWTLC <- bodyfat$Fat_HAWTLCall
HBWTLC <- bodyfat$Fat_HBWTLCall
HBWRV <- bodyfat$Fat_HBWRVall
# At any point, to get the exact names of the 
# three columns of interest, use: names(bodyfat[6:8])


# Plots of Pairwise Relationships:

## HAWTLC vs. HBWTLC
ggscatter(bodyfat[, c(6, 7)], x = "Fat_HAWTLCall", y = "Fat_HBWTLCall", add = "reg.line", conf.int = TRUE, cor.coef = TRUE, cor.method = "pearson", xlab = "Percent Body Fat", ylab = "Percent Body Fat")

## HAWTLC vs. HBWRV
ggscatter(bodyfat[, c(6, 8)], x = "Fat_HAWTLCall", y = "Fat_HBWRVall", add = "reg.line", conf.int = TRUE, cor.coef = TRUE, cor.method = "pearson", xlab = "Percent Body Fat", ylab = "Percent Body Fat")

## HBWTLC vs. HBWRV
ggscatter(bodyfat[, c(7, 8)], x = "Fat_HBWTLCall", y = "Fat_HBWRVall", add = "reg.line", conf.int = TRUE, cor.coef = TRUE, cor.method = "pearson", xlab = "Percent Body Fat", ylab = "Percent Body Fat")


# Summary Statistics of HAWTLC, HBWTLC, HBWRV:
names(bodyfat)
get_summary_stats(bodyfat[,6:8], type = "mean_sd")


# Correlations:

## HAWTLC & HBWTLC
cor.test(HAWTLC, HBWTLC)

## HAWTLC & HBWRV
cor.test(HAWTLC, HBWRV)

## HBWTLC & HBWRV
cor.test(HBWTLC, HBWRV)


# Paired t-tests:

## HAWTLC vs. HBWTLC
HAWTLC.vs.HBWTLC <- t.test(HAWTLC, HBWTLC, paired = TRUE)
HAWTLC.vs.HBWTLC

## HAWTLC vs. HBWRV
HAWTLC.vs.HBWRV <- t.test(HAWTLC, HBWRV, paired = TRUE)
HAWTLC.vs.HBWRV

## HBWTLC vs. HBWRV
HBWTLC.vs.HBWRV <- t.test(HBWTLC, HBWRV, paired = TRUE)
HBWTLC.vs.HBWRV






