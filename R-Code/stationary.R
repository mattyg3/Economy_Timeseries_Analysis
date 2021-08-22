# read data
load("clean_data.RData")
income <- ts(project_data$Income, start = 1968, end = 2017)
sp <- ts(project_data$SP500, start = 1968, end = 2017)
sp_return <- ts(project_data$SP500_logdiff[2:50], start = 1969, end = 2017)
delta_income <- ts(project_data$Income_diff[2:50], start = 1969, end = 2017)

# visualize
par(mfrow = c(2, 2))
plot(income, main = "U.S. Median Income")
plot(sp, main = "S&P 500 Index")
acf(income)
acf(sp)

# before and after plots
png("5-Stationarity/BeforeAfter_tsplots.png", width = 800, height = 800)
par(mfrow = c(2, 2))
plot(income, main = "U.S. Median Income")
plot(sp, main = "S&P 500 Index")
plot(delta_income, main = "1-Lag difference of U.S. Median Income")
abline(h = mean(delta_income), lty = 2, lwd = 2, col = 2)
plot(sp_return, main = "1-Lag difference log S&P 500 Index")
abline(h = mean(sp_return), lty = 2, lwd = 2, col = 2)
dev.off()

# before and after acf plots
png("5-Stationarity/BeforeAfter_ACF.png", width = 800, height = 800)
par(mfrow = c(2, 2))
acf(income, main = "ACF of U.S. Median Income")
acf(sp, main = "ACF of S&P 500 Index")
acf(delta_income, main = "ACF of 1-lag difference U.S. Median Income")
acf(sp_return, main = "ACF of 1-lag difference of log S&P Index")
dev.off()
