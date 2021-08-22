load("D:/surff/Desktop/STAT 626/project/clean_data.RData")

spearman_rank <- project_data
spearman_rank$SP500_Rank <- rank(project_data$SP500)
spearman_rank$Income_Rank <- rank(project_data$Income)
spearman_rank$Rank_Delta2 <- (spearman_rank$SP500_Rank - spearman_rank$Income_Rank)^2

## spearman rank correlation coefficient
r_s <- (1-(6*(sum(spearman_rank$Rank_Delta2)))/(50*(50^2 -1)))
r_s

## H0: Corr=0
## H1: Corr<>0

## r_s = 0.82
## Critical value at a(2)=0.05 and n=50 is 0.279

## We reject the null, conclude there is a positive correlation
