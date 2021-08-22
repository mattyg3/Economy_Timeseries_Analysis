## Testing out spearman's rank correlation

spearman_rank <- project_data
spearman_rank$SP500_Rank <- rank(project_data$SP500_logdiff)
spearman_rank$Income_Rank <- rank(project_data$Income_diff)
spearman_rank$Rank_Delta2 <- (spearman_rank$SP500_Rank - spearman_rank$Income_Rank)^2

## spearman rank correlation coefficient
r_s <- (1-(6*(sum(spearman_rank$Rank_Delta2)))/(50*(50^2 -1)))
r_s

f_r <- (0.5)*log((1+r_s)/(1-r_s))
z <- sqrt((50-3)/1.06)*f_r
z

## H0: Corr=0
## H1: Corr>0

## Z score = 1.87
## We reject the null, conclude there is a correlation
